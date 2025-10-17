module div_m #(parameter WIDTH = 32) (
    input  wire signed [WIDTH - 1:0] a_i,
    input  wire signed [WIDTH - 1:0] b_i,
    output wire signed [WIDTH - 1:0] y_o
);

    wire signed [WIDTH * 2 - 1:0] a, b;

    assign a = {{WIDTH{a_i[WIDTH - 1]}}, a_i };
    assign b = {{WIDTH{b_i[WIDTH - 1]}}, b_i };

    assign y_o = (a << `DECIMAL_POS) / b;

endmodule