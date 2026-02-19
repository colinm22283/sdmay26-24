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

endmodule
