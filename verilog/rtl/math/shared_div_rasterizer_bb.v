module shared_div_rasterizer_m(
    input wire clk_i,
    input wire nrst_i,

    input  wire [`STREAM_SIPORT_SIZE(2 * `DIVIDER_WIDTH) * `DIVIDER_USERS - 1:0] sstreams_i,
    output wire [`STREAM_SOPORT_SIZE(2 * `DIVIDER_WIDTH) * `DIVIDER_USERS - 1:0] sstreams_o,

    input  wire [`STREAM_MIPORT_SIZE(`DIVIDER_WIDTH) * `DIVIDER_USERS - 1:0] mstreams_i,
    output wire [`STREAM_MOPORT_SIZE(`DIVIDER_WIDTH) * `DIVIDER_USERS - 1:0] mstreams_o
);

endmodule
