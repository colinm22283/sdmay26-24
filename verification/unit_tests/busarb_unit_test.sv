`include "svunit_defines.svh"
`include "busarb.v"

module busarb_m_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "busarb_m_ut";
  svunit_testcase svunit_ut;

  wire clk, nrst;
  clk_rst_m clk_rst(.clk_o(clk), .nrst_o(nrst));

  wire [`BUS_MIPORT] mportai;
  wire [`BUS_MOPORT] mportao;

  wire [`BUS_MIPORT] mportbi;
  wire [`BUS_MOPORT] mportbo;

  wire [`BUS_SIPORT] sportai;
  wire [`BUS_SOPORT] sportao;

  wire [`BUS_SIPORT] sportbi;
  wire [`BUS_SOPORT] sportbo;


  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  busarb_m #(2, 2, 2) dut(
    .clk_i(clk),
    .nrst_i(nrst),

    .mports_i({ mportbo, mportao }),
    .mports_o({ mportbi, mportai }),

    .sports_i({ sportbo, sportao }),
    .sports_o({ sportbi, sportai })
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
