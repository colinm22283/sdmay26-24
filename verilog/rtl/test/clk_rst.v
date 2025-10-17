module clk_rst_m #(
  parameter CLK_PER = 10,
  parameter RESET_PER = 30
) (
  output reg clk_o,
  output reg nrst_o
);

  initial begin
    nrst_o = 0;
    #RESET_PER;
    nrst_o = 1;
  end

  initial forever begin
    clk_o = 0;
    #(CLK_PER / 2);
    clk_o = 1;
    #(CLK_PER / 2);
  end

  task WAIT_CYCLES;
    input integer cycles;

    integer i;
  begin
    for (i = 0; i < cycles; i = i + 1) begin
      wait(clk_o);
      wait(!clk_o);
    end
  end
  endtask

endmodule
