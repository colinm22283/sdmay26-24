module bary_pipe_m #(
    parameter WORD_WIDTH = 32,
    parameter WIDTH = 320,
    parameter HEIGHT = 240,

    parameter WORD_SMAX = 1 << (WORD_WIDTH - 1),

    parameter SC_WIDTH = $clog2(WIDTH > HEIGHT ? WIDTH : HEIGHT)
) (
    input wire clk_i,
    input wire nrst_i,

    input  wire [`BUS_MIPORT] mport_i,
    output reg  [`BUS_MOPORT] mport_o,

    input wire run_i,

    output wire ready_o,

    input wire [SC_WIDTH - 1:0] posx,
    input wire [SC_WIDTH - 1:0] posy,

    input wire signed [WORD_WIDTH - 1:0] v0x,
    input wire signed [WORD_WIDTH - 1:0] v0y,
    input wire signed [WORD_WIDTH - 1:0] v0z,
    input wire signed [WORD_WIDTH - 1:0] v1x,
    input wire signed [WORD_WIDTH - 1:0] v1y,
    input wire signed [WORD_WIDTH - 1:0] v1z,
    input wire signed [WORD_WIDTH - 1:0] v2x,
    input wire signed [WORD_WIDTH - 1:0] v2y,
    input wire signed [WORD_WIDTH - 1:0] v2z,

    output reg signed [WORD_WIDTH - 1:0] l0,
    output reg signed [WORD_WIDTH - 1:0] l1,
    output reg signed [WORD_WIDTH - 1:0] l2
);

    localparam STATE_READY  = 3'b000;
    localparam STATE_SETUP1 = 3'b001;
    localparam STATE_SETUP2 = 3'b010;
    localparam STATE_SETUP3 = 3'b011;
    localparam STATE_RUN    = 3'b100;

    reg [2:0] state;

    reg source_swap;
    always @(*) begin
        case (state)
            STATE_READY, STATE_SETUP1, STATE_SETUP2, STATE_SETUP3: source_swap <= 1;
            default: source_swap <= 0;
        endcase
    end

    wire signed [WORD_WIDTH - 1:0] s1a; wire signed [WORD_WIDTH - 1:0] s1b;
    reg  signed [WORD_WIDTH - 1:0] as1a; reg  signed [WORD_WIDTH - 1:0] as1b;
    wire signed [WORD_WIDTH - 1:0] _s1a; wire signed [WORD_WIDTH - 1:0] _s1b;
    assign _s1a = source_swap ? as1a : s1a; assign _s1b = source_swap ? as1b : s1b;
    wire signed [WORD_WIDTH - 1:0] s1y;
    sub_m #(WORD_WIDTH) sub1( .a_i(_s1a), .b_i(_s1b), .y_o(s1y) );

    wire signed [WORD_WIDTH - 1:0] s2a; wire signed [WORD_WIDTH - 1:0] s2b;
    reg  signed [WORD_WIDTH - 1:0] as2a; reg  signed [WORD_WIDTH - 1:0] as2b;
    wire signed [WORD_WIDTH - 1:0] _s2a; wire signed [WORD_WIDTH - 1:0] _s2b;
    assign _s2a = source_swap ? as2a : s2a; assign _s2b = source_swap ? as2b : s2b;
    wire signed [WORD_WIDTH - 1:0] s2y;
    sub_m #(WORD_WIDTH) sub2( .a_i(_s2a), .b_i(_s2b), .y_o(s2y) );

    reg signed [WORD_WIDTH - 1:0] y1my2, x2mx1, x0mx2, y0my2;

    wire signed [WORD_WIDTH - 1:0] m1a; wire signed [WORD_WIDTH - 1:0] m1b;
    wire signed [WORD_WIDTH - 1:0] _m1a; wire signed [WORD_WIDTH - 1:0] _m1b;
    assign _m1a = source_swap ? y1my2 : m1a; assign _m1b = source_swap ? s1y : m1b;
    wire signed [WORD_WIDTH - 1:0] m1y;
    mul_m #(WORD_WIDTH) mul1( .a_i(_m1a), .b_i(_m1b), .y_o(m1y) );

    wire signed [WORD_WIDTH - 1:0] m2a; wire signed [WORD_WIDTH - 1:0] m2b;
    wire signed [WORD_WIDTH - 1:0] _m2a; wire signed [WORD_WIDTH - 1:0] _m2b;
    assign _m2a = source_swap ? x2mx1 : m2a; assign _m2b = source_swap ? s2y : m2b;
    wire signed [WORD_WIDTH - 1:0] m2y;
    mul_m #(WORD_WIDTH) mul2( .a_i(_m2a), .b_i(_m2b), .y_o(m2y) );

    wire signed [WORD_WIDTH - 1:0] a1a; wire signed [WORD_WIDTH - 1:0] a1b;
    wire signed [WORD_WIDTH - 1:0] _a1a; wire signed [WORD_WIDTH - 1:0] _a1b;
    assign _a1a = source_swap ? m1y : a1a; assign _a1b = source_swap ? m2y : a1b;
    wire signed [WORD_WIDTH - 1:0] a1y;
    add_m #(WORD_WIDTH) add1( .a_i(_a1a), .b_i(_a1b), .y_o(a1y) );

    wire signed [WORD_WIDTH - 1:0] i1a;
    wire signed [WORD_WIDTH - 1:0] i1y;
    inv_m #(WORD_WIDTH) inv1( .a_i(i1a), .y_o(i1y) );

    wire signed [WORD_WIDTH - 1:0] m3a; wire signed [WORD_WIDTH - 1:0] m3b;
    wire signed [WORD_WIDTH - 1:0] m3y;
    mul_m #(WORD_WIDTH) mul3( .a_i(m3a), .b_i(m3b), .y_o(m3y) );

    wire signed [WORD_WIDTH - 1:0] m4a; wire signed [WORD_WIDTH - 1:0] m4b;
    wire signed [WORD_WIDTH - 1:0] m4y;
    mul_m #(WORD_WIDTH) mul4( .a_i(m4a), .b_i(m4b), .y_o(m4y) );
    
    wire signed [WORD_WIDTH - 1:0] a2a; wire signed [WORD_WIDTH - 1:0] a2b;
    wire signed [WORD_WIDTH - 1:0] a2y;
    add_m #(WORD_WIDTH) add2( .a_i(a2a), .b_i(a2b), .y_o(a2y) );

    wire signed [WORD_WIDTH - 1:0] m5a; wire signed [WORD_WIDTH - 1:0] m5b;
    wire signed [WORD_WIDTH - 1:0] m5y;
    mul_m #(WORD_WIDTH) mul5( .a_i(m5a), .b_i(m5b), .y_o(m5y) );

    wire signed [WORD_WIDTH - 1:0] m6a; wire signed [WORD_WIDTH - 1:0] m6b;
    wire signed [WORD_WIDTH - 1:0] m6y;
    mul_m #(WORD_WIDTH) mul6( .a_i(m6a), .b_i(m6b), .y_o(m6y) );

    reg signed [WORD_WIDTH - 1:0] x2mx0, y2my0;

    reg signed [WORD_WIDTH - 1:0] det_t;

    reg signed [WORD_WIDTH - 1:0] inv_det_t;

    assign i1a = det_t;

    assign s1a = posx;
    assign s1b = v2x;

    assign s2a = posy;
    assign s2b = v2y;

    assign m1a = y1my2;
    assign m1b = s1y;

    assign m2a = x2mx1;
    assign m2b = s2y;

    assign m3a = y2my0;
    assign m3b = s1y;

    assign m4a = x0mx2;
    assign m4b = s2y;

    reg                           prods_ready;
    reg signed [WORD_WIDTH - 1:0] l0_prods0;
    reg signed [WORD_WIDTH - 1:0] l0_prods1;
    reg signed [WORD_WIDTH - 1:0] l1_prods0;
    reg signed [WORD_WIDTH - 1:0] l1_prods1;

    assign a1a = l0_prods0;
    assign a1b = l0_prods1;

    assign a2a = l1_prods0;
    assign a2b = l1_prods1;

    assign m5a = a1y;
    assign m5b = inv_det_t;

    assign m6a = a2y;
    assign m6b = inv_det_t;

    reg lambdas_ready;

    always @(posedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            state <= STATE_READY;

            mport_o <= 0;

            y1my2 <= 0;
            x2mx1 <= 0;
            y0my2 <= 0;
            x2mx0 <= 0;
            y2my0 <= 0;
            x0mx2 <= 0;

            det_t <= 0;

            inv_det_t <= 0;

            prods_ready  <= 0;
            l0_prods0 <= 0;
            l0_prods1 <= 0;
            l1_prods0 <= 0;
            l1_prods1 <= 0;

            lambdas_ready <= 0;
            l0 <= 0;
            l1 <= 0;
            l2 <= 0;
        end
        else if (clk_i) begin
            case (state)
                STATE_READY: begin
                    if (run_i) begin
                        state <= STATE_SETUP1;

                        as1a <= v1y;
                        as1b <= v2y;
                        as2a <= v2x;
                        as2b <= v1x;
                    end

                    prods_ready <= 0;
                end

                STATE_SETUP1: begin
                    state <= STATE_SETUP2;

                    y1my2 <= s1y;
                    x2mx1 <= s2y;

                    as1a <= v0x;
                    as1b <= v2x;
                    as2a <= v0y;
                    as2b <= v2y;
                end

                STATE_SETUP2: begin
                    state <= STATE_SETUP3;

                    x0mx2 <= s1y;
                    y0my2 <= s2y;

                    det_t <= a1y;

                    as1a <= v2x;
                    as1b <= v0x;
                    as2a <= v2y;
                    as2b <= v0y;
                end

                STATE_SETUP3: begin
                    state <= STATE_RUN;

                    x2mx0 <= s1y;
                    y2my0 <= s2y;

                    inv_det_t <= i1y;
                end

                STATE_AWAIT_LOC: begin
                    prods_ready  <= 1;
                    
                    
                end

            endcase
        end
    end

    assign ready_o = (state == STATE_RUN);

endmodule