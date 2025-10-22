`default_nettype none

module user_project_wrapper #(
    /* verilator lint_off UNUSEDPARAM */
    parameter BITS = 32
    /* verilator lint_on UNUSEDPARAM */
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
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    /* verilator lint_off UNUSEDSIGNAL */
    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
    /* verilator lint_on UNUSEDSIGNAL */
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

reg [31:0] wbs_dat_s; // Override prior definitions and make these regs.
reg wbs_ack_s;

assign wbs_dat_o = wbs_dat_s;
assign wbs_ack_o = wbs_ack_s;

localparam integer NUM_ADDRS = 2;

wire [31:0] wbs_datN_o [NUM_ADDRS:0];
wire wbs_ackN_o [NUM_ADDRS-1:0];
reg wbs_stbN_i [NUM_ADDRS-1:0];

`define address_map(n, address, mask)      \
    wbs_stbN_i[n] = 0;                      \
    if ((wbs_adr_i & mask) == address) begin \
        wbs_dat_s = wbs_datN_o[n];          \
        wbs_ack_s = wbs_ackN_o[n];          \
        wbs_stbN_i[n] = wbs_stb_i;          \
    end

always @* begin
    wbs_dat_s = 0;
    wbs_ack_s = 0;

    // Add entries here to allocate more address ranges
    `address_map(0, 32'h30123400, 32'hFFFFFF00);
end

wire [`BUS_MIPORT] mportai;
reg  [`BUS_MOPORT] mportao;

always @ (*) begin
  mportai[`BUS_MI_SEQSLV] = 1;
  mportai[`BUS_MI_DATA] = 32'h1C1C1C1C; // Green on every pixel
end

vga_m #(0, 0) my_vga (
  .clk_i(wb_clk_i),
  .nrst_i(wb_rst_i),
  .enable_i(1),
  .prescaler_i(2),
  .resolution_i(`VGA_RES_320x240),
  .base_h_active_i(`VGA_BASE_H_ACTIVE),
  .base_h_fporch_i(`VGA_BASE_H_FPORCH),
  .base_h_sync_i(`VGA_BASE_H_SYNC),
  .base_h_bporch_i(`VGA_BASE_H_BPORCH),
  .base_v_active_i(`VGA_BASE_V_ACTIVE),
  .base_v_fporch_i(`VGA_BASE_V_FPORCH),
  .base_v_sync_i(`VGA_BASE_V_SYNC),
  .base_v_bporch_i(`VGA_BASE_V_BPORCH),
  .mport_i(mportai),
  .mport_o(mportao),
  .fb_i(0),
  .pixel_o(io_out[31:24]),
  .hsync_o(io_out[22:22]),
  .vsync_o(io_out[23:23])
);

// set pin directions
assign io_oeb[`MPRJ_IO_PADS-1:21] = {`MPRJ_IO_PADS-1-21 + 1{1'b1}};
assign io_oeb[20] = 'b0;
assign io_oeb[19:17] = {19-17 + 1{1'b1}};
assign io_oeb[16] = 'b0;
assign io_oeb[15:0] = {15-0 + 1{1'b1}};

assign io_out[`MPRJ_IO_PADS-1:21] = {`MPRJ_IO_PADS-1-21 + 1{1'b0}};
assign io_out[19:17] = {19-17 + 1{1'b0}};
assign io_out[15:0] = {15-0 + 1{1'b0}};

assign la_data_out[127:0] = 0;
assign user_irq = 3'b000;


endmodule	// user_project_wrapper

`default_nettype wire
