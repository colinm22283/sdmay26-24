`include "svunit_defines.svh"

`include "user_defines.v"

`include "math/add.v"
`include "math/sub.v"
`include "math/mul.v"
`include "math/inv.v"

`include "rasterizer/bary_pipe.v"

`include "test/clk_rst.v"
`include "test/stream_master.v"
`include "test/stream_slave.v"

module bary_pipe_m_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "bary_pipe_m_ut";
  svunit_testcase svunit_ut;

  localparam WORD_WIDTH = 32;
  localparam WIDTH = 320;
  localparam HEIGHT = 240;
  localparam SC_WIDTH = $clog2(WIDTH > HEIGHT ? WIDTH : HEIGHT);

  wire clk;
  wire nrst;

  clk_rst_m clk_rst( .clk_o(clk), .nrst_o(nrst) );

  reg  bary_run;
  wire bary_init;
  wire bary_discard;
  wire bary_busy;

  wire [`STREAM_MIPORT(SC_WIDTH * 2)] mstreami;
  wire [`STREAM_MOPORT(SC_WIDTH * 2)] mstreamo;

  wire [`STREAM_SIPORT(SC_WIDTH * 2 + WORD_WIDTH * 3)] sstreami;
  wire [`STREAM_SOPORT(SC_WIDTH * 2 + WORD_WIDTH * 3)] sstreamo;

  reg signed [WORD_WIDTH - 1:0] v0x, v0y, v0z;
  reg signed [WORD_WIDTH - 1:0] v1x, v1y, v1z;
  reg signed [WORD_WIDTH - 1:0] v2x, v2y, v2z;

  stream_master_m #(SC_WIDTH * 2) stream_master(
    .clk_i(clk),

    .mstream_i(mstreami),
    .mstream_o(mstreamo)
  );

  stream_slave_m #(SC_WIDTH * 2 + WORD_WIDTH * 3) stream_slave(
    .clk_i(clk),

    .sstream_i(sstreami),
    .sstream_o(sstreamo)
  );

  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  bary_pipe_m my_bary_pipe_m(
    .clk_i(clk),
    .nrst_i(nrst),

    .run_i(bary_run),
    .init_o(bary_init),
    .discard_o(bary_discard),
    .busy_o(bary_busy),

    .sstream_i(mstreamo),
    .sstream_o(mstreami),

    .mstream_i(sstreamo),
    .mstream_o(sstreami),

    .v0x(v0x),
    .v0y(v0y),
    .v0z(v0z),

    .v1x(v1x),
    .v1y(v1y),
    .v1z(v1z),

    .v2x(v2x),
    .v2y(v2y),
    .v2z(v2z)
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

    bary_run = 0;

    wait(nrst);
    #100;
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

    `SVTEST(main)
      integer i;

      reg [SC_WIDTH - 1:0] posx, posy;

      reg signed [WORD_WIDTH - 1:0] l0, l1, l2;

      START_PIPELINE();

      posx = {$random} % WIDTH;
      posy = {$random} % HEIGHT;

      SEND_DATA(posx, posy);

      // RECEIVE_DATA(l0, l1, l2);

    `SVTEST_END

  `SVUNIT_TESTS_END

  task START_PIPELINE;
  begin
    bary_run = 1;
    clk_rst.WAIT_CYCLES(2);
    bary_run = 0;

    wait(bary_init);
  end
  endtask

  task SEND_DATA;
    input [SC_WIDTH - 1:0] posx;
    input [SC_WIDTH - 1:0] posy;
  begin
    stream_master.WRITE({ posx, posy });
  end
  endtask

  task RECEIVE_DATA;
    output [WORD_WIDTH - 1:0] l0;
    output [WORD_WIDTH - 1:0] l1;
    output [WORD_WIDTH - 1:0] l2;

    reg [SC_WIDTH - 1:0] posx, posy;
  begin
    stream_slave.READ({ posx, posy, l0, l1, l2 });
  end
  endtask

endmodule
