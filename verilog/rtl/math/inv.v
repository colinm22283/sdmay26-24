module inv_m #(parameter WIDTH = 32) (
    input  wire signed [WIDTH - 1:0] a_i,
    output wire signed [WIDTH - 1:0] y_o
);

    wire [63:0] a;

    assign a = a_i;

    assign y_o = (64'd1 << (2 * `DECIMAL_POS)) / a;

endmodule