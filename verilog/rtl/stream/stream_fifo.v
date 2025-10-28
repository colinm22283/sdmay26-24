module stream_fifo_m #(
    parameter SIZE = 1,
    parameter DEPTH = 10
) (
    input wire clk_i,
    input wire nrst_i,

    input  wire [`STREAM_SIPORT(SIZE)] sstream_i,
    output wire [`STREAM_SOPORT(SIZE)] sstream_o,

    input  wire [`STREAM_MIPORT(SIZE)] mstream_i,
    output wire [`STREAM_MOPORT(SIZE)] mstream_o
);

    localparam DEPTH_LOG = $clog2(DEPTH);

    reg [DEPTH_LOG - 1:0] head, size;
    reg [SIZE - 1:0] buffer[DEPTH - 1:0];

    assign sstream_o[`STREAM_SO_READY(SIZE)] = size != DEPTH;

    assign mstream_o[`STREAM_MO_VALID(SIZE)] = size != 0;
    assign mstream_o[`STREAM_MO_LAST(SIZE)] = 0;
    assign mstream_o[`STREAM_MO_DATA(SIZE)] = buffer[head];

    always @(posedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            head <= 0;
            size <= 0;
        end
        else if (clk_i) begin
            if (sstream_i[`STREAM_SI_VALID(SIZE)] && size != DEPTH) begin
                buffer[(head + size) % DEPTH] <= sstream_i[`STREAM_SI_DATA(SIZE)];

                size <= size + 1;
            end

            if (mstream_i[`STREAM_MI_READY(SIZE)] && size != 0) begin
                head <= (head + 1) % DEPTH;
                size <= size - 1;
            end
        end
    end

endmodule