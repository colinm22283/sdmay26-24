`include "svunit_defines.svh"
`include "user_defines.v"
`include "test/bus_master.v"
`include "test/bus_slave.v"
`include "test/clk_rst.v"
`include "bus/busarb.v"


module bus_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "bus_ut";
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

  wire [`BUS_MIPORT] mportai;
  reg  [`BUS_MOPORT] mportao;

  wire [`BUS_SIPORT] sportai;
  wire [`BUS_SOPORT] sportao;

  wire [1:0] arb_state [1 - 1:0];

  busarb_m #(1, 1, 1) arbiter (
      .clk_i(clk),
      .nrst_i(nrst),

      .mports_i({ mportao }),
      .mports_o({ mportai }),

      .sports_i({ sportao }),
      .sports_o({ sportai }),

      .dbg_state_o(arb_state)
  );

  localparam SLAVE_ADDR = 20'd0;
  localparam MEM_SIZE = 1024;

  bus_slave #(SLAVE_ADDR, MEM_SIZE) slave (
    .clk_i(clk),
    .nrst_i(nrst),

    .sport_i(sportai),
    .sport_o(sportao)
  );

  reg rw;
  reg [1:0] size;
  reg done;

  bus_master #(MEM_SIZE) master (
    .clk_i(clk),
    .nrst_i(nrst),

    .mport_i(mportai),
    .mport_o(mportao),

    .slave_addr_i(SLAVE_ADDR),
    .rw_i(rw),
    .rw_size_i(size),

    .done_o(done)
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

  `SVTEST(test_rbyte)
    load_slave();
    rw = `BUS_READ;
    size = `BUS_SIZE_BYTE;
    for(int i = 0; i < 1000000 && !done; i++) begin
      clk_rst.WAIT_CYCLES(1);
    end
    for(int i = 0; i < MEM_SIZE; i++) begin
      if (master.mem[i] != slave.mem[i]) begin
        $display("Memory not equal at offset %d", i);
        `FAIL_UNLESS_EQUAL(master.mem[i], slave.mem[i]);
      end
    end
  `SVTEST_END

  `SVTEST(test_rword)
    load_slave();
    rw = `BUS_READ;
    size = `BUS_SIZE_WORD;
    for(int i = 0; i < 1000000 && !done; i++) begin
      clk_rst.WAIT_CYCLES(1);
    end
    for(int i = 0; i < MEM_SIZE; i++) begin
      if (master.mem[i] != slave.mem[i]) begin
        $display("Memory not equal at offset %d", i);
        `FAIL_UNLESS_EQUAL(master.mem[i], slave.mem[i]);
      end
    end
  `SVTEST_END

  `SVTEST(test_rtword)
    load_slave();
    rw = `BUS_READ;
    size = `BUS_SIZE_TWORD;
    for(int i = 0; i < 1000000 && !done; i++) begin
      clk_rst.WAIT_CYCLES(1);
    end
    for(int i = 0; i < MEM_SIZE; i++) begin
      if (master.mem[i] != slave.mem[i]) begin
        $display("Memory not equal at offset %d", i);
        `FAIL_UNLESS_EQUAL(master.mem[i], slave.mem[i]);
      end
    end
  `SVTEST_END

  `SVTEST(test_rstream)
    load_slave();
    rw = `BUS_READ;
    size = `BUS_SIZE_STREAM;
    for(int i = 0; i < 1000000 && !done; i++) begin
      clk_rst.WAIT_CYCLES(1);
    end
    for(int i = 0; i < MEM_SIZE; i++) begin
      if (master.mem[i] != slave.mem[i]) begin
        $display("Memory not equal at offset %d", i);
        `FAIL_UNLESS_EQUAL(master.mem[i], slave.mem[i]);
      end
    end
  `SVTEST_END

  `SVTEST(test_wbyte)
    load_master();
    rw = `BUS_WRITE;
    size = `BUS_SIZE_BYTE;
    for(int i = 0; i < 1000000 && !done; i++) begin
      clk_rst.WAIT_CYCLES(1);
    end
    for(int i = 0; i < MEM_SIZE; i++) begin
      if (master.mem[i] != slave.mem[i]) begin
        $display("Memory not equal at offset %d", i);
        `FAIL_UNLESS_EQUAL(master.mem[i], slave.mem[i]);
      end
    end
  `SVTEST_END

  `SVTEST(test_wword)
    load_master();
    rw = `BUS_WRITE;
    size = `BUS_SIZE_WORD;
    for(int i = 0; i < 1000000 && !done; i++) begin
      clk_rst.WAIT_CYCLES(1);
    end
    for(int i = 0; i < MEM_SIZE; i++) begin
      if (master.mem[i] != slave.mem[i]) begin
        $display("Memory not equal at offset %d", i);
        `FAIL_UNLESS_EQUAL(master.mem[i], slave.mem[i]);
      end
    end
  `SVTEST_END

  `SVTEST(test_wtword)
    load_master();
    rw = `BUS_WRITE;
    size = `BUS_SIZE_TWORD;
    for(int i = 0; i < 1000000 && !done; i++) begin
      clk_rst.WAIT_CYCLES(1);
    end
    for(int i = 0; i < MEM_SIZE; i++) begin
      if (master.mem[i] != slave.mem[i]) begin
        $display("Memory not equal at offset %d", i);
        `FAIL_UNLESS_EQUAL(master.mem[i], slave.mem[i]);
      end
    end
  `SVTEST_END

  `SVTEST(test_wstream)
    load_master();
    rw = `BUS_WRITE;
    size = `BUS_SIZE_STREAM;
    for(int i = 0; i < 1000000 && !done; i++) begin
      clk_rst.WAIT_CYCLES(1);
    end
    for(int i = 0; i < MEM_SIZE; i++) begin
      if (master.mem[i] != slave.mem[i]) begin
        $display("Memory not equal at offset %d", i);
        `FAIL_UNLESS_EQUAL(master.mem[i], slave.mem[i]);
      end
    end
  `SVTEST_END

  `SVUNIT_TESTS_END

  task load_slave; begin
    for(int i = 0; i < MEM_SIZE; i++) begin
      slave.mem[i] = $urandom % 256;
    end
  end
  endtask

  task load_master; begin
    for(int i = 0; i < MEM_SIZE; i++) begin
      master.mem[i] = $urandom % 256;
    end
  end
  endtask

endmodule
