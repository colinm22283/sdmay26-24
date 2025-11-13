/*
    ALU module for the uGPU core

    Contains the MAC inside of it.
    Unclocked rn
*/

`include "user_defines.v"
`include "math/full_adder.v"
`include "math/div.v"
`include "math/mul.v"

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

    wire[`WORD_WIDTH-1:0] sum;
    wire[`WORD_WIDTH-1:0] product;
    wire[`WORD_WIDTH-1:0] quotient;

    wire[`WORD_WIDTH-1:0] adder_b_port;
    wire adder_c_out;
    wire nadd_sub;

    assign nadd_sub = (alu_ctl_i == SUB);
    assign adder_b_port = (nadd_sub) ? ~b_i : b_i;
    full_adder_m #(`WORD_WIDTH) full_adder (
        .a_i(a_i),
        .b_i(adder_b_port),
        .carry_i(nadd_sub),
        .y_o(sum),
        .carry_o(adder_c_out)
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

    assign result_o =   (alu_ctl_i == ADD)      ? sum :
                        (alu_ctl_i == SUB)      ? sum :
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