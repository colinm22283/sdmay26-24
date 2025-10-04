module busarb_2_2(
    input wire clk_i,
    input wire nrst_i,

    input  wire [(`BUS_MOPORT_SIZE * 4) - 1:0] mports_i,
    output reg  [(`BUS_MIPORT_SIZE * 4) - 1:0] mports_o,

    input  wire [(`BUS_SOPORT_SIZE * 4) - 1:0] sports_i,
    output reg  [(`BUS_SIPORT_SIZE * 4) - 1:0] sports_o
);

    busarb_m #(4, 4, 1) arbiter(
        .clk_i(clk_i),
        .nrst_i(nrst_i),

        .mports_i(mports_i),
        .mports_o(mports_o),

        .sports_i(sports_i),
        .sports_o(sports_o)
    );

endmodule