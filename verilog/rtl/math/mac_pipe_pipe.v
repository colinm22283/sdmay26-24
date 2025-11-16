`define DECIMAL_POS (10)
//NOT FINISHED, DO NOT USE UNTIL FURTHER TESTING
//also synth doesn't play well with params?

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
    assign y_o = sum;

    mult_pipe #(.BUS_DATA_SIZE(32)) dut(
        .clk(clk), .nrst(nrst),
        .a_i(a_i), .nrst(b_i),
        .y_o(ab)
    );
    
endmodule