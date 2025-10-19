`include "svunit_defines.svh"
`include "user_defines.v"
`include "vga.v"
`include "bus/busarb.v"
`include "test/vga_display.v"
`include "test/bus_slave.v"
`include "test/clk_rst.v"

module clkdiv_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "clkdiv_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're
  // running the Unit Tests on
  //===================================
  reg clk; // Not using clk_rst here, we need more clock control
  reg nrst;
  reg [7:0] div;
  reg clk_out;
  clkdiv my_clkdiv(
    .clk_i(clk),
    .nrst_i(nrst),
    .div_i(div),
    .clk_o(clk_out)
  );

  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */
    clk = 0;
    div = 8'd0;
    nrst = 0;
    #30;
    nrst = 1;
    #30;
  endtask


  //===================================
  // Here we deconstruct anything we
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

  endtask


  //===================================
  // All tests are defined between the
  // SVUNIT_TESTS_BEGIN/END macros
  //
  // Each individual test must be
  // defined between `SVTEST(_NAME_)
  // `SVTEST_END
  //
  // i.e.
  //   `SVTEST(mytest)
  //     <test code>
  //   `SVTEST_END
  //===================================
  `SVUNIT_TESTS_BEGIN

  `SVTEST(test_div1)
    div = 8'd1;
    for (int i = 0; i < 10; i++) begin
      toggle_clk();
      `FAIL_UNLESS_EQUAL(clk_out, clk);
    end
  `SVTEST_END

  `SVTEST(test_div2)
    div = 8'd2;
    for (int i = 0; i < 10; i++) begin
      toggle_clk();
      `FAIL_UNLESS_EQUAL(clk_out, clk);
      toggle_clk();
      `FAIL_UNLESS_EQUAL(clk_out, ~clk);
      toggle_clk();
      `FAIL_UNLESS_EQUAL(clk_out, ~clk);
      toggle_clk();
      `FAIL_UNLESS_EQUAL(clk_out, clk);
    end
  `SVTEST_END

  `SVTEST(test_div255)
    div = 8'd255;
    for (int i = 0; i < 10; i++) begin
      for (int j = 0; j < 127; j++) begin
        toggle_clk();
        `FAIL_UNLESS_EQUAL(clk_out, clk);
        toggle_clk();
        `FAIL_UNLESS_EQUAL(clk_out, ~clk);
      end
      for (int j = 0; j < 127; j++) begin
        toggle_clk();
        `FAIL_UNLESS_EQUAL(clk_out, ~clk);
        toggle_clk();
        `FAIL_UNLESS_EQUAL(clk_out, clk);
      end
      toggle_clk();
      toggle_clk();
    end
  `SVTEST_END

  `SVUNIT_TESTS_END

  task toggle_clk; begin
    #5 clk <= ~clk;
    #5;
  end
  endtask

endmodule

module vga_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "vga_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're
  // running the Unit Tests on
  //===================================
  wire clk;
  wire nrst;

  clk_rst_m  #(10, 30) clk_rst (
    .clk_o(clk),
    .nrst_o(nrst)
  );

  wire [`BUS_MIPORT] mportai;
  reg  [`BUS_MOPORT] mportao;

  wire [`BUS_SIPORT] sportai;
  wire [`BUS_SOPORT] sportao;

  busarb_m #(1, 1, 1) arbiter(
      .clk_i(clk),
      .nrst_i(nrst),

      .mports_i({ mportao }),
      .mports_o({ mportai }),

      .sports_i({ sportao }),
      .sports_o({ sportai })
  );

  localparam FB_HEIGHT = 10'd320;
  localparam FB_WIDTH = 10'd240;
  localparam MEMORY_SIZE = 2 * FB_HEIGHT * FB_WIDTH;
  localparam FB0_ADDR = 0;
  localparam FB1_ADDR = FB_HEIGHT * FB_WIDTH;

  bus_slave #(FB0_ADDR, MEMORY_SIZE) ram (
      .clk_i(clk),
      .nrst_i(nrst),
      .sport_i(sportai),
      .sport_o(sportao)
  );

  reg resolution_detected;
  reg [7:0] screen[479:0][639:0];

  reg [7:0] pixel;
  reg hsync;
  reg vsync;

  vga_display display (
    .clk_i(clk),
    .nrst_i(nrst),

    .color_i(pixel),
    .hsync_i(hsync),
    .vsync_i(vsync),

    .resolution_detected_o(resolution_detected),
    .screen_o(screen)
  );

  reg enable;
  reg [3:0] prescaler;
  reg [3:0] resolution;
  reg fb;

  vga #(FB0_ADDR, FB1_ADDR) my_vga (
    .clk_i(clk),
    .nrst_i(nrst),
    .enable_i(enable),
    .prescaler_i(prescaler),
    .resolution_i(resolution),
    .mport_i(mportai),
    .mport_o(mportao),
    .fb_i(fb),
    .pixel_o(pixel),
    .hsync_o(hsync),
    .vsync_o(vsync)
  );


  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);
  endfunction


  //===================================
  // Setup for running the Unit Tests
  //===================================
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */
    enable = 0;
    clk_rst.RESET();

    // Fill framebuffer, make sure most lines are different
    for (int i = 0; i < FB_HEIGHT; i++) begin
        for (int j = 0; j < FB_WIDTH; j++) begin
            ram.mem[FB0_ADDR + i * FB_WIDTH + j] = (i + j) % FB_WIDTH;
            ram.mem[FB1_ADDR + i * FB_WIDTH + j] = (i + j) % 20;
        end
    end

    clk_rst.WAIT_CYCLES(1); // Make sure we don't enable and leave reset in the same cycle
  endtask


  //===================================
  // Here we deconstruct anything we
  // need after running the Unit Tests
  //===================================
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

  endtask


  //===================================
  // All tests are defined between the
  // SVUNIT_TESTS_BEGIN/END macros
  //
  // Each individual test must be
  // defined between `SVTEST(_NAME_)
  // `SVTEST_END
  //
  // i.e.
  //   `SVTEST(mytest)
  //     <test code>
  //   `SVTEST_END
  //===================================
  `SVUNIT_TESTS_BEGIN

  `SVTEST(test_320x240)
    prescaler = 1;
    resolution = `VGA_RES_320x240;
    fb = 0;
    clk_rst.WAIT_CYCLES(1);
    enable = 1;
    test_fb(0, `VGA_RES_320x240);
  `SVTEST_END

  `SVTEST(test_160x120)

  `SVTEST_END

  `SVTEST(test_80x60)

  `SVTEST_END

  `SVUNIT_TESTS_END

  task test_fb;
    input fb_num;
    input integer res;

    integer mem_idx;
    integer pixel_double_counter;
    integer line_double_counter;
  begin
    // Wait for the resolution to be detected, takes 1 frame. The memory,
    // memory controller, bus, VGA, and display should all interact
    // on their own.
    for (int i = 0; i < 1000000; i++) begin
      if (resolution_detected)
        break;
      clk_rst.WAIT_CYCLES(1);
    end
    `FAIL_UNLESS_EQUAL(resolution_detected, 1'b1);

    // Compare frames
    mem_idx = fb_num ? FB1_ADDR : FB0_ADDR;
    for(int i = 0; i < 480; i++) begin
      for(int j = 0; j < 640; j++) begin
        if (ram.mem[mem_idx] != screen[i][j]) begin
          $display("Screen mismatch at line, col %d, %d", i, j);
          `FAIL_UNLESS_EQUAL(ram.mem[mem_idx], screen[i][j]);
        end

        pixel_double_counter = pixel_double_counter + 1;
        if (pixel_double_counter >= res) begin
          pixel_double_counter = 0;
          mem_idx = mem_idx + 1;
        end
      end

      line_double_counter = line_double_counter + 1;
      if (line_double_counter >= res)
        line_double_counter = 0;
      else
        mem_idx = mem_idx - 640 / res; // Go back to the start of the line, double it
    end
  end
  endtask

endmodule
