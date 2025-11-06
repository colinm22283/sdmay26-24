`include "svunit_defines.svh"
`include "dff_n.v"
module dff_n_unit_test;
  import svunit_pkg::svunit_testcase;

  string name = "dff_n_ut";
  svunit_testcase svunit_ut;
  localparam N = 32;
  localparam CLK_HALF_PERIOD = 5;

  logic clk;
  logic dff_rst_i;
  logic dff_we_i;
  reg [N-1:0] dff_dat_i;
  wire [ N-1:0] dff_dat_o;



  //===================================
  // This is the UUT that we're 
  // running the Unit Tests on
  //===================================

  //instantiate the component to test
  dff_n #(.N(N)) dut (
    .dff_clk_i(clk),                  
    .dff_rst_i(dff_rst_i),             
    .dff_we_i(dff_we_i),                   
    .dff_dat_i(dff_dat_i),          
    .dff_dat_o(dff_dat_o)
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
      dff_rst_i <= 1;
      dff_dat_i <= 32'h80000000;
      repeat (2) @(posedge clk);
      //Expecting 00000000
      dff_rst_i <= 0;
      dff_we_i <= 1;
      dff_dat_i <= 32'hFFFFFFFF;
      repeat (2) @(posedge clk);
      //expecting FFFFFFFF
      dff_rst_i <= 1;
      dff_we_i <= 0;
      dff_dat_i <= 32'hFFFFFFFF;
      repeat (2) @(posedge clk);
      //expecting 00000000
      dff_rst_i <= 1;
      dff_we_i <= 1;
      dff_dat_i <= 32'hABABABAB;
      repeat (2) @(posedge clk);
      //Expecting 00000000
      dff_rst_i <= 0;
      dff_we_i <= 1;
      dff_dat_i <= 32'hABABABAB;
      repeat (2) @(posedge clk);
      //Expecting ABABABAB
      dff_rst_i <= 0;
      dff_we_i <= 0;
      dff_dat_i <= 32'h12312312;
      repeat (2) @(posedge clk);
      //Expecting ABABABAB

      $finish;
    end
  `SVTEST_END






  `SVUNIT_TESTS_END

endmodule
