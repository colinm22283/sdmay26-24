module mul_m #(parameter WIDTH = 32) (
    input  wire signed [WIDTH - 1:0] a_i,
    input  wire signed [WIDTH - 1:0] b_i,
    output wire signed [WIDTH - 1:0] y_o
);

    wire [63:0] a, b;

    assign a = {{32{a_i[WIDTH - 1]}}, a_i };
    assign b = {{32{b_i[WIDTH - 1]}}, b_i };

    assign y_o = (a * b) >> `DECIMAL_POS;

endmodule