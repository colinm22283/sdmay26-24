`define DECIMAL_POS (10)

module mac_piped #(parameter DATA_WIDTH = 32) (
    input clk, nrst,
    input [31:0] a_i, b_i,
    output [31:0] y_o
);
    wire [31:0] ab, absum;
    reg [31:0] abprod, sum;

    //mult to add section
    always @ (posedge clk or negedge nrst)
    begin
        if(nrst == 0)
        begin
            //synth was finding length unclear
            abprod <= 32'b0;
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