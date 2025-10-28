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

module user_project_wrapper #(
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
    assign nrst = !wb_rst_i;

    wire [`BUS_MIPORT] mportai;
    reg  [`BUS_MOPORT] mportao;

    wire [`BUS_SIPORT] sportai;
    wire [`BUS_SOPORT] sportao;

    busarb_m #(1, 1, 1) arbiter(
        .clk_i(clk),
        .nrst_i(nrst),

        .mports_i({ mportao }),
        .mports_o({ mportai }),

        .sports_i({ sportao }),
        .sports_o({ sportai })
    );

    wire spi_clk;
    wire spi_cs;
    wire [3:0] spi_mosi;
    reg  [3:0] spi_miso;
    reg  spi_dqsmi;
    wire spi_dqsmo;
    wire [3:0] spi_sio_en;
    wire spi_dqsm_en;

    wire debug;

    assign debug = spi_dqsm_en;

    spi_mem_m #(0, 1024) spi_mem(
        .clk_i(clk),
        .nrst_i(nrst),

        .sport_i({ sportai }),
        .sport_o({ sportao }),

        .spi_clk_o(spi_clk),
        .spi_cs_o(spi_cs),
        .spi_mosi_o(spi_mosi),
        .spi_miso_i(spi_miso),
        .spi_dqsm_i(spi_dqsmi),
        .spi_dqsm_o(spi_dqsmo),

        .spi_sio_en_o(spi_sio_en),
        .spi_dqsm_en_o(spi_dqsm_en)
    );

    reg [7:0] state;

    always @(posedge clk, negedge nrst) begin
        if (!nrst) begin
            state <= 0;

            mportao <= 0;
        end
        else if (clk) begin
            case (state)
                0: begin
                    if (mportai[`BUS_MI_ACK]) state <= 1;

                    mportao[`BUS_MO_ADDR] <= 10;
                    mportao[`BUS_MO_DATA] <= 1;
                    mportao[`BUS_MO_SIZE] <= `BUS_SIZE_BYTE;
                    mportao[`BUS_MO_RW]   <= `BUS_WRITE;
                    mportao[`BUS_MO_REQ]  <= 1;
                end

                1: begin
                    if (!mportai[`BUS_MI_ACK]) begin
                        state <= 2;

                        mportao[`BUS_MO_REQ]  <= 0;
                    end
                end

                2: begin
                    if (mportai[`BUS_MI_ACK]) state <= 3;

                    mportao[`BUS_MO_ADDR] <= 10;
                    mportao[`BUS_MO_SIZE] <= `BUS_SIZE_BYTE;
                    mportao[`BUS_MO_RW]   <= `BUS_READ;
                    mportao[`BUS_MO_REQ]  <= 1;
                end

                3: begin
                    if (!mportai[`BUS_MI_ACK]) begin
                        state <= 4;

                        mportao[`BUS_MO_REQ]  <= 0;
                    end
                end

                4: begin
                    state <= 0;
                end
            endcase
        end
    end

    always @(*) begin
        io_oeb <= 0;
        io_out <= 0;

        io_oeb[27:24] <= spi_sio_en;
        io_oeb[30]    <= spi_dqsm_en;

        io_out[27:24] <= spi_mosi;
        io_out[28]    <= spi_cs;
        io_out[29]    <= spi_clk;
        io_out[30]    <= spi_dqsmo;

        io_out[31]    <= debug;

        spi_miso  <= io_in[27:24];
        spi_dqsmi <= io_in[30];
    end

endmodule	// user_project_wrapper

`default_nettype wire
