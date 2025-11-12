`include "svunit_defines.svh"
`include "user_defines.v"
`include "core/alu.v"
`include "test/clk_rst.v"

module alu_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "alu_m_ut";
  svunit_testcase svunit_ut;

  localparam ADD =        4'b0000;
  localparam SUB =        4'b0001;
  localparam MULT =       4'b0010;
  localparam DIV =        4'b0011;
  localparam AND =        4'b0100;
  localparam OR =         4'b0101;
  localparam XOR =        4'b0110;
  localparam MAC =        4'b0111;
  localparam MAC_CLR =    4'b1000;
  localparam MAC_READ =   4'b1001;
  localparam SEQ =        4'b1010;
  localparam SLT =        4'b1011;


  reg signed [`WORD_WIDTH-1:0] a;
  reg signed [`WORD_WIDTH-1:0] b;
  reg [`ALU_CTL_SIZE-1:0] alu_ctl;
  reg clk, nrst;

  clk_rst_m clk_rst( .clk_o(clk), .nrst_o(nrst) );

  wire [`WORD_WIDTH-1:0] result;
  //===================================
  // This is the UUT that we're
  // running the Unit Tests on
  //===================================
  alu_m my_alu_m(
    .clk_i(clk),
    .nrst_i(nrst),
    .a_i(a),
    .b_i(b),
    .alu_ctl_i(alu_ctl),

    .result_o(result)
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

    `SVTEST(add)
      #1;
      alu_ctl = ADD;
      a = 0;
      b = 0;
      #1
      $display("result %d, a: %d", result, a);
      `FAIL_UNLESS_EQUAL(result, a);

    `SVTEST_END


  `SVUNIT_TESTS_END

endmodule
