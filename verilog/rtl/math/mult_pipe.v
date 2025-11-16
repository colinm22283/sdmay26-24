//the idea is to build a dadda multiplier, and pipeline that out
module mult_pipe #(parameter BUS_DATA_SIZE = 32) (
    input clk, nrst,
    input [BUS_DATA_SIZE-1:0] a_i, b_i,
    output [2*BUS_DATA_SIZE-1:0] y_o
);

    //partial product gen
    wire [BUS_DATA_SIZE-1:0] partialp [BUS_DATA_SIZE-1:0];
    genvar i, j;
    generate
        for (i = 0; i < BUS_DATA_SIZE; i = i + 1)
            for(j= 0; j < BUS_DATA_SIZE; j = j + 1)
                assign partialp[i][j] = a_i[j] & b_i[j];
    endgenerate

    //Reduction
    integer k;
    reg [2*BUS_DATA_SIZE-1:0] sum;
    always @ *
    begin
        sum = 0;
        for (k = 0; k < BUS_DATA_SIZE; k = k + 1)
            sum = sum + (partialp[k] << k);
    end
    assign y_o = sum;
endmodule