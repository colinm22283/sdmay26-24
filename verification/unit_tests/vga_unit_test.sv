`include "svunit_defines.svh"
`include "vga.v"
`include "bus/busarb.v"
`include "spi_mem.v"
`include "test/vga_display.v"
`include "test/spi_chip.v"
`include "user_defines.v"

module clkdiv_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "clkdiv_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're
  // running the Unit Tests on
  //===================================
  reg clk;
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
  reg clk;
  reg nrst;

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

  wire spi_clk;
  wire spi_cs;
  wire [3:0] spi_mosi;
  wire [3:0] spi_miso;
  wire spi_dqsmi;
  wire spi_dqsmo;

  localparam FRAME_HEIGHT = 10'd320;
  localparam FRAME_WIDTH = 10'd240;
  localparam MEMORY_SIZE = 2 * FRAME_HEIGHT * FRAME_WIDTH;
  reg [31:0] mem_idx;

  spi_mem_m #(0, MEMORY_SIZE) spi_mem(
      .clk_i(clk),
      .nrst_i(nrst),

      .sport_i({ sportai }),
      .sport_o({ sportao }),

      .spi_clk_o(spi_clk),
      .spi_cs_o(spi_cs),
      .spi_mosi_o(spi_mosi),
      .spi_miso_i(spi_miso),
      .spi_dqsm_i(spi_dqsmi),
      .spi_dqsm_o(spi_dqsmo)
  );

  spi_chip_m #(7, 1, MEMORY_SIZE) spi_chip(
      .clk_i(spi_clk),
      .cs_i(spi_cs),
      .mosi_i(spi_mosi),
      .miso_o(spi_miso),
      .dqsm_o(spi_dqsmi),
      .dqsm_i(spi_dqsmo)
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

  localparam FB0_ADDR = 0;
  localparam FB1_ADDR = FRAME_HEIGHT * FRAME_WIDTH;
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
    // Fill framebuffer, make sure most lines are different
    for (int i = 0; i < FRAME_HEIGHT; i++) begin
        for (int j = 0; j < FRAME_WIDTH; j++) begin
            spi_chip.mem[FB0_ADDR + i * FRAME_WIDTH + j] = (i + j) % FRAME_WIDTH;
            spi_chip.mem[FB1_ADDR + i * FRAME_WIDTH + j] = (i + j) % 20;
        end
    end

    mem_idx = 0;

    enable = 0;
    clk = 0;
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

  `SVTEST(test_320x240)
    prescaler = 4'd1;
    resolution = 4'd2;
    fb = 0;
    toggle_clk();
    enable = 1;
    test_fb(0);
  `SVTEST_END

  `SVTEST(test_160x120)

  `SVTEST_END

  `SVTEST(test_80x60)

  `SVTEST_END

  `SVUNIT_TESTS_END

  task toggle_clk; begin
    #5 clk <= ~clk;
    #5 clk <= ~clk;
  end
  endtask

  task test_fb;
    input fb_num;
  begin
    // Wait for the resolution to be detected, takes 1 frame. The memory,
    // memory controller, bus, VGA, and display should all interact
    // on their own.
    for (int i = 0; i < 1000000; i++) begin
      if (resolution_detected)
        break;
      toggle_clk();
    end
    `FAIL_UNLESS_EQUAL(resolution_detected, 1'b1);

    // Compare frames
    for(int i = 0; i < 480; i++) begin
      for(int j = 0; j < 640; j++) begin
        `FAIL_UNLESS_EQUAL(spi_chip.mem[mem_idx], screen[i][j]);
        mem_idx = mem_idx + 1;
      end
    end
  end
  endtask

endmodule
