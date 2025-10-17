module bary_pipe_m #(
    parameter WORD_WIDTH = 32,
    parameter WIDTH = 320,
    parameter HEIGHT = 240,

    parameter WORD_SMAX = 1 << (WORD_WIDTH - 2),

    parameter SC_WIDTH = $clog2(WIDTH > HEIGHT ? WIDTH : HEIGHT)
) (
    input wire clk_i,
    input wire nrst_i,

    input wire run_i,
    output reg init_o,
    output reg discard_o,
    output wire busy_o,

    input  wire [`STREAM_SIPORT(SC_WIDTH * 2)] sstream_i,
    output wire [`STREAM_SOPORT(SC_WIDTH * 2)] sstream_o,

    input  wire [`STREAM_MIPORT(SC_WIDTH * 2 + WORD_WIDTH * 3)] mstream_i,
    output reg  [`STREAM_MOPORT(SC_WIDTH * 2 + WORD_WIDTH * 3)] mstream_o,

    input wire signed [WORD_WIDTH - 1:0] v0x,
    input wire signed [WORD_WIDTH - 1:0] v0y,
    input wire signed [WORD_WIDTH - 1:0] v0z,
    input wire signed [WORD_WIDTH - 1:0] v1x,
    input wire signed [WORD_WIDTH - 1:0] v1y,
    input wire signed [WORD_WIDTH - 1:0] v1z,
    input wire signed [WORD_WIDTH - 1:0] v2x,
    input wire signed [WORD_WIDTH - 1:0] v2y,
    input wire signed [WORD_WIDTH - 1:0] v2z
);

    localparam STATE_READY     = 5'b00000;
    localparam STATE_SETUP1    = 5'b00001;
    localparam STATE_SETUP2    = 5'b00010;
    localparam STATE_SETUP3    = 5'b00011;
    localparam STATE_SETUP4    = 5'b00100;
    localparam STATE_SETUP5    = 5'b00101;
    localparam STATE_SETUP6    = 5'b00110;
    localparam STATE_SETUP7    = 5'b00111;
    localparam STATE_SETUP8    = 5'b01000;
    localparam STATE_AWAIT_POS = 5'b01001;
    localparam STATE_RUN1      = 5'b01010;
    localparam STATE_RUN2      = 5'b01011;
    localparam STATE_RUN3      = 5'b01100;
    localparam STATE_RUN4      = 5'b01101;
    localparam STATE_RUN5      = 5'b01110;
    localparam STATE_RUN6      = 5'b01111;
    localparam STATE_RUN7      = 5'b10000;
    localparam STATE_RUN8      = 5'b10001;
    localparam STATE_RUN9      = 5'b10010;
    localparam STATE_COMPLETE  = 5'b10011;
    localparam STATE_DONE      = 5'b10100;

    reg [4:0] state;

    reg last;

    reg  signed [WORD_WIDTH - 1:0] a1a; reg  signed [WORD_WIDTH - 1:0] a1b;
    wire signed [WORD_WIDTH - 1:0] a1y;
    add_m #(WORD_WIDTH) add1( .a_i(a1a), .b_i(a1b), .y_o(a1y) );

    reg  signed [WORD_WIDTH - 1:0] s1a; reg  signed [WORD_WIDTH - 1:0] s1b;
    wire signed [WORD_WIDTH - 1:0] s1y;
    sub_m #(WORD_WIDTH) sub1( .a_i(s1a), .b_i(s1b), .y_o(s1y) );

    reg  signed [WORD_WIDTH - 1:0] m1a; reg  signed [WORD_WIDTH - 1:0] m1b;
    wire signed [WORD_WIDTH - 1:0] m1y;
    mul_m #(WORD_WIDTH) mul1( .a_i(m1a), .b_i(m1b), .y_o(m1y) );

    wire signed [WORD_WIDTH - 1:0] i1a;
    wire signed [WORD_WIDTH - 1:0] i1y;
    inv_m #(WORD_WIDTH) inv1( .a_i(i1a), .y_o(i1y) );

    reg [SC_WIDTH - 1:0] posx, posy;

    reg signed [WORD_WIDTH - 1:0] y1my2, x2mx1, x0mx2, y0my2, x2mx0, y2my0, x1mx0;
    reg signed [WORD_WIDTH - 1:0] y1py0, y2py1, y0py2;

    reg signed [WORD_WIDTH - 1:0] temp1;
    reg signed [WORD_WIDTH - 1:0] temp2;

    reg signed [WORD_WIDTH - 1:0] det_t;

    reg signed [WORD_WIDTH - 1:0] inv_det_t;

    reg signed [WORD_WIDTH - 1:0] l0, l1,l2;

    assign i1a = det_t;

    assign busy_o = state != STATE_READY && state != STATE_DONE;

    always @(posedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            state <= STATE_READY;

            mstream_o <= 0;

            init_o <= 0;
            discard_o <= 0;

            posx <= 0;
            posy <= 0;

            y1my2 <= 0;
            x2mx1 <= 0;
            y0my2 <= 0;
            x2mx0 <= 0;
            y2my0 <= 0;
            x0mx2 <= 0;
            x1mx0 <= 0;
            y1py0 <= 0;
            y2py1 <= 0;
            y0py2 <= 0;

            inv_det_t <= 0;

            l0 <= WORD_SMAX;
            l1 <= WORD_SMAX;
            l2 <= WORD_SMAX;
        end
        else if (clk_i) begin
            case (state)
                STATE_READY: begin
                    if (run_i) begin
                        state <= STATE_SETUP1;

                        s1a <= v1y;
                        s1b <= v2y;

                        a1a <= v1y;
                        a1b <= v0y;
                    end

                    init_o <= 0;
                    discard_o <= 0;
                end

                STATE_SETUP1: begin
                    state <= STATE_SETUP2;

                    y1my2 <= s1y;

                    s1a <= v0x;
                    s1b <= v2x;

                    y1py0 <= a1y;

                    a1a <= v2y;
                    a1b <= v1y;
                end

                STATE_SETUP2: begin
                    state <= STATE_SETUP3;

                    x0mx2 <= s1y;

                    s1a <= v2x;
                    s1b <= v1x;

                    m1a <= y1my2;
                    m1b <= s1y;

                    y2py1 <= a1y;

                    a1a <= v0y;
                    a1b <= v2y;
                end

                STATE_SETUP3: begin
                    state <= STATE_SETUP4;

                    x2mx1 <= s1y;

                    s1a <= v0y;
                    s1b <= v2y;

                    temp1 <= m1y;

                    m1a <= x0mx2;
                    m1b <= a1y;

                    y0py2 <= a1y;
                end

                STATE_SETUP4: begin
                    state <= STATE_SETUP5;

                    y0my2 <= s1y;

                    s1a <= v1x;
                    s1b <= v0x;

                    temp2 <= m1y; // 0-2

                    m1a <= x2mx1;
                    m1b <= s1y;
                end

                STATE_SETUP5: begin
                    state <= STATE_SETUP6;

                    x1mx0 <= s1y;

                    s1a <= v2x;
                    s1b <= v0x;

                    a1a <= temp1;
                    a1b <= m1y;

                    m1a <= s1y;
                    m1b <= y1py0;
                end

                STATE_SETUP6: begin
                    state <= STATE_SETUP7;

                    x2mx0 <= s1y;

                    s1a <= v2y;
                    s1b <= v0y;
                    
                    det_t <= a1y;

                    a1a <= temp2;
                    a1b <= m1y; // 1-0

                    m1a <= x2mx1;
                    m1b <= y2py1;
                end

                STATE_SETUP7: begin
                    state <= STATE_SETUP8;

                    y2my0 <= s1y;
                    a1a <= a1y;
                    a1b <= m1y; // 2-1
                    
                    inv_det_t <= i1y;
                end

                STATE_SETUP8: begin
                    init_o <= 1;

                    if (a1y < 0) state <= STATE_AWAIT_POS;
                    else begin
                        state <= STATE_READY;

                        discard_o <= 1;
                    end
                end

                STATE_AWAIT_POS: begin : AWAIT_POS
                    reg [SC_WIDTH * 2 - 1:0] input_data;
                    reg [WORD_WIDTH - 1:0] posx_extended, posy_extended;

                    input_data = sstream_i[`STREAM_SI_DATA(SC_WIDTH * 2)];

                    posx = input_data[SC_WIDTH * 1+:SC_WIDTH];
                    posy = input_data[SC_WIDTH * 0+:SC_WIDTH];
                    posx_extended = posx;
                    posy_extended = posy;
                
                    if (sstream_i[`STREAM_SI_VALID(SC_WIDTH * 2)]) begin
                        state <= STATE_RUN1;

                        last <= sstream_i[`STREAM_SI_LAST(SC_WIDTH * 2)];
                    end

                    s1a <= posx_extended << `DECIMAL_POS;
                    s1b <= v2x;

                    temp1 <= posy_extended << `DECIMAL_POS;
                end

                STATE_RUN1: begin
                    state <= STATE_RUN2;

                    temp1 <= s1y;

                    s1a <= temp1;
                    s1b <= v2y;

                    m1a <= y1my2;
                    m1b <= s1y;
                end

                STATE_RUN2: begin
                    state <= STATE_RUN3;

                    a1a <= m1y;

                    m1a <= x2mx1;
                    m1b <= s1y;
                end

                STATE_RUN3: begin
                    state <= STATE_RUN4;

                    a1b <= m1y;

                    m1a <= y2my0;
                    m1b <= temp1;
                end

                STATE_RUN4: begin
                    state <= STATE_RUN5;

                    a1a <= m1y;

                    m1a <= a1y;
                    m1b <= inv_det_t;
                end

                STATE_RUN5: begin
                    state <= STATE_RUN6;
                    
                    l0 <= m1y;

                    m1a <= x0mx2;
                    m1b <= s1y;
                end

                STATE_RUN6: begin
                    state <= STATE_RUN7;

                    s1a <= 1 << `DECIMAL_POS;
                    s1b <= l0;

                    a1b <= m1y;
                end

                STATE_RUN7: begin
                    state <= STATE_RUN8;

                    m1a <= a1y;
                    m1b <= inv_det_t;
                end

                STATE_RUN8: begin
                    state <= STATE_RUN9;

                    l1 <= m1y;

                    s1a <= s1y;
                    s1b <= m1y;
                end

                STATE_RUN9: begin
                    state <= STATE_COMPLETE;

                    mstream_o[`STREAM_MO_VALID(SC_WIDTH * 2 + WORD_WIDTH * 3)] <= 1;

                    mstream_o[`STREAM_MO_DATA(SC_WIDTH * 2 + WORD_WIDTH * 3)] <= { posx, posy, l0, l1, s1y };

                    l2 <= s1y;
                end

                STATE_COMPLETE: begin
                    if (mstream_i[`STREAM_MI_READY(SC_WIDTH * 2 + WORD_WIDTH * 3)]) begin
                        if (last) state <= STATE_DONE;
                        else state <= STATE_AWAIT_POS;

                        mstream_o[`STREAM_MO_VALID(SC_WIDTH * 2 + WORD_WIDTH * 3)] <= 0;
                    end
                end

                STATE_DONE: begin
                    if (!run_i) state <= STATE_READY;
                end

            endcase
        end
    end

    assign sstream_o[`STREAM_SO_READY(SC_WIDTH * 2)] = state == STATE_AWAIT_POS;

endmodule