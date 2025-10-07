module depth_pipe_m(
    input wire clk_i,
    input wire nrst_i,

    input wire in_i,
    output wire fail_o,
    output wire out_o,

    input wire [SC_WIDTH - 1:0] posx,
    input wire [SC_WIDTH - 1:0] posy,

    input wire signed [WORD_WIDTH - 1:0] v0z,
    input wire signed [WORD_WIDTH - 1:0] v1z,
    input wire signed [WORD_WIDTH - 1:0] v2z,

    input  reg signed [WORD_WIDTH - 1:0] l0,
    input  reg signed [WORD_WIDTH - 1:0] l1,
    input  reg signed [WORD_WIDTH - 1:0] l2
);



endmodule