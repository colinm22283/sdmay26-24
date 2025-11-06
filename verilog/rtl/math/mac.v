`define DECIMAL_POS (10) //remove if integrated
//single cycle mac
module mac #(parameter BUS_DATA_SIZE = 32) (
    input clk, nrst,
    input [BUS_DATA_SIZE-1:0] a_i, b_i,
    output [BUS_DATA_SIZE-1:0] y_o
);
    wire [BUS_DATA_SIZE-1:0] ab, absum;
    reg [BUS_DATA_SIZE-1:0] sum;

    always @ (posedge clk or negedge nrst)
    begin
        if(nrst == 0)
        begin
            sum <= 0;
        end
        else
        begin
            sum <= absum;
        end
    end
    assign absum = sum + ab;
    assign ab = (a_i * b_i) >>> `DECIMAL_POS;
    assign y_o = sum;
endmodule
