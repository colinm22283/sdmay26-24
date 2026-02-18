module bary_pipe_m(
    input wire clk_i,
    input wire nrst_i,

    input wire run_i,
    output reg init_o,
    output reg discard_o,
    output wire busy_o,

    input  wire [`STREAM_SIPORT(`SC_WIDTH * 2)] sstream_i,
    output wire [`STREAM_SOPORT(`SC_WIDTH * 2)] sstream_o,

    input  wire [`STREAM_MIPORT(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] mstream_i,
    output reg  [`STREAM_MOPORT(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] mstream_o,

    input wire signed [`WORD_WIDTH - 1:0] v0x,
    input wire signed [`WORD_WIDTH - 1:0] v0y,
    input wire signed [`WORD_WIDTH - 1:0] v0z,
    input wire signed [`WORD_WIDTH - 1:0] v1x,
    input wire signed [`WORD_WIDTH - 1:0] v1y,
    input wire signed [`WORD_WIDTH - 1:0] v1z,
    input wire signed [`WORD_WIDTH - 1:0] v2x,
    input wire signed [`WORD_WIDTH - 1:0] v2y,
    input wire signed [`WORD_WIDTH - 1:0] v2z,

    input  wire [`STREAM_MIPORT(2 * `DIVIDER_WIDTH)] div_mstream_i,
    output wire [`STREAM_MOPORT(2 * `DIVIDER_WIDTH)] div_mstream_o,

    input  wire [`STREAM_SIPORT(`DIVIDER_WIDTH)] div_sstream_i,
    output wire [`STREAM_SOPORT(`DIVIDER_WIDTH)] div_sstream_o
);


endmodule
