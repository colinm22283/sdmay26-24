module byte_write_stripe_cache_m #(
    parameter STRIPE_SIZE = 8
) (
    input wire clk_i,
    input wire nrst_i,

    input  wire [`BUS_MOPORT] cached_mport_i,
    output wire [`BUS_MIPORT] cached_mport_o,

    input  wire [`BUS_MIPORT] mport_i,
    output wire [`BUS_MOPORT] mport_o
);

    wire [`BUS_MOPORT] cached_mporti;
    reg [`BUS_MIPORT] cached_mporto;

    wire [`BUS_MIPORT] mporti;
    reg [`BUS_MOPORT] mporto;

    assign mporti = cached_mport_i[`BUS_MO_SIZE] == `BUS_SIZE_BYTE ? mport_i : 0;
    assign cached_mporti = cached_mport_i[`BUS_MO_SIZE] == `BUS_SIZE_BYTE ? cached_mport_i : 0;

    assign mport_o = cached_mport_i[`BUS_MO_SIZE] == `BUS_SIZE_BYTE ? mporto : cached_mport_i;
    assign cached_mport_o = cached_mport_i[`BUS_MO_SIZE] == `BUS_SIZE_BYTE ? cached_mporto : mport_i;

    localparam STATE_READY      = 3'b000;
    localparam STATE_REQ        = 3'b001;
    localparam STATE_ACK        = 3'b010;
    localparam STATE_CACHE_DUMP = 3'b011;

    reg [2:0] state;

    reg [$clog2(STRIPE_SIZE) - 1:0] buffer_size;
    reg [`BUS_ADDR_PORT] buffer_addr;

    reg [7:0] buffer [STRIPE_SIZE - 1:0];

    always @(posedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            state <= STATE_READY;

            buffer_size <= 0;
            buffer_addr <= 0;
        end
        else if (clk_i) begin
            case (state)
                STATE_READY: begin
                    if (cached_mporti[`BUS_MO_REQ]) begin
                        if (cached_mporti[`BUS_MO_ADDR] - buffer_addr >= STRIPE_SIZE) begin
                            state <= STATE_CACHE_DUMP;
                        end
                        else begin
                            state <= STATE_REQ;
                        end

                        cached_mporto[`BUS_MI_ACK] <= 1;
                    end
                end

                STATE_REQ: begin
                    state <= STATE_ACK;

                    buffer[cached_mporti[`BUS_MO_ADDR] - buffer_addr] <= cached_mporti[`BUS_MO_DATA];
                    
                    buffer_size <= cached_mporti[`BUS_MO_ADDR] - buffer_addr;

                    cached_mporto[`BUS_MI_ACK] <= 0;
                end

                STATE_ACK: begin
                    if (!cached_mporti[`BUS_MO_REQ]) state <= STATE_READY;
                end

                STATE_CACHE_DUMP: begin
                end
            endcase
        end
    end

endmodule