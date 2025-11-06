`include "svunit_defines.svh"
`include "user_defines.v"
`include "mac.v"

module mac_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "mac_ut";
  svunit_testcase svunit_ut;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  reg clk;
  reg nrst;

  clk_rst_m #(10, 30) clk_rst (
    .clk_o(clk),
    .nrst_o(nrst)
  );

  wire [`WORD_WIDTH - 1:0] a_i, b_i, y_o;

  mac my_mac#(`WORD_WIDTH) (
    .clk(clk), .nrst(nrst),
    .a_i(a_i), .b_i(b_i),
    .y_o(y_o)
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

    clk_rst.RESET();
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

  `SVTEST(test1)
  


  `SVUNIT_TESTS_END

endmodule
