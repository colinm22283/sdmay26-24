module end_pipe_m(
    input wire clk_i,
    input wire nrst_i,

    input  wire [`STREAM_SIPORT(`RAST_WAVG_OUT_WIDTH)] sstream_i,
    output wire [`STREAM_SOPORT(`RAST_WAVG_OUT_WIDTH)] sstream_o,

    output wire filt_depth_fly_o,
    output wire tex_fly_o,

    input  wire [`BUS_MIPORT] depth_mport_i,
    output wire [`BUS_MOPORT] depth_mport_o,

    input  wire [`BUS_MIPORT] pix_mport_i,
    output wire [`BUS_MOPORT] pix_mport_o,

    input  wire [`BUS_MIPORT] tex_mport_i,
    output wire [`BUS_MOPORT] tex_mport_o,

    output wire busy_o,

    input  wire fb_i,

    input  wire [`BUS_ADDR_PORT] tex_addr_i,
    input  wire [`TEX_DIM] tex_width_i,
    input  wire [`TEX_DIM] tex_height_i
);

    wire [`STREAM_MIPORT(`RAST_DT_OUT_WIDTH)] filt_depth_streami;
    wire [`STREAM_MOPORT(`RAST_DT_OUT_WIDTH)] filt_depth_streamo;

    wire [`STREAM_MIPORT(`RAST_TS_OUT_WIDTH)] tex_streami;
    wire [`STREAM_MOPORT(`RAST_TS_OUT_WIDTH)] tex_streamo;

    assign filt_depth_fly_o = filt_depth_streami[`STREAM_MI_READY(`RAST_DT_OUT_WIDTH)] && filt_depth_streamo[`STREAM_MO_VALID(`RAST_DT_OUT_WIDTH)];
    assign tex_fly_o = tex_streami[`STREAM_MI_READY(`RAST_TS_OUT_WIDTH)] && tex_streamo[`STREAM_MO_VALID(`RAST_TS_OUT_WIDTH)];

    wire depth_busy, write_busy;

    depth_test_m depth_test(
        .clk_i(clk_i),
        .nrst_i(nrst_i),

        .sstream_i(sstream_i),
        .sstream_o(sstream_o),

        .mstream_i(filt_depth_streami),
        .mstream_o(filt_depth_streamo),

        .mport_i(depth_mport_i),
        .mport_o(depth_mport_o),
        
        .busy_o(depth_busy)
    );

    tex_sample_m tex_sample(
        .clk_i(clk_i),
        .nrst_i(nrst_i),

        .sstream_i(filt_depth_streamo),
        .sstream_o(filt_depth_streami),

        .mstream_i(tex_streami),
        .mstream_o(tex_streamo),

        .mport_i(tex_mport_i),
        .mport_o(tex_mport_o),

        .tex_addr_i(tex_addr_i),
        .tex_width_i(tex_width_i),
        .tex_height_i(tex_height_i)
    );

    mem_write_m mem_write(
        .clk_i(clk_i),
        .nrst_i(nrst_i),

        .busy_o(write_busy),

        .sstream_i(tex_streamo),
        .sstream_o(tex_streami),

        .mport_i(pix_mport_i),
        .mport_o(pix_mport_o),
        
        .fb_i(fb_i)
    );

    assign busy_o = depth_busy || write_busy;

endmodule