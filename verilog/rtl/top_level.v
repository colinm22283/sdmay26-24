// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module top_level_m #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input  wire wb_clk_i,
    input  wire wb_rst_i,
    input  wire wbs_stb_i,
    input  wire wbs_cyc_i,
    input  wire wbs_we_i,
    input  wire [3:0] wbs_sel_i,
    input  wire [31:0] wbs_dat_i,
    input  wire [31:0] wbs_adr_i,
    output wire wbs_ack_o,
    output wire [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  wire [127:0] la_data_in,
    output wire [127:0] la_data_out,
    input  wire [127:0] la_oenb,

    // IOs
    input  wire [`MPRJ_IO_PADS-1:0] io_in,
    output reg  [`MPRJ_IO_PADS-1:0] io_out,
    output reg  [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout wire [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input wire user_clock2,

    // User maskable interrupt signals
    output wire [2:0] user_irq
);

    assign wbs_ack_o = 0;
    assign wbs_dat_o = 0;

    assign la_data_out = 0;

    assign user_irq = 0;

    wire clk, nrst;
    assign clk = wb_clk_i;
    assign nrst = la_data_in[0];

    reg  run;
    wire busy;
    reg [7:0] color;

    reg [`BUS_ADDR_PORT] tex_addr;
    reg [`TEX_DIM] tex_width;

    reg [31:0] t0x;
    reg [31:0] t0y;
    reg [31:0] t1x;
    reg [31:0] t1y;
    reg [31:0] t2x;
    reg [31:0] t2y;

    reg [31:0] v0x;
    reg [31:0] v0y;
    reg [31:0] v0z;
    reg [31:0] v1x;
    reg [31:0] v1y;
    reg [31:0] v1z;
    reg [31:0] v2x;
    reg [31:0] v2y;
    reg [31:0] v2z;

    rasterizer_m rasterizer(
        .clk_i(clk),
        .nrst_i(nrst),

        .depth_mport_i({ mportai }),
        .depth_mport_o({ mportao }),

        .pix_mport_i({ mportbi }),
        .pix_mport_o({ mportbo }),

        .tex_mport_i({ mportci }),
        .tex_mport_o({ mportco }),

        .run_i(run),
        .busy_o(busy),

        .tex_addr_i(tex_addr),
        .tex_width_i(tex_width),

        .fb_i(!fb),

        .t0x(t0x),
        .t0y(t0y),
        .t1x(t1x),
        .t1y(t1y),
        .t2x(t2x),
        .t2y(t2y),

        .v0x(v0x),
        .v0y(v0y),
        .v0z(v0z),
        .v1x(v1x),
        .v1y(v1y),
        .v1z(v1z),
        .v2x(v2x),
        .v2y(v2y),
        .v2z(v2z)
    );

    always @(*) begin
        io_oeb <= 0;
        io_out <= 0;

        io_oeb[11:8] <= spi1_sio_en;
        io_oeb[13]    <= spi1_dqsm_en;

        io_out[11:8] <= spi1_mosi;
        io_out[7]    <= spi1_cs;
        io_out[12]   <= spi1_clk;
        io_out[13]   <= spi1_dqsmo;

        spi1_miso  <= io_in[11:8];
        spi1_dqsmi <= io_in[13];

        io_oeb[19:16] <= spi2_sio_en;
        io_oeb[13]    <= spi2_dqsm_en;

        io_out[19:16] <= spi2_mosi;
        io_out[15]    <= spi2_cs;
        io_out[20]   <= spi2_clk;
        io_out[21]   <= spi2_dqsmo;

        spi2_miso  <= io_in[19:16];
        spi2_dqsmi <= io_in[21];

        io_out[26:24] <= red;
        io_out[30:28] <= green;
        { io_out[31], io_out[27] } <= blue;

        io_out[23] <= hsync;
        io_out[22] <= vsync;
    end

endmodule	// user_project_wrapper

`default_nettype wire

