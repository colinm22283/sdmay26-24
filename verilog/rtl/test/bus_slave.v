/*
    Simulated memory block acting as a PKBus slave.
*/
module bus_slave #(
    parameter ADDRESS = 0,
    parameter SIZE = 1024
) (
    input wire clk_i;
    input wire nrst_i;

    input  wire [`BUS_SIPORT] sport_i,
    output reg  [`BUS_SOPORT] sport_o
);

    localparam STATE_READY = 4'd0;
    localparam STATE_READ = 4'd1;
    localparam STATE_READ_WAIT = 4'd2;
    localparam STATE_WRITE = 4'd3;
    localparam STATE_WRITE_WAIT = 4'd4;
    localparam STATE_DONE = 4'd5;
    reg [3:0] state;

    wire [`BUS_ADDR_PORT] rel_addr;
    assign rel_addr = sport_i[`BUS_SI_ADDR] - ADDRESS;

    reg [`BUS_ADDR_PORT] stream_addr;

    // 32-bit wire lets us slice up the incoming data neatly
    wire [`BUS_DATA_SIZE-1:0] in_data;
    assign in_data = sport_i[`BUS_SI_DATA];

    reg [7:0] mem[SIZE-1:0];

    integer i;

    always @ (posedge clk_i or negedge nrst_i) begin
        if (!nrst_i) begin
            for(i = 0; i < SIZE; i++)
                mem[i] <= 0;
            sport_o <= 0;
            state <= STATE_READY;
            stream_addr <= 0;
        end
        else if (clk_i) begin
            case (state)
                STATE_READY: begin
                    if (sport_i[`BUS_SI_REQ]) begin
                        if (sport_i[`BUS_SI_RW] == `BUS_READ)
                            state <= STATE_READ;
                        else
                            state <= STATE_WRITE;

                        sport_o[`BUS_SO_ACK] <= 1; // "I got a request"

                        if (sport_i[`BUS_SI_SIZE] == `BUS_SIZE_STREAM
                           || sport_i[`BUS_SI_SIZE] == `BUS_SIZE_TWORD)
                            stream_addr <= sport_i[`BUS_SI_ADDR];
                    end
                end
                STATE_READ: begin
                    // Invalid addresses aren't allowed on PKBus, so no address checking is done
                    case (sport_i[`BUS_SI_SIZE])
                    `BUS_SIZE_BYTE: begin
                        sport_o[`BUS_SO_DATA] <= {24'd0, mem[sport_i[`BUS_SI_ADDR]]};
                        sport_o[`BUS_SO_ACK] <= 0; // Data is valid
                        state <= STATE_DONE;
                    end
                    `BUS_SIZE_WORD: begin
                        sport_o[`BUS_SO_DATA] <= {
                            mem[sport_i[`BUS_SI_ADDR] + 3],
                            mem[sport_i[`BUS_SI_ADDR] + 2],
                            mem[sport_i[`BUS_SI_ADDR] + 1],
                            mem[sport_i[`BUS_SI_ADDR] + 0]
                        };
                        sport_o[`BUS_SO_ACK] <= 0; // Data is valid
                        state <= STATE_DONE;
                    end
                    `BUS_SIZE_STREAM, `BUS_SIZE_TWORD: begin
                        sport_o[`BUS_SO_DATA] <= {
                            mem[stream_addr + 3],
                            mem[stream_addr + 2],
                            mem[stream_addr + 1],
                            mem[stream_addr + 0]
                        };
                        sport_o[`BUS_SO_SEQSLV] <= 1; // Data is valid
                        state <= STATE_READ_WAIT;
                    end
                    endcase
                end
                STATE_READ_WAIT: begin
                    sport_o[`BUS_SO_SEQSLV] <= 0;
                    case (sport_i[`BUS_SI_SIZE])
                    `BUS_SIZE_TWORD:
                        if (stream_addr >= sport_i[`BUS_SI_ADDR] + 2)
                            state <= STATE_DONE;
                        else begin
                            state <= STATE_READ; // Simulate 1 cycle of latency between repeat reads
                            stream_addr <= stream_addr + 1;
                        end
                    `BUS_SIZE_STREAM: begin
                        if (!sport_i[`BUS_SI_REQ])
                            state <= STATE_DONE;
                        else begin
                            state <= STATE_READ; // Simulate 1 cycle of latency between repeat reads
                            stream_addr <= stream_addr + 1;
                        end
                    end
                    endcase
                end
                STATE_WRITE: begin
                    // Invalid addresses aren't allowed on PKBus, so no address checking is done
                    case (sport_i[`BUS_SI_SIZE])
                    `BUS_SIZE_BYTE: begin
                        mem[sport_i[`BUS_SI_ADDR]] <= in_data[7:0];
                        sport_o[`BUS_SO_ACK] <= 0; // Operation done
                        state <= STATE_DONE;
                    end
                    `BUS_SIZE_WORD: begin
                        mem[sport_i[`BUS_SI_ADDR] + 3] <= in_data[31:24];
                        mem[sport_i[`BUS_SI_ADDR] + 2] <= in_data[23:16];
                        mem[sport_i[`BUS_SI_ADDR] + 1] <= in_data[15:8];
                        mem[sport_i[`BUS_SI_ADDR] + 0] <= in_data[7:0];
                        sport_o[`BUS_SO_ACK] <= 0; // Operation done
                        state <= STATE_DONE;
                    end
                    `BUS_SIZE_STREAM, `BUS_SIZE_TWORD: begin
                        mem[stream_addr + 3] <= in_data[31:24];
                        mem[stream_addr + 2] <= in_data[23:16];
                        mem[stream_addr + 1] <= in_data[15:8];
                        mem[stream_addr + 0] <= in_data[7:0];
                        sport_o[`BUS_SO_SEQSLV] <= 0; // Data written
                        state <= STATE_READ_WAIT;
                    end
                    endcase
                end
                STATE_WRITE_WAIT: begin
                    sport_o[`BUS_SO_SEQSLV] <= 1; // Allow writes again
                    case (sport_i[`BUS_SI_SIZE])
                    `BUS_SIZE_TWORD:
                        if (stream_addr >= sport_i[`BUS_SI_ADDR] + 2)
                            state <= STATE_DONE;
                        else begin
                            state <= STATE_WRITE; // Simulate 1 cycle of latency between repeat reads
                            stream_addr <= stream_addr + 1;
                        end
                    `BUS_SIZE_STREAM: begin
                        if (!sport_i[`BUS_SI_REQ])
                            state <= STATE_DONE;
                        else begin
                            state <= STATE_WRITE; // Simulate 1 cycle of latency between repeat reads
                            stream_addr <= stream_addr + 1;
                        end
                    end
                    endcase
                end
                STATE_DONE: begin
                    if (!sport_i[`BUS_SI_REQ])
                        state <= STATE_READY;
                    sport_o[`BUS_SO_SEQSLV] <= 0;
                    stream_addr <= 0;
                end
            endcase
        end
    end

endmodule