/*
    Generic configuration register connected to
    the Wishbone bus. Address must be specified here
    AND using `address_map in user_project_wrapper.
    Address doesn't need to be set if size = 1.

    Allows you to select certain bits for read/write
    perms and set the register reset value. These
    should be constants.

    Uses lib_wishbone_helper, meaning all writes/reads
    have to be in 32-bit (word) sizes. The only allowed
    register sizes are word increments.
*/
module wishbone_register #(
    parameter ADDRESS = 0,
    parameter SIZE_WORDS = 1
) (
    // Wishbone
    input wire wb_clk_i,
    input wire wb_rst_i,
    input wire wbs_stb_i,
    input wire wbs_cyc_i,
    input wire wbs_we_i,
    input wire [3:0] wbs_sel_i,
    input wire [`WORD_WIDTH-1:0] wbs_dat_i,
    input wire [`WORD_WIDTH-1:0] wbs_adr_i,
    output reg wbs_ack_o,
    output reg [`WORD_WIDTH-1:0] wbs_dat_o,

    // Register
    input wire [(SIZE_WORDS * `WORD_WIDTH)-1:0] access_read_mask_i,
    input wire [(SIZE_WORDS * `WORD_WIDTH)-1:0] access_write_mask_i,
    input wire [(SIZE_WORDS * `WORD_WIDTH)-1:0] reset_value_i,
    output reg [(SIZE_WORDS * `WORD_WIDTH)-1:0] reg_o,
);

    wire wbs_we;
    lib_wishbone_helper wb_helper(
        .wb_clk_i(wb_clk_i),
        .wbs_we_i(wbs_we_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_sel_i(wbs_sel_i),
        .wbs_effective_we_o(wbs_we),
        .wbs_ack_o(wbs_ack_o)
    );

    // (wbs_adr_i - ADDRESS) = 0 should return reg_o[31:0]
    wire [`WORD_WIDTH-1:0] bit_offset;
    assign bit_offset = (SIZE_WORDS == 1) ? 0 : {(wbs_adr_i - ADDRESS), 3'b000}; // Bit offset = byte offset * 8
    assign wbs_dat_o = reg_o[bit_offset +: `WORD_WIDTH-1] & access_read_mask_i;

    always @ (posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin // Wishbone rst is positive
            reg_o <= reset_value_i;
        end
        else if (wb_clk_i) begin
            if (wbs_we) begin
                reg_o[bit_offset +: `WORD_WIDTH-1] <= wbs_dat_i & access_write_mask_i;
            end
        end
    end

endmodule