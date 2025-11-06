`include "svunit_defines.svh"

`include "user_defines.v"

`include "test/clk_rst.v"
`include "test/stream_master.v"
`include "test/stream_slave.v"

`include "math/div_pipe.v"

module div_pipe_m_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "div_pipe_m_ut";
  svunit_testcase svunit_ut;

  wire clk, nrst;
  clk_rst_m clk_rst(.clk_o(clk), .nrst_o(nrst));

  reg  [`STREAM_SIPORT(32 * 2)] sstreamai;
  wire [`STREAM_SOPORT(32 * 2)] sstreamao;

  reg  [`STREAM_MIPORT(32 * 2)] mstreamai;
  wire [`STREAM_MOPORT(32 * 2)] mstreamao;

  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  div_pipe_m #(
    32,
    32'b0000_0000_0000_0000_0000_0000_0000_0000
  ) dut(
    .clk_i(clk),
    .nrst_i(nrst),

    .sstream_i(sstreamai),
    .sstream_o(sstreamao),

    .mstream_i(mstreamai),
    .mstream_o(mstreamao)
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
    `SVTEST(single_value)

    `SVTEST_END
  `SVUNIT_TESTS_END

endmodule
