/*
    Basic 8-bit integer clock divider.
    div >= 1 divides the input clock by div.
*/
module clkdiv (
    input wire clk_i,
    input wire nrst_i,
    input wire [7:0] div_i, // Must be >= 1

    output wire clk_o
);

    reg [7:0] counter;
    reg clk_prescaled;

    assign clk_o = (div_i == 8'd1) ? clk_i : clk_prescaled;

    always @ (posedge clk_i or negedge nrst_i) begin
        if (!nrst_i) begin
            clk_prescaled <= 1'b0;
            counter <= 0;
        end
        else if (clk_i) begin
            counter <= counter + 8'd1; // Add must come before everything
            if (counter >= (div_i - 8'd1)) begin
                counter <= 0;
            end
            clk_prescaled <= (counter < {1'b0, div_i[7:1]}) ? 1'b1 : 1'b0;
        end
    end
endmodule

/*
    320x240 @ 60Hz (6MHz pixel clock) VGA output module.
    Does line doubling/pixel doubling to get smaller
    resolutions.

    Uses 640x480 @ 60Hz (24MHz pixel clock) as a base resolution.

    Using "stock" 640x480 should give us better monitor
    compatability. Doesn't cost us any performance either
    since lines are burst-read and cached.
*/
module vga #(
    parameter FB0_ADDR = 0,
    parameter FB1_ADDR = 0
) (
    input wire clk_i, // Must be an integer multiple of 24MHz
    input wire nrst_i,

    input wire enable_i,
    input wire [3:0] prescaler_i,
    input wire [3:0] resolution_i, // 0x2 = 320x240, 0x4 = 160x120, 0x8 = 80x60

    input wire [`BUS_MIPORT] mport_i, // For pixel data only
    output reg [`BUS_MOPORT] mport_o,

    input wire fb_i,

    output reg [7:0] pixel_o,
    output reg hsync_o,
    output reg vsync_o
);
    localparam BASE_H_ACTIVE = 10'd640;
    localparam BASE_H_FPORCH = 5'd16;
    localparam BASE_H_SYNC = 7'd64;
    localparam BASE_H_BPORCH = 7'd80;
    localparam BASE_H_TOTAL = BASE_H_ACTIVE + BASE_H_FPORCH + BASE_H_SYNC + BASE_H_BPORCH;
    localparam BASE_V_ACTIVE = 10'd480;
    localparam BASE_V_FPORCH = 2'd3;
    localparam BASE_V_SYNC = 3'd4;
    localparam BASE_V_BPORCH = 4'd13;
    localparam BASE_V_TOTAL = BASE_V_ACTIVE + BASE_V_FPORCH + BASE_V_SYNC + BASE_V_BPORCH;
    localparam H_SYNC_ACTIVE = 1'b0;
    localparam V_SYNC_ACTIVE = 1'b1;

    reg [9:0] res_h_active;
    reg [9:0] res_v_active;

    reg [9:0] base_h_counter; // Counters at base resolution, including blanking time
    reg [9:0] base_v_counter;
    reg [9:0] res_h_counter;  // Counters at scaled resolution, only for active area
    reg [9:0] res_v_counter;

    reg [3:0] prescaler;
    reg [3:0] resolution;
    reg [3:0] pixel_double_counter;
    reg [3:0] line_double_counter;

    localparam CACHE_WIDTH = 9'd320;
    reg [7:0] line_cache[CACHE_WIDTH-1:0]; // 320x240 resolution, cache one line
    reg [9:0] line_cache_idx;
    reg fb;
    localparam FB_READ_STATE_READY = 0;
    localparam FB_READ_STATE_PREP = 2'd1;
    localparam FB_READ_STATE_READ = 2'd2;
    reg [1:0] fb_read_state;

    wire [`BUS_DATA_SIZE-1:0] pixel_data_in;
    assign pixel_data_in = mport_i[`BUS_MI_DATA];

    wire base_clk; // 640x480 pixel clock (24MHz)
    clkdiv div(clk_i, nrst_i, {4'b0000, prescaler}, base_clk);

    integer i;

    always @ (*) begin
      if (base_h_counter < BASE_H_ACTIVE && base_v_counter < BASE_V_ACTIVE)
        pixel_o = line_cache[res_h_counter[8:0]];
      else
        pixel_o = 0; // Pixel must be black during blanking time
    end

    always @ (posedge clk_i or negedge nrst_i) begin
        if (!nrst_i) begin
            res_h_active <= 0;
            res_v_active <= 0;
            base_h_counter <= 0;
            base_v_counter <= BASE_V_ACTIVE + BASE_V_FPORCH + BASE_V_SYNC;
            res_h_counter <= 0;
            res_v_counter <= 0;
            prescaler <= 0;
            resolution <= 0;
            pixel_double_counter <= 0;
            line_double_counter <= 0;
            for (i = 0; i < CACHE_WIDTH; i = i+1)
                line_cache[i] <= 0;
            line_cache_idx = 0;
            fb <= 0;
            fb_read_state <= FB_READ_STATE_READY;
            pixel_o <= 0;
            hsync_o <= ~H_SYNC_ACTIVE;
            vsync_o <= ~V_SYNC_ACTIVE;
            mport_o <= 0;
        end
        else if (clk_i) begin
            if (!enable_i) begin
                case (resolution_i)
                    4'h2: begin
                        res_h_active <= {1'b0, BASE_H_ACTIVE[9:1]};
                        res_v_active <= {1'b0, BASE_V_ACTIVE[9:1]};
                    end
                    4'h4: begin
                        res_h_active <= {2'b00, BASE_H_ACTIVE[9:2]};
                        res_v_active <= {2'b00, BASE_V_ACTIVE[9:2]};
                    end
                    4'h8: begin
                        res_h_active <= {3'b000, BASE_H_ACTIVE[9:3]};
                        res_v_active <= {3'b000, BASE_V_ACTIVE[9:3]};
                    end
                endcase
                base_h_counter <= 0;
                base_v_counter <= BASE_V_ACTIVE + BASE_V_FPORCH + BASE_V_SYNC; // Give us some blanking time to grab the first line
                res_h_counter <= 0;
                res_v_counter <= 0;
                prescaler <= prescaler_i;
                resolution <= resolution_i;
                pixel_double_counter <= 0;                // Make sure the first pixel gets outputted
                line_double_counter <= 0;
                for (i = 0; i < CACHE_WIDTH; i = i+1)
                    line_cache[i] <= 0;
                fb <= fb_i;                               // Keep this up to date
                fb_read_state <= FB_READ_STATE_PREP;
                pixel_o <= 0;
                hsync_o <= ~H_SYNC_ACTIVE;
                vsync_o <= ~V_SYNC_ACTIVE;
            end
            else if (base_clk) begin
                // Output pixels
                if (base_h_counter < BASE_H_ACTIVE && base_v_counter < BASE_V_ACTIVE) begin
                    pixel_double_counter = pixel_double_counter + 1; // Handle pixel doubling
                    if (pixel_double_counter >= resolution) begin
                        pixel_double_counter <= 0;

                        res_h_counter = res_h_counter + 1;
                        if (res_h_counter >= res_h_active) begin
                            res_h_counter = 0;
                            line_double_counter = line_double_counter + 1; // Handle line doubling
                            if (line_double_counter >= resolution) begin
                                line_double_counter <= 0;
                                res_v_counter = res_v_counter + 1;
                                if (res_v_counter >= res_v_active)
                                    res_v_counter = 0;

                                fb <= fb_i;
                                fb_read_state <= FB_READ_STATE_PREP;
                            end
                        end
                    end
                end

                // HSYNC
                base_h_counter = base_h_counter + 1;
                if (base_h_counter >= BASE_H_ACTIVE + BASE_H_FPORCH
                    && base_h_counter < BASE_H_ACTIVE + BASE_H_FPORCH + BASE_H_SYNC)
                    hsync_o <= H_SYNC_ACTIVE;
                else
                    hsync_o <= ~H_SYNC_ACTIVE;

                if (base_h_counter >= BASE_H_TOTAL) begin
                    base_h_counter <= 0;
                    res_h_counter <= 0;
                    pixel_double_counter <= 0;
                    base_v_counter = base_v_counter + 1;
                end

                // VSYNC
                if (base_v_counter >= BASE_V_ACTIVE + BASE_V_FPORCH
                    && base_v_counter < BASE_V_ACTIVE + BASE_V_FPORCH + BASE_V_SYNC)
                    vsync_o <= V_SYNC_ACTIVE;
                else
                    vsync_o <= ~V_SYNC_ACTIVE;

                if (base_v_counter >= BASE_V_TOTAL) begin
                    res_v_counter <= 0;
                    base_v_counter <= 0;
                end
            end

            // Fetch new line
            case (fb_read_state)
            FB_READ_STATE_PREP: begin
                if (!res_v_counter)
                    mport_o[`BUS_MO_ADDR] <= fb ? FB1_ADDR : FB0_ADDR;

                mport_o[`BUS_MO_RW] <= `BUS_READ;
                mport_o[`BUS_MO_SIZE] <= `BUS_SIZE_STREAM;
                mport_o[`BUS_MO_REQ]  <= 1;
                fb_read_state <= FB_READ_STATE_READ;
            end
            FB_READ_STATE_READ: begin
                if (mport_i[`BUS_MI_SEQSLV]) begin
                    line_cache[line_cache_idx]     <= pixel_data_in[7:0];
                    line_cache[line_cache_idx + 1] <= pixel_data_in[15:8];
                    line_cache[line_cache_idx + 2] <= pixel_data_in[23:16];
                    line_cache[line_cache_idx + 3] <= pixel_data_in[31:24];
                    mport_o[`BUS_MO_ADDR] <= mport_o[`BUS_MO_ADDR] + 4;
                    line_cache_idx <= line_cache_idx + 4;
                    if (line_cache_idx >= res_h_active - 4) begin
                        fb_read_state <= FB_READ_STATE_READY;
                        line_cache_idx <= 0;
                        mport_o[`BUS_MO_REQ] <= 0;
                    end
                end
            end
            endcase
        end
    end

endmodule
