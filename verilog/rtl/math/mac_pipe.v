`define DECIMAL_POS (10)

module mac_piped #(parameter DATA_WIDTH = 32) (
    input clk, nrst,
    input [BUS_DATA_SIZE-1:0] a_i, b_i,
    output [BUS_DATA_SIZE-1:0] y_o
);
    wire [BUS_DATA_SIZE-1:0] ab, absum;
    reg [BUS_DATA_SIZE-1:0] abprod, sum;

    //mult to add section
    always @ (posedge clk or negedge nrst)
    begin
        if(nrst == 0)
        begin
            abprod <= 0;
        end
        else
        begin
            abprod <= ab;
        end
    end

    //add to output section
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

    assign absum = sum + abprod;
    assign ab = (a_i * b_i) >>> `DECIMAL_POS;
    assign y_o = sum;
endmodule