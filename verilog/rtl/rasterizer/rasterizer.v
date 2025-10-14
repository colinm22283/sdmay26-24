module rasterizer_m #(
    parameter WORD_WIDTH = 32,
    parameter WIDTH = 320,
    parameter HEIGHT = 240
) (
    input wire clk_i,
    input wire nrst_i,

    input  wire [`BUS_MIPORT] mport_i,
    output reg  [`BUS_MOPORT] mport_o,

    input  wire run_i,
    output wire busy_o,
    output wire output_ready_o,

    input wire [7:0] color_i,

    input wire [WORD_WIDTH - 1:0] t0x,
    input wire [WORD_WIDTH - 1:0] t0y,
    input wire [WORD_WIDTH - 1:0] t1x,
    input wire [WORD_WIDTH - 1:0] t1y,
    input wire [WORD_WIDTH - 1:0] t2x,
    input wire [WORD_WIDTH - 1:0] t2y,

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
    assign output_ready_o = 0;

    localparam WORD_SMAX = 64'd1 << (WORD_WIDTH - 2);

    localparam SC_WIDTH = $clog2(WIDTH > HEIGHT ? WIDTH : HEIGHT);

    reg signed [WORD_WIDTH - 1:0] bbx0;
    reg signed [WORD_WIDTH - 1:0] bby0;
    reg signed [WORD_WIDTH - 1:0] bbx1;
    reg signed [WORD_WIDTH - 1:0] bby1;

    always @(*) begin
        bbx0 = WORD_SMAX;
        bby0 = WORD_SMAX;
        bbx1 = 0;
        bby1 = 0;

        if (v0x < bbx0) bbx0 = v0x;
        if (v1x < bbx0) bbx0 = v1x;
        if (v2x < bbx0) bbx0 = v2x;

        if (v0y < bby0) bby0 = v0y;
        if (v1y < bby0) bby0 = v1y;
        if (v2y < bby0) bby0 = v2y;

        if (v0x > bbx1) bbx1 = v0x;
        if (v1x > bbx1) bbx1 = v1x;
        if (v2x > bbx1) bbx1 = v2x;

        if (v0y > bby1) bby1 = v0y;
        if (v1y > bby1) bby1 = v1y;
        if (v2y > bby1) bby1 = v2y;

        bbx0 = bbx0 >> `DECIMAL_POS;
        bby0 = bby0 >> `DECIMAL_POS;
        bbx1 = bbx1 >> `DECIMAL_POS;
        bby1 = bby1 >> `DECIMAL_POS;

        if (bbx0 < 0) bbx0 = 0;
        if (bby0 < 0) bby0 = 0;
        if (bbx1 >= WIDTH) bbx1 = WIDTH - 1;
        if (bby1 >= HEIGHT) bby1 = HEIGHT - 1;
    end

    localparam STATE_READY     = 4'b0000;
    localparam STATE_RUN_BARY  = 4'b0001;
    localparam STATE_WAIT_BARY = 4'b0010;
    localparam STATE_EVAL_BARY = 4'b1011;
    localparam STATE_REQ_CHECK = 4'b0011;
    localparam STATE_ACK_CHECK = 4'b0100;
    localparam STATE_REQ_DEPTH = 4'b0101;
    localparam STATE_ACK_DEPTH = 4'b0110;
    localparam STATE_REQ_DRAW  = 4'b0111;
    localparam STATE_ACK_DRAW  = 4'b1000;
    localparam STATE_NEXT      = 4'b1001;
    localparam STATE_DONE      = 4'b1010;

    reg [3:0] state;

    reg bary_last;

    reg [SC_WIDTH - 1:0] posx;
    reg [SC_WIDTH - 1:0] posy;

    reg  signed [WORD_WIDTH - 1:0] bary_l0;
    reg  signed [WORD_WIDTH - 1:0] bary_l1;
    reg  signed [WORD_WIDTH - 1:0] bary_l2;

    reg [WORD_WIDTH - 1:0] depth;

    wire [`STREAM_MIPORT(SC_WIDTH * 2)] pos_streami;
    wire [`STREAM_MOPORT(SC_WIDTH * 2)] pos_streamo;
    wire [SC_WIDTH * 2 - 1:0] pos_stream_data;

    wire [`STREAM_MIPORT(SC_WIDTH * 2 + WORD_WIDTH * 3)] bary_streami;
    wire [`STREAM_MOPORT(SC_WIDTH * 2 + WORD_WIDTH * 3)] bary_streamo;
    wire [SC_WIDTH * 2 + WORD_WIDTH * 3 - 1:0] bary_stream_data;

    always @(posedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            state <= STATE_READY;

            mport_o <= 0;

            posx <= 0;
            posy <= 0;
        end
        else if (clk_i) begin
            case (state)
                STATE_READY: begin
                    if (run_i) begin
                        state <= STATE_RUN_BARY;

                        // TODO: handle edge cases here
                        posx  <= bbx0;
                        posy  <= bby0;
                    end
                end

                STATE_RUN_BARY: begin
                    if (pos_streami[`STREAM_MI_READY(SC_WIDTH * 2)]) state <= STATE_WAIT_BARY;
                end

                STATE_WAIT_BARY: begin
                    if (bary_streamo[`STREAM_MO_VALID(SC_WIDTH * 2 + WORD_WIDTH * 3)]) begin
                        state <= STATE_EVAL_BARY;

                        { bary_l0, bary_l1, bary_l2 } <= bary_stream_data[WORD_WIDTH * 3 - 1:0];

                        bary_last <= posx == bbx1 && posy == bby1;
                    end
                end

                STATE_EVAL_BARY: begin
                    if (bary_l0 >= 0 && bary_l1 >= 0 && bary_l2 >= 0) begin
                        state <= STATE_REQ_CHECK;
                    end
                    else begin
                        state <= STATE_NEXT;
                    end

                    depth <=
                        (({{32{bary_l0[31]}}, bary_l0} * v0z) >> `DECIMAL_POS) +
                        (({{32{bary_l1[31]}}, bary_l1} * v1z) >> `DECIMAL_POS) +
                        (({{32{bary_l2[31]}}, bary_l2} * v2z) >> `DECIMAL_POS);
                end

                STATE_REQ_CHECK: begin
                    if (mport_i[`BUS_MI_ACK]) begin
                        state <= STATE_ACK_CHECK;

                        $display("(%d, %d): 0x%h", posx, posy, 4 * (posy * WIDTH + posx));
                    end

                    mport_o[`BUS_MO_ADDR] <= `ADDR_DEPTH_BUFFER + 4 * (posy * WIDTH + posx);

                    mport_o[`BUS_MO_RW]   <= `BUS_READ;
                    mport_o[`BUS_MO_SIZE] <= `BUS_SIZE_WORD;

                    mport_o[`BUS_MO_REQ]  <= 1;
                end

                STATE_ACK_CHECK: begin
                    if (!mport_i[`BUS_MI_ACK]) begin
                        $display("0x%h, 0x%h", mport_i[`BUS_MO_DATA], depth);
                        // if (mport_i[`BUS_MO_DATA] != 32'hFFFFFFFF) $finish;
                        if (mport_i[`BUS_MO_DATA] > depth) state <= STATE_REQ_DEPTH;
                        else begin
                            state <= STATE_NEXT;
                        end
                    
                        mport_o[`BUS_MO_REQ]  <= 0;
                    end
                end

                STATE_REQ_DEPTH: begin
                    if (mport_i[`BUS_MI_ACK]) begin
                        state <= STATE_ACK_DEPTH;

                        $display("(%d, %d): 0x%h", posx, posy, 4 * (posy * WIDTH + posx));
                    end

                    mport_o[`BUS_MO_ADDR] <= `ADDR_DEPTH_BUFFER + 4 * (posy * WIDTH + posx);
                    mport_o[`BUS_MO_DATA] <= depth;

                    mport_o[`BUS_MO_RW]   <= `BUS_WRITE;
                    mport_o[`BUS_MO_SIZE] <= `BUS_SIZE_WORD;

                    mport_o[`BUS_MO_REQ]  <= 1;
                end

                STATE_ACK_DEPTH: begin
                    if (!mport_i[`BUS_MI_ACK]) begin
                        state <= STATE_REQ_DRAW;
                    
                        mport_o[`BUS_MO_REQ]  <= 0;
                    end
                end

                STATE_REQ_DRAW: begin
                    if (mport_i[`BUS_MI_ACK]) begin
                        state <= STATE_ACK_DRAW;
                    end

                    mport_o[`BUS_MO_ADDR] <= posy * WIDTH + posx;
                    mport_o[`BUS_MO_DATA] <= color_i;

                    mport_o[`BUS_MO_RW]   <= `BUS_WRITE;
                    mport_o[`BUS_MO_SIZE] <= `BUS_SIZE_BYTE;

                    mport_o[`BUS_MO_REQ]  <= 1;
                end

                STATE_ACK_DRAW: begin
                    if (!mport_i[`BUS_MI_ACK]) begin
                        state <= STATE_NEXT;
                    
                        mport_o[`BUS_MO_REQ]  <= 0;
                    end
                end

                STATE_NEXT: begin
                    state <= STATE_RUN_BARY;

                    if (posx == bbx1) begin
                        posx <= bbx0;
                        posy <= posy + 1;

                        if (posy == bby1) begin
                            state <= STATE_DONE;
                        end
                    end
                    else begin
                        posx <= posx + 1;
                    end
                end

                STATE_DONE: begin
                    if (!run_i) state <= STATE_READY;
                end
            endcase
        end
    end

    assign pos_stream_data = { posx, posy };

    assign pos_streamo[`STREAM_MO_VALID(SC_WIDTH * 2)] = state == STATE_RUN_BARY;
    assign pos_streamo[`STREAM_MO_DATA(SC_WIDTH * 2)] = pos_stream_data;
    assign pos_streamo[`STREAM_MO_LAST(SC_WIDTH * 2)] = bary_last;

    assign bary_streami[`STREAM_MI_READY(SC_WIDTH * 2 + WORD_WIDTH * 3)] = state == STATE_WAIT_BARY;

    assign bary_stream_data = bary_streamo[`STREAM_MO_DATA(SC_WIDTH * 2 + WORD_WIDTH * 3)];

    assign busy_o = state != STATE_READY && state != STATE_DONE;

    bary_pipe_m #(WORD_WIDTH, WIDTH, HEIGHT) bary_pipe (
        .clk_i(clk_i),
        .nrst_i(nrst_i),

        .run_i(run_i),

        .sstream_i(pos_streamo),
        .sstream_o(pos_streami),

        .mstream_i(bary_streami),
        .mstream_o(bary_streamo),

        .v0x(v0x),
        .v0y(v0y),
        .v0z(v0z),
        .v1x(v1x),
        .v1y(v1y),
        .v1z(v1z),
        .v2x(v2x),
        .v2y(v2y),
        .v2z(v2z)
    );

endmodule