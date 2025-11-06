`include "svunit_defines.svh"
`include "registerFile_n.v"

module registerFile_n_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "registerFile_n_ut";
  svunit_testcase svunit_ut;
  localparam registersN = 48;
  localparam addrWidth = 5;
  localparam baseAdr = 0;
  localparam CLK_HALF_PERIOD = 5;

  reg clk;                                  //Clock
  reg regf_we_i;                               //Write Enable
  reg regf_rst_i;                                  //Reset
  reg [5:0] regf_r1_i;                 //reg1 addr
  reg [5:0] regf_r2_i;                 //reg2 addr
  reg [31:0] regf_r1_data_i;                       //In data reg1
  reg [31:0] regf_r1_o;                           //Output Data reg1
  reg [31:0] regf_r2_o;                            //Output Data reg2s

  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================
  registerFile_n #(.addrWidth(addrWidth), .registersN(registersN), .baseAdr(baseAdr)) dut(
    .regf_clk_i(clk),
    .regf_we_i(regf_we_i),
    .regf_rst_i(regf_rst_i),
    .regf_r1_i(regf_r1_i),
    .regf_r2_i(regf_r2_i), 
    .regf_r1_data_i(regf_r1_data_i),
    .regf_r1_o(regf_r1_o),
    .regf_r2_o(regf_r2_o)
  );

  //===================================
  // Build
  //===================================
  function void build();
    svunit_ut = new(name);
  endfunction

    initial begin
      clk <= 0;
      forever #5 clk = ~clk; // 10 ns period
    end 

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

  `SVTEST(test1)
    begin

      // waveforms show alot of cycles to change dflip flop value (look into)
      repeat (2) @(posedge clk);
      regf_rst_i <= 1;
      regf_r1_i <= 0;
      regf_r2_i <= 1;
      regf_we_i <= 0;
      regf_r1_data_i <= 32'h8F000000;
      repeat (2) @(posedge clk);
      //Expecting 
      //nothing since reseting regs
      regf_rst_i <= 0;
      regf_r1_i <= 0;
      regf_r2_i <= 1;
      regf_we_i <= 0;
      regf_r1_data_i <= 32'h8F000000;
      repeat (2) @(posedge clk);
      //Expecting 
      //r1: 00000000
      //r2: 00000000
      regf_rst_i <= 0;
      regf_r1_i <= 0;
      regf_r2_i <= 1;
      regf_we_i <= 1;
      regf_r1_data_i <= 32'h8F000000;
      repeat (2) @(posedge clk);
      //Expecting 
      //r1: 8F000000
      //r2: 00000000
      regf_rst_i <= 0;
      regf_r1_i <= 1;
      regf_r2_i <= 0;
      regf_we_i <= 1;
      regf_r1_data_i <= 32'hFFFFFFFF;
      repeat (2) @(posedge clk);
      //Expecting 
      //r1: FFFFFFFF
      //r2: 8F000000
      regf_rst_i <= 0;
      regf_r1_i <= 1;
      regf_r2_i <= 0;
      regf_we_i <= 0;
      regf_r1_data_i <= 32'hAAAAAAAA;
      repeat (2) @(posedge clk);
      //Expecting 
      //r1: FFFFFFFF
      //r2: 8F000000
      regf_rst_i <= 0;
      regf_r1_i <= 31;
      regf_r2_i <= 1;
      regf_we_i <= 1;
      regf_r1_data_i <= 32'hF16F10FF;
      repeat (2) @(posedge clk);
      //Expecting 
      //r1: F16F10FF
      //r2: FFFFFFFF
      regf_rst_i <= 1;
      regf_r1_i <= 31;
      regf_r2_i <= 1;
      regf_we_i <= 1;
      regf_r1_data_i <= 32'hF16F10FF;
      repeat (2) @(posedge clk);
      //Expecting 
      //r1: 00000000
      //r2: 00000000

      $finish;
    end
  `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
