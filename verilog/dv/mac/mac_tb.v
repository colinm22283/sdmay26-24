`define BUS_DATA_SIZE (32)
module mac_tb; 
    reg signed [`BUS_DATA_SIZE-1:0] a, b; 
    wire [`BUS_DATA_SIZE-1:0] out;
    reg clk, nrst;

mac #(.BUS_DATA_SIZE(`BUS_DATA_SIZE)) dut ( 
    .clk(clk), .nrst(nrst),
    .a_i(a), .b_i(b),
    .y_o(out)
); 
 
initial begin
    clk <= 0;
    forever begin
        #10 clk <= !clk;
    end
end

initial begin 
        $dumpfile("mac.vcd");
        $dumpvars(0, mac_tb);

    nrst = 0; a = 0; b = 0;
 
    #10; nrst = 1; a = 1; b = 1;
    $display("Result: %d", out); 
    #1000;
    $finish; 
end 
endmodule