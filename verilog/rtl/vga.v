/*
    320x240 @ 60Hz (6MHz pixel clock) VGA output module.
    Does line doubling/pixel doubling to get smaller
    resolutions.

    Uses 640x480 @ 60Hz (24MHz pixel clock) as a base resolution.

    Using "stock" 640x480 should give us better monitor
    compatability. Doesn't cost us any performance either
    since lines are burst-read and cached.
*/
module vga_m #(
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

    reg [8:0] prescaler_counter; // Generates base resolution pixel clock from clk_i
    reg [9:0] base_h_counter;    // Counters at base resolution, including blanking time
    reg [9:0] base_v_counter;
    reg [9:0] res_h_counter;     // Counters at scaled resolution, only for active area
    reg [9:0] res_v_counter;

    reg [3:0] prescaler;
    reg [3:0] resolution;
    reg [3:0] pixel_double_counter;
    reg [3:0] line_double_counter;

    wire in_active_area;
    assign in_active_area = base_h_counter < BASE_H_ACTIVE && base_v_counter < BASE_V_ACTIVE;

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

    integer i;

    always @ (*) begin
        // Color output
        if (in_active_area || !enable_i || !nrst_i)
            pixel_o = line_cache[res_h_counter[8:0]];
        else
            pixel_o = 0; // Pixel must be black during blanking time

        // HSYNC
        if (base_h_counter >= BASE_H_ACTIVE + BASE_H_FPORCH
            && base_h_counter < BASE_H_ACTIVE + BASE_H_FPORCH + BASE_H_SYNC)
            hsync_o <= H_SYNC_ACTIVE;
        else
            hsync_o <= ~H_SYNC_ACTIVE;

        // VSYNC
        if (base_v_counter >= BASE_V_ACTIVE + BASE_V_FPORCH
            && base_v_counter < BASE_V_ACTIVE + BASE_V_FPORCH + BASE_V_SYNC)
            vsync_o <= V_SYNC_ACTIVE;
        else
            vsync_o <= ~V_SYNC_ACTIVE;
    end

    always @ (posedge clk_i or negedge nrst_i) begin
        if (!nrst_i) begin
            res_h_active <= 0;
            res_v_active <= 0;
            prescaler_counter <= 0;
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
            line_cache_idx <= 0;
            fb <= 0;
            fb_read_state <= FB_READ_STATE_READY;
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
                prescaler_counter <= 0;
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
            end
            else if (prescaler_counter == prescaler - 1) begin
                prescaler_counter <= 0;

                // Output pixels
                if (in_active_area) begin
                    if (pixel_double_counter == resolution - 1) begin
                        pixel_double_counter <= 0;

                        if (res_h_counter == res_h_active - 1) begin
                            res_h_counter <= 0;
                            if (line_double_counter == resolution - 1) begin
                                line_double_counter <= 0;
                                if (res_v_counter == res_v_active - 1)
                                    res_v_counter <= 0;
                                else
                                    res_v_counter <= res_v_counter + 1;

                                fb <= fb_i;
                                fb_read_state <= FB_READ_STATE_PREP;
                            end
                            else
                                line_double_counter <= line_double_counter + 1; // Handle line doubling
                        end
                        else
                            res_h_counter <= res_h_counter + 1;
                    end
                    else
                        pixel_double_counter <= pixel_double_counter + 1; // Handle pixel doubling
                end

                if (base_h_counter == BASE_H_TOTAL - 1) begin
                    base_h_counter <= 0;
                    res_h_counter <= 0;
                    pixel_double_counter <= 0;

                    if (base_v_counter == BASE_V_TOTAL - 1) begin
                        res_v_counter <= 0;
                        base_v_counter <= 0;
                    end
                    else
                        base_v_counter <= base_v_counter + 1;
                end
                else
                    base_h_counter <= base_h_counter + 1;
            end
            else
                prescaler_counter <= prescaler_counter + 1;

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
