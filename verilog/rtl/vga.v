/*
    Basic 8-bit integer clock divider.
*/
module clkdiv (
    input wire clk_i,
    input wire nrst_i,
    input reg [7:0] div_i,

    output reg clk_o
);

    reg [7:0] counter;

    always @ (negedge nrst_i) begin
        clk_o <= 1'b0;
        counter <= 8'b0000;
    end

    always @ (posedge clk_i) begin
        counter <= counter + 8'd1;
        if (counter >= div_i) begin
            clk_o <= ~clk_o;
            counter <= 8'd0;
        end
    end
endmodule

/*
    320x240 @ 60Hz (6MHz pixel clock) VGA output module.
    Does line doubling/pixel doubling to get smaller
    resolutions.

    Uses 640x480 @ 60Hz (25MHz pixel clock) as a base resolution.

    Using "stock" 640x480 should give us better monitor
    compatability. Doesn't cost us any performance either
    since lines are burst-read and cached.
*/
module vga #(
    parameter ADDRESS = 0
) (
    input wire clk_i, // Must be an integer multiple of 24MHz
    input wire nrst_i,

    input reg enable_i,
    input reg [3:0] prescaler_i,
    input reg [3:0] resolution_i, // 0x2 = 320x240, 0x4 = 160x120, 0x8 = 80x60

    input reg framebuffer_i,

    output reg [7:0] pixel_o,
    output reg hsync_o,
    output reg vsync_o
);
    parameter BASE_H_ACTIVE = 10'd640;
    parameter BASE_H_FPORCH = 5'd16;
    parameter BASE_H_SYNC = 7'd64;
    parameter BASE_H_BPORCH = 7'd80;
    parameter BASE_H_TOTAL = BASE_H_ACTIVE + BASE_H_FPORCH + BASE_H_SYNC + BASE_H_BPORCH;
    parameter BASE_V_ACTIVE = 10'd480;
    parameter BASE_V_FPORCH = 2'd3;
    parameter BASE_V_SYNC = 3'd4;
    parameter BASE_V_BPORCH = 4'd13;
    parameter BASE_V_TOTAL = BASE_V_ACTIVE + BASE_V_FPORCH + BASE_V_SYNC + BASE_V_BPORCH;
    parameter H_SYNC_ACTIVE = 1'b0;
    parameter V_SYNC_ACTIVE = 1'b1;

    reg [9:0] res_h_active;
    reg [9:0] res_v_active;

    reg [9:0] base_h_counter; // Counters at base resolution
    reg [9:0] base_v_counter;
    reg [9:0] res_h_counter; // Counters at scaled resolution
    reg [9:0] res_v_counter;

    reg [3:0] prescaler;
    reg [3:0] resolution;

    parameter CACHE_WIDTH = 9'd320;
    reg [CACHE_WIDTH-1:0] line_cache [7:0]; // 320x240 resolution, cache one line

    reg base_clk; // 640x480 pixel clock (24MHz)
    clkdiv div(clk_i, nrst_i, prescaler, base_clk);

    always @ (negedge nrst_i) begin
        base_h_counter <= 10'd0;
        base_v_counter <= 10'd0;
        res_h_counter <= 10'd0;
        res_v_counter <= 10'd0;
        prescaler <= 4'd0;
        resolution <= 3'd0;
        for (i = 0; i < CACHE_WIDTH; i = i+1)
            line_cache[i] <= 8'd0;
    end

    always @ (posedge clk_i) begin
        if (!enable_i) begin
            prescaler <= prescaler_i;
            resolution <= resolution_i;
            case (resolution)
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

            for (i = 0; i < CACHE_WIDTH; i = i+1)
                line_cache[i] <= 8'd0;
        end

        if (base_clk) begin
            // Output pixels
            if (base_h_counter < BASE_H_ACTIVE && base_v_counter < BASE_V_ACTIVE) begin
                resolution_counter <= resolution_counter + 4'd1;
                if (resolution_counter >= resolution) begin
                    pixel_o <= line_cache[base_h_counter[8:0]];

                    res_h_counter <= res_h_counter + 10'd1;
                    if (res_h_counter >= res_h_active) begin
                        res_h_counter <= 10'd0;
                        res_v_counter <= res_v_counter + 10'd1;
                        if (res_v_counter >= res_v_active) begin
                            res_v_counter <= 10'd0;
                            // TODO Fetch new line
                        end
                    end
                end
            end

            // HSYNC
            base_h_counter <= base_h_counter + 10'd1;
            if (base_h_counter >= BASE_H_ACTIVE + BASE_H_FPORCH
                && base_h_counter < BASE_H_ACTIVE + BASE_H_FPORCH + BASE_H_SYNC)
                hsync_o <= H_SYNC_ACTIVE;
            else
                hsync_o <= ~H_SYNC_ACTIVE;

            if (base_h_counter >= BASE_H_TOTAL) begin
                base_h_counter <= 10'd0;
                base_v_counter <= base_v_counter + 10'd1;
            end

            // VSYNC
            if (base_v_counter >= BASE_V_ACTIVE + BASE_V_FPORCH
                && base_v_counter < BASE_V_ACTIVE + BASE_V_FPORCH + BASE_V_SYNC)
                vsync_o <= V_SYNC_ACTIVE;
            else
                vsync_o <= ~V_SYNC_ACTIVE;

            if (base_v_counter >= BASE_V_TOTAL) begin
                base_v_counter <= 10'd0;
            end
        end
    end

endmodule
