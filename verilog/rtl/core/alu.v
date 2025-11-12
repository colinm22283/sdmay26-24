/*
    ALU module for the uGPU core

    Contains the MAC inside of it.
    Unclocked rn
*/

`include "user_defines.v"
`include "math/add.v"
`include "math/div.v"
`include "math/mul.v"
`include "math/sub.v"

module alu_m (
    input  wire clk_i,
    input  wire nrst_i,

    input  wire signed[`WORD_WIDTH-1:0]   a_i,
    input  wire signed[`WORD_WIDTH-1:0]   b_i,
    input  wire[`ALU_CTL_SIZE-1:0]        alu_ctl_i,

    output wire signed[`WORD_WIDTH-1:0]  result_o

);

    localparam ADD =        4'b0000;
    localparam SUB =        4'b0001;
    localparam MULT =       4'b0010;
    localparam DIV =        4'b0011;
    localparam AND =        4'b0100;
    localparam OR =         4'b0101;
    localparam XOR =        4'b0110;
    localparam MAC =        4'b0111;
    localparam MAC_CLR =    4'b1000;
    localparam MAC_READ =   4'b1001;
    localparam SEQ =        4'b1010;
    localparam SLT =        4'b1011;

    wire[`WORD_WIDTH-1:0] sum_adder;
    wire[`WORD_WIDTH-1:0] sum_subtractor;
    wire adder_c_in;
    wire adder_c_out;
    wire[`WORD_WIDTH-1:0] product;
    wire[`WORD_WIDTH-1:0] quotient;

    reg [`WORD_WIDTH-1:0] result_reg;

    add_m #(`WORD_WIDTH) adder (
        .a_i(a_i),
        .b_i(b_i),
        .y_o(sum_adder)
    );

    sub_m #(`WORD_WIDTH) subtractor (
        .a_i(a_i),
        .b_i(b_i),
        .y_o(sum_subtractor)
    );

    mul_m #(`WORD_WIDTH) multiplier (
        .a_i(a_i),
        .b_i(b_i),
        .y_o(product)
    );

    div_m #(`WORD_WIDTH) divider (
        .a_i(a_i),
        .b_i(b_i),
        .y_o(quotient)
    );

    // always @(*) begin OUTPUT:
    //     case (alu_ctl_i)
    //         ADD:    result_reg = sum_adder;
    //         SUB:    result_reg = sum_subtractor;
    //         MULT:   result_reg = product;
    //         DIV:    result_reg = quotient;
    //         AND:    result_reg = a_i & b_i;
    //         OR:     result_reg = a_i | b_i;
    //         XOR:    result_reg = a_i ^ b_i;
    //         MAC: begin
    //             //TODO
    //         end
    //         MAC_CLR: begin
    //             //TODO
    //         end
    //         MAC_READ: begin
    //             //TODO
    //         end
    //         SEQ:    result_reg = (a_i == b_i);
    //         SLT:    result_reg = (a_i < b_i);
    //         default: result_reg = 0;
    //     endcase
    // end

    assign result_o =   (alu_ctl_i == ADD)      ? sum_adder :
                        (alu_ctl_i == SUB)      ? sum_subtractor :
                        (alu_ctl_i == MULT)     ? product :
                        (alu_ctl_i == DIV)      ? quotient :
                        (alu_ctl_i == AND)      ? (a_i & b_i) :
                        (alu_ctl_i == OR)       ? (a_i | b_i) :
                        (alu_ctl_i == XOR)      ? (a_i ^ b_i) :
                        (alu_ctl_i == MAC)      ? (0) : //TODO
                        (alu_ctl_i == MAC_CLR)  ? (0): //TODO
                        (alu_ctl_i == MAC_READ) ? (0): //TODO
                        (alu_ctl_i == SEQ)      ? (a_i == b_i):
                        (alu_ctl_i == SLT)      ? (a_i < b_i):
                                                   0;

endmodule