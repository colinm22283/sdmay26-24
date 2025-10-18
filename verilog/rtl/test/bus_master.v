/*
    Simulated memory block acting as a PKBus master.

    Will read or write the contents of its memory block to a PKBus
    slave in transactions of [size_i].
*/
module bus_slave #(
    parameter SIZE = 1024
) (
    input wire clk_i;
    input wire nrst_i;

    input  wire [`BUS_MIPORT] mport_i,
    output reg  [`BUS_MOPORT] mport_o

    input wire [`BUS_ADDR_PORT] slave_addr_i;
    input wire rw_i; // BUS_READ or BUS_WRITE
    input [1:0] wire rw_size_i; // BUS_SIZE*

    output reg done_o;
);

    localparam STATE_READY = 4'd0;
    localparam STATE_READ = 4'd2;
    localparam STATE_READ_WAIT = 4'd3;
    localparam STATE_WRITE = 4'd4;
    localparam STATE_WRITE_WAIT = 4'd5;
    localparam STATE_DONE = 4'd6;
    reg [3:0] state;

    reg [`BUS_ADDR_PORT] stream_counter;

    // 32-bit wire lets us slice up the incoming data neatly
    wire [`BUS_DATA_SIZE-1:0] in_data;
    assign in_data = mport_i[`BUS_MI_DATA];

    reg [31:0] mem_idx;
    reg [7:0] mem[SIZE-1:0];

    integer i;

    always @ (posedge clk_i or negedge nrst_i) begin
        if (!nrst_i) begin
            for(i = 0; i < SIZE; i++)
                mem[i] <= 0;
            mport_o <= 0;
            mem_idx <= 0;
            state <= STATE_READY;
            done_o <= 0;
        end
        else if (clk_i) begin
            case (state)
                STATE_READY: begin
                    mport_o[`BUS_MO_ADDR] <= slave_addr_i + mem_idx;
                    mport_o[`BUS_MO_SIZE] <= size_i;
                    mport_o[`BUS_MO_RW] <= rw_i;
                    if (mem_idx >= SIZE)
                        done_o = 1;
                    else if (rw_i == `BUS_READ) begin
                        mport_o[`BUS_MO_REQ] <= 1;
                        state <= STATE_READ;
                    end
                    else if (rw_i == `BUS_WRITE) begin
                        state <= STATE_WRITE;
                        case (size_i)
                        `BUS_SIZE_BYTE: begin
                            mport_o[`BUS_MO_DATA] <= {24'b0, mem[mem_idx]};
                            mem_idx <= mem_idx + 1;
                        end
                        `BUS_SIZE_WORD, `BUS_SIZE_TWORD, `BUS_SIZE_STREAM: begin
                            mport_o[`BUS_MO_DATA] <= {
                                mem[mem_idx + 3],
                                mem[mem_idx + 2],
                                mem[mem_idx + 1],
                                mem[mem_idx + 0]
                            };
                            mem_idx <= mem_idx + 4;
                        end
                        endcase
                    end
                end
                STATE_READ: begin
                    // No address checking is done, so hopefully you put them in correctly
                    case (mport_o[`BUS_SI_SIZE])
                    `BUS_SIZE_BYTE: begin
                        if (mport_i[`BUS_MI_ACK]) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            mem[mem_idx] <= in_data[7:0]
                            mem_idx <= mem_idx + 1;
                            state <= STATE_READY;
                        end
                    end
                    `BUS_SIZE_WORD: begin
                        if (mport_i[`BUS_MI_ACK]) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            mem[mem_idx + 3] <= in_data[31:24];
                            mem[mem_idx + 2] <= in_data[23:16];
                            mem[mem_idx + 1] <= in_data[15:8];
                            mem[mem_idx + 0] <= in_data[7:0];
                            mem_idx <= mem_idx + 4;
                            state <= STATE_READY;
                        end
                    end
                    `BUS_SIZE_TWORD: begin
                        if (mport_i[`BUS_MI_SEQSLV]) begin
                            mem[mem_idx + 3] <= in_data[31:24];
                            mem[mem_idx + 2] <= in_data[23:16];
                            mem[mem_idx + 1] <= in_data[15:8];
                            mem[mem_idx + 0] <= in_data[7:0];
                            mem_idx <= mem_idx + 4;
                            stream_counter <= stream_counter + 1;
                        end
                        if (stream_counter >= 2) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            stream_counter <= 0;
                            state <= STATE_READY;
                        end
                    end
                    `BUS_SIZE_STREAM: begin
                        if (mport_i[`BUS_MI_SEQSLV]) begin
                            mem[mem_idx + 3] <= in_data[31:24];
                            mem[mem_idx + 2] <= in_data[23:16];
                            mem[mem_idx + 1] <= in_data[15:8];
                            mem[mem_idx + 0] <= in_data[7:0];
                            mem_idx <= mem_idx + 4;
                        end
                        if (mem_idx >= SIZE) begin // Stream the whole memory block
                            mport_o[`BUS_MO_REQ] <= 0;
                            state <= STATE_READY;
                        end
                    end
                    endcase
                end
                STATE_WRITE: begin
                    // Invalid addresses aren't allowed on PKBus, so no address checking is done
                    case (mport_o[`BUS_SI_SIZE])
                    `BUS_SIZE_BYTE, `BUS_SIZE_WORD: begin
                        if (mport_i[`BUS_MI_ACK]) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            state <= STATE_READY;
                        end
                    end
                    `BUS_SIZE_TWORD: begin
                        if (mport_i[`BUS_MI_SEQSLV]) begin // Slave is ready to get data
                            mport_o[`BUS_MO_DATA] <= {
                                mem[mem_idx + 3],
                                mem[mem_idx + 2],
                                mem[mem_idx + 1],
                                mem[mem_idx + 0]
                            };
                            mem_idx <= mem_idx + 4;
                        end
                        if (stream_counter >= 2) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            stream_counter <= 0;
                            state <= STATE_READY;
                        end
                    end
                    `BUS_SIZE_STREAM: begin
                        if (mport_i[`BUS_MI_SEQSLV]) begin
                            mport_o[`BUS_MO_DATA] <= {
                                mem[mem_idx + 3],
                                mem[mem_idx + 2],
                                mem[mem_idx + 1],
                                mem[mem_idx + 0]
                            };
                            mem_idx <= mem_idx + 4;
                        end
                        if (mem_idx >= SIZE) begin // Stream the whole memory block
                            mport_o[`BUS_MO_REQ] <= 0;
                            state <= STATE_READY;
                        end
                    end
                    endcase
                end
            endcase
        end
    end

endmodule