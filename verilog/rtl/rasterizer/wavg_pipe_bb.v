module wavg_pipe_m(
    input wire clk_i,
    input wire nrst_i,

    input  wire [`STREAM_SIPORT(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] sstream_i,
    output wire [`STREAM_SOPORT(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] sstream_o,

    input  wire [`STREAM_MIPORT(`RAST_WAVG_OUT_WIDTH)] mstream_i,
    output wire [`STREAM_MOPORT(`RAST_WAVG_OUT_WIDTH)] mstream_o,

    input wire [`WORD_WIDTH - 1:0] t0x,
    input wire [`WORD_WIDTH - 1:0] t0y,
    input wire [`WORD_WIDTH - 1:0] t1x,
    input wire [`WORD_WIDTH - 1:0] t1y,
    input wire [`WORD_WIDTH - 1:0] t2x,
    input wire [`WORD_WIDTH - 1:0] t2y,

    input wire signed [`WORD_WIDTH - 1:0] v0z,
    input wire signed [`WORD_WIDTH - 1:0] v1z,
    input wire signed [`WORD_WIDTH - 1:0] v2z,

    input  wire [`STREAM_MIPORT(2 * `DIVIDER_WIDTH)] div0_mstream_i,
    output wire [`STREAM_MOPORT(2 * `DIVIDER_WIDTH)] div0_mstream_o,

    input  wire [`STREAM_SIPORT(`DIVIDER_WIDTH)] div0_sstream_i,
    output wire [`STREAM_SOPORT(`DIVIDER_WIDTH)] div0_sstream_o,

    input  wire [`STREAM_MIPORT(2 * `DIVIDER_WIDTH)] div1_mstream_i,
    output wire [`STREAM_MOPORT(2 * `DIVIDER_WIDTH)] div1_mstream_o,

    input  wire [`STREAM_SIPORT(`DIVIDER_WIDTH)] div1_sstream_i,
    output wire [`STREAM_SOPORT(`DIVIDER_WIDTH)] div1_sstream_o
);
endmodule