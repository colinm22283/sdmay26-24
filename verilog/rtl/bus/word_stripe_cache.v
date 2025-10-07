module word_stripe_cache_m #(
    parameter STRIPE_SIZE = 8
) (
    input wire clk_i,
    input wire nrst_i,

    input  wire [`BUS_MOPORT] cached_mport_i,
    output wire [`BUS_MIPORT] cached_mport_o,

    input  wire [`BUS_MIPORT] mport_i,
    output wire [`BUS_MOPORT] mport_o
);

    assign mport_o = cached_mport_i;
    assign cached_mport_o = mport_i;

    localparam STATE_READY = 3'b000;

    reg [2:0] state;

    reg [`BUS_ADDR_PORT] stripe_addr;
    reg [$clog2(STRIPE_SIZE) - 1:0] stripe_size;
    reg [31:0] stripe [STRIPE_SIZE - 1:0];

    always @(posedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            state <= STATE_READY;

            stripe_addr <= 0;
            stripe_size <= 0;
        end
        else if (clk_i) begin
            case (state)
                STATE_READY: begin
                    if (cached_mport_i[`BUS_MO_REQ]) begin

                    end
                end
            endcase
        end
    end

endmodule