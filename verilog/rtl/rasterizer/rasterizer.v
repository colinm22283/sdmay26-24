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
    output wire busy_0,
    output wire output_ready_0,

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

    localparam WORD_SMAX = 1 << (WORD_WIDTH - 1);

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

        if (bbx0 < 0) bbx0 = 0;
        if (bby0 < 0) bby0 = 0;
        if (bbx1 >= WIDTH) bbx1 = WIDTH - 1;
        if (bby1 >= HEIGHT) bby1 = HEIGHT - 1;
    end

    localparam STATE_READY = 4'b0000;
    localparam STATE_RUN   = 4'b0001;
    localparam STATE_DONE  = 4'b0010;

    reg [3:0] state;

    reg [SC_WIDTH - 1:0] posx;
    reg [SC_WIDTH - 1:0] posy;

    reg running;
    assign busy = !running;

    wire pipeline_ready;

    always @(posedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            state <= STATE_READY;

            posx <= 0;
            posy <= 0;

            running <= 0;
        end
        else if (clk_i) begin
            case (state)
                STATE_READY: begin
                    if (run_i) begin
                        state <= STATE_RUN;

                        // TODO: handle edge cases here
                        posx  <= bbx0;
                        posy  <= bby0;

                        running <= 1;
                    end
                end

                STATE_RUN: begin
                    if (pipeline_ready) begin
                        if (posx == WIDTH - 1) begin
                            posx <= 0;
                            posy <= posy + 1;

                            if (posy == HEIGHT - 1) begin
                                state <= STATE_DONE;
                            end
                        end
                        else begin
                            posx <= posx + 1;
                        end
                    end
                end
            endcase
        end
    end

    bary_pipe_m #(WORD_WIDTH, WIDTH, HEIGHT) bary_pipe (
        .clk_i(clk_i),
        .nrst_i(nrst_i),

        .run_i(run_i),

        .ready_o(pipeline_ready),

        .posx(posx),
        .posy(posy),

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