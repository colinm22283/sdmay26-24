`include "svunit_defines.svh"
`include "vga.v"
`include "test/vga_display.v"

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
  localparam FB0_ADDR = 0;
  localparam FB1_ADDR = 32'h00100000;
  wire clk;
  wire nrst;
  wire enable;
  wire [3:0] prescaler;
  wire [3:0] resolution;
  wire [`BUS_MIPORT] mportai;
  reg [`BUS_MOPORT] mportao;
  wire fb;
  reg [7:0] pixel;
  reg hsync;
  reg vsync;

  vga #(FB0_ADDR, FB1_ADDR) my_vga (
    clk,
    nrst,
    enable,
    prescaler,
    resolution,
    mportai,
    mportao,
    fb,
    pixel,
    hsync,
    vsync
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



  `SVUNIT_TESTS_END

endmodule
