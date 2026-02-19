module bary_pipe_m(
    input wire clk_i,
    input wire nrst_i,

    input  wire run_i,
    output wire init_o,
    output wire discard_o,
    output wire busy_o,

    input  wire [`STREAM_SIPORT(`SC_WIDTH * 2)] sstream_i,
    output wire [`STREAM_SOPORT(`SC_WIDTH * 2)] sstream_o,

    input  wire [`STREAM_MIPORT(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] mstream_i,
    output wire [`STREAM_MOPORT(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] mstream_o,

    output wire bary_check_fly_o,

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

    wire [`STREAM_MIPORT(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] bary_check_streami;
    wire [`STREAM_MOPORT(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] bary_check_streamo;

    wire bary_busy, bary_check_busy;

    assign bary_check_fly_o =
        bary_check_streami[`STREAM_MI_READY(`SC_WIDTH * 2 + `WORD_WIDTH * 3)] &&
        bary_check_streamo[`STREAM_MO_VALID(`SC_WIDTH * 2 + `WORD_WIDTH * 3)];

    bary_calc_pipe_m bary_pipe(
        .clk_i(clk_i),
        .nrst_i(nrst_i),

        .run_i(run_i),
        .init_o(init_o),
        .discard_o(discard_o),
        .busy_o(bary_busy),

        .sstream_i(sstream_i),
        .sstream_o(sstream_o),

        .mstream_i(bary_check_streami),
        .mstream_o(bary_check_streamo),

        .v0x(v0x),
        .v0y(v0y),
        .v0z(v0z),
        .v1x(v1x),
        .v1y(v1y),
        .v1z(v1z),
        .v2x(v2x),
        .v2y(v2y),
        .v2z(v2z),
        
        .div_mstream_i(div_mstream_i),
        .div_mstream_o(div_mstream_o),

        .div_sstream_i(div_sstream_i),
        .div_sstream_o(div_sstream_o)
    );

    bary_check_pipe_m bary_check_pipe(
        .clk_i(clk_i),
        .nrst_i(nrst_i),

        .sstream_i(bary_check_streamo),
        .sstream_o(bary_check_streami),

        .mstream_i(mstream_i),
        .mstream_o(mstream_o),

        .busy_o(bary_check_busy)
    );

    assign busy_o = bary_busy || bary_check_busy;

endmodule
