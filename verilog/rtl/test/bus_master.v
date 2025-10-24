/*
    Simulated memory block acting as a PKBus master.
*/
module bus_master_m #(
    parameter SIZE = 1024
) (
    input wire clk_i,
    input wire nrst_i,

    input wire [`BUS_MIPORT] mport_i,
    output reg  [`BUS_MOPORT] mport_o
);

    localparam STATE_READY = 4'd0;
    localparam STATE_READ = 4'd1;
    localparam STATE_WRITE = 4'd2;
    localparam STATE_WRITE_FLUSH = 4'd3; // Flush out the last data transfer during tword or stream writes
    localparam STATE_DONE = 4'd4;
    reg [3:0] state;

    reg [1:0] stream_counter;

    // 32-bit wire lets us slice up the incoming data neatly
    wire [`BUS_DATA_SIZE-1:0] in_data;
    assign in_data = mport_i[`BUS_MI_DATA];

    reg [31:0] mem_idx;
    reg [7:0] mem[SIZE-1:0];

    integer i;

    always @ (negedge nrst_i) begin
        for(i = 0; i < SIZE; i++)
            mem[i] <= 0;
        mport_o <= 0;
        mem_idx <= 0;
        stream_counter <= 0;
        state <= STATE_READY;
    end

    task READ;
        input [1:0] size;           // BUS_SIZE*
        input integer num_bytes;    // Bytes to read in [size] increments. Data read into mem[]
        input [`BUS_ADDR_PORT] src; // Slave address to read from
        input integer dest;         // Address in mem[] to write to
    begin
        RUN(`BUS_READ, size, num_bytes, dest, src);
    end
    endtask

    task WRITE;
        input [1:0] size;            // BUS_SIZE*
        input integer num_bytes;     // Bytes to write in [size] increments. Data written from mem[]
        input integer src;           // Address in mem[] to read from
        input [`BUS_ADDR_PORT] dest; // Slave address to write to
    begin
        RUN(`BUS_WRITE, size, num_bytes, src, dest);
    end
    endtask

    // Internal, do not use
    task RUN;
        input rw; // BUS_READ, BUS_WRITE
        input [1:0] size; // BUS_SIZE*
        input integer num_bytes;
        input integer master_addr;
        input integer slave_addr;
    begin
        mem_idx = master_addr;

        while (mem_idx < master_addr + num_bytes || state != STATE_DONE) begin
            wait(!clk_i);
            wait(clk_i);
            case (state)
                STATE_READY: begin
                    mport_o[`BUS_MO_ADDR] <= slave_addr + mem_idx - master_addr;
                    mport_o[`BUS_MO_SIZE] <= size;
                    mport_o[`BUS_MO_RW] <= rw;
                    mport_o[`BUS_MO_REQ] <= 1;
                    if (rw == `BUS_READ) begin
                        state <= STATE_READ;
                    end
                    else if (rw == `BUS_WRITE) begin
                        state <= STATE_WRITE;
                        case (size)
                        `BUS_SIZE_BYTE: begin
                            mport_o[`BUS_MO_DATA] <= {24'b0, mem[mem_idx]};
                            mem_idx <= mem_idx + 1;
                        end
                        `BUS_SIZE_WORD: begin
                            mport_o[`BUS_MO_DATA] <= {
                                mem[mem_idx + 3],
                                mem[mem_idx + 2],
                                mem[mem_idx + 1],
                                mem[mem_idx + 0]
                            };
                            mem_idx <= mem_idx + 4;
                        end
                        `BUS_SIZE_TWORD, `BUS_SIZE_STREAM: begin
                            mport_o[`BUS_MO_DATA] <= {
                                mem[mem_idx + 3],
                                mem[mem_idx + 2],
                                mem[mem_idx + 1],
                                mem[mem_idx + 0]
                            };
                        end
                        endcase
                    end
                end
                STATE_READ: begin
                    case (mport_o[`BUS_SI_SIZE])
                    `BUS_SIZE_BYTE: begin
                        if (mport_i[`BUS_MI_ACK]) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            mem[mem_idx] <= in_data[7:0];
                            mem_idx <= mem_idx + 1;
                            state <= STATE_DONE;
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
                            state <= STATE_DONE;
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
                        if (stream_counter > 2) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            stream_counter <= 0;
                            state <= STATE_DONE;
                        end
                    end
                    `BUS_SIZE_STREAM: begin
                        if (mport_i[`BUS_MI_SEQSLV]) begin
                            mem[mem_idx + 3] <= in_data[31:24];
                            mem[mem_idx + 2] <= in_data[23:16];
                            mem[mem_idx + 1] <= in_data[15:8];
                            mem[mem_idx + 0] <= in_data[7:0];
                            mem_idx <= mem_idx + 4;
                            mport_o[`BUS_MO_ADDR] <= slave_addr + mem_idx - master_addr + 4;
                        end
                        if (mem_idx >= SIZE) begin // Stream the whole memory block
                            mport_o[`BUS_MO_REQ] <= 0;
                            state <= STATE_DONE;
                        end
                    end
                    endcase
                end
                STATE_WRITE: begin
                    case (mport_o[`BUS_SI_SIZE])
                    `BUS_SIZE_BYTE, `BUS_SIZE_WORD: begin
                        if (mport_i[`BUS_MI_ACK]) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            state <= STATE_DONE;
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
                            stream_counter <= stream_counter + 1;
                        end
                        if (stream_counter > 2) begin
                            mport_o[`BUS_MO_REQ] <= 0;
                            stream_counter <= 0;
                            state <= STATE_WRITE_FLUSH;
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
                            // Keep the address of mport_o[`BUS_MO_DATA] on the bus, don't increment
                            mport_o[`BUS_MO_ADDR] <= slave_addr + mem_idx - master_addr;
                        end
                        if (mem_idx >= SIZE) begin // Stream the whole memory block
                            mport_o[`BUS_MO_REQ] <= 0;
                            state <= STATE_WRITE_FLUSH;
                        end
                    end
                    endcase
                end
                STATE_WRITE_FLUSH: begin
                    state <= STATE_DONE;
                end
                STATE_DONE: begin
                    // Bus arbiter needs 1 latency cycle between actions
                    state <= STATE_READY;
                end
            endcase
            end
        end
    endtask

endmodule