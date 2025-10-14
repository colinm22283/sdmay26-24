module vga_tb();

    reg clk;
    reg nrst;

    reg [7:0] pixel;
    reg hsync;
    reg vsync;

    vga #(0) display_out (
        .clk_i(clk),
        .nrst_i(nrst),
        .enable_i(1'd0),
        .prescaler_i(4'd0),
        .resolution_i(4'd0),
        .framebuffer_i(1'd0),
        .pixel_o(pixel),
        .hsync_o(hsync),
        .vsync_o(vsync),
    );

    // initial forever begin
        clk <= 1;
        #10;
        clk <= 0;
        #10;
    // end


endmodule
