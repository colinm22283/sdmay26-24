`include "spi_chip.v"

module spi_mem_m #(
    parameter ADDRESS = 0,
    parameter SIZE = 32
) (
    input wire clk_i,
    input wire nrst_i,

    input  wire [`BUS_SIPORT] sport_i,
    output reg  [`BUS_SOPORT] sport_o,

    output reg        spi_clk_o,
    output reg        spi_cs_o,
    output reg  [3:0] spi_mosi_o,
    input  wire [3:0] spi_miso_i,
    input  wire       spi_dqsm_i,
    output wire       spi_dqsm_o
);

    localparam CMD_READ          = 8'h0A;
    localparam CMD_READ_WRAPPED  = 8'h08;
    localparam CMD_WRITE         = 8'h02;
    localparam CMD_WRITE_WRAPPED = 8'h00;

    localparam LATENCY_COUNT     = 7;
    localparam PRE_CYCLES        = 3;

    wire [`BUS_ADDR_PORT] rel_addr;
    assign rel_addr = sport_i[`BUS_SI_ADDR] - ADDRESS;

    wire [25:0] ext_addr;
    assign ext_addr = rel_addr;

    wire [31:0] cmd_addr = {
        5'b0000,
        ext_addr[25:11],
        1'b0,
        ext_addr[10:0],
        3'b000
    };

    localparam STATE_READY       = 4'b0000;
    localparam STATE_SETUP       = 4'b0001;
    localparam STATE_CMD         = 4'b0010;
    localparam STATE_CMD_WAIT    = 4'b0011;
    localparam STATE_ADDR        = 4'b0100;
    localparam STATE_LATENCY     = 4'b0101;
    localparam STATE_PRE_CYCLE   = 4'b0110;
    localparam STATE_READ        = 4'b0111;
    localparam STATE_WRITE       = 4'b1000;
    localparam STATE_WRITE_DELAY = 4'b1001;
    localparam STATE_DONE        = 4'b1010;

    assign spi_dqsm_o = 0;

    reg [31:0] data_buf [3:0];
    wire [32 * 4 - 1:0] data_buf_exp;
    assign data_buf_exp = { data_buf[3], data_buf[2], data_buf[1], data_buf[0] };

    reg [3:0] state;

    reg       clock_enable;
    reg [2:0] current_nibble;

    reg [$clog2(PRE_CYCLES) - 1:0] pre_cycle;
    reg       current_dqsm;

    reg [$clog2(LATENCY_COUNT) - 1:0] latency_count;

    reg [2:0] read_byte;
    reg [2:0] read_word;
    reg       word_ready;

    reg [2:0] write_byte;
    reg [2:0] write_word;

    always @(posedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            sport_o[`BUS_SO_DATA] <= 0;
            sport_o[`BUS_SO_SEQSLV] <= 0;

            state <= STATE_READY;

            clock_enable <= 0;
            current_nibble  <= 0;

            pre_cycle <= 0;
            current_dqsm <= 0;

            latency_count <= 0;

            write_byte <= 0;
            write_word <= 0;
        end
        else if (clk_i) begin : CLOCK
            case (state)
                STATE_READY: begin
                    clock_enable <= 0;
                    current_nibble  <= 0;

                    pre_cycle <= 0;

                    write_byte <= 0;
                    write_word <= 0;

                    if (
                        sport_i[`BUS_SI_REQ] &&
                        rel_addr < SIZE
                    ) begin
                        state <= STATE_SETUP;
                    end
                end

                STATE_SETUP: begin
                    state <= STATE_CMD;
                end

                STATE_CMD: begin : COMMAND
                    reg [7:0] command;

                    state <= STATE_CMD_WAIT;

                    if (sport_i[`BUS_SI_RW] == `BUS_READ) command = CMD_READ;
                    else command = CMD_WRITE;

                    clock_enable <= 1;

                    if (current_nibble[0]) spi_mosi_o <= command[7:4];
                    else spi_mosi_o <= command[3:0];
                end

                STATE_CMD_WAIT: begin
                    if (current_nibble[0]) begin
                        state <= STATE_ADDR;
                        current_nibble[0] <= 0;
                    end
                    else begin
                        state <= STATE_CMD;
                        current_nibble[0] <= 1;
                    end
                end

                STATE_ADDR: begin
                    spi_mosi_o <= cmd_addr[current_nibble * 4 +: 4];

                    if (current_nibble == 7) begin
                        state <= STATE_LATENCY;

                        if (sport_i[`BUS_SI_RW] == `BUS_READ) latency_count <= LATENCY_COUNT - 3;
                        else latency_count <= LATENCY_COUNT - 4;

                        current_nibble <= 0;
                    end
                    else begin
                        state <= STATE_ADDR;
                        current_nibble <= current_nibble + 1;
                    end
                end

                STATE_LATENCY: begin
                    spi_mosi_o <= 0;

                    if (spi_clk_o) begin
                        if (latency_count == 0) begin
                            if (sport_i[`BUS_SI_RW] == `BUS_WRITE) begin
                                state <= STATE_WRITE;
                            end
                            else if (spi_dqsm_i) begin
                                state <= STATE_PRE_CYCLE;

                                current_dqsm <= 1;
                            end
                            else begin
                                latency_count <= LATENCY_COUNT - 1;
                            end
                        end
                        else begin
                            latency_count <= latency_count - 1;
                        end
                    end
                end

                STATE_PRE_CYCLE: begin
                    if (spi_dqsm_i != current_dqsm) begin
                        if (spi_dqsm_i) begin
                            if (pre_cycle == PRE_CYCLES - 1) begin
                                state <= STATE_READ;
                            end

                            pre_cycle <= pre_cycle + 1;
                        end

                        current_dqsm <= spi_dqsm_i;
                    end
                end

                STATE_READ: begin
                    case (sport_i[`BUS_SI_SIZE])
                        `BUS_SIZE_BYTE: begin
                            if (read_byte == 1) begin
                                state <= STATE_DONE;

                                sport_o[`BUS_SO_DATA] <= data_buf[0][7:0];
                            end
                        end
                        
                        `BUS_SIZE_WORD: begin
                            if (word_ready) begin
                                state <= STATE_DONE;

                                sport_o[`BUS_SO_DATA] <= data_buf[0];
                            end
                        end
                    endcase
                end

                STATE_WRITE: begin : WRITE
                    reg [`BUS_DATA_PORT] in_data;

                    in_data = sport_i[`BUS_SI_DATA];

                    case (sport_i[`BUS_SI_SIZE])
                        `BUS_SIZE_BYTE: begin
                            if (current_nibble[0]) begin
                                state <= STATE_DONE;

                                spi_mosi_o <= in_data[3:0];
                            end
                            else begin
                                spi_mosi_o <= in_data[7:4];

                                current_nibble[0] <= 1;
                            end
                        end
                        
                        `BUS_SIZE_WORD: begin
                            if (current_nibble[0]) begin
                                if (write_byte == 3) begin
                                    state <= STATE_WRITE_DELAY;
                                end

                                spi_mosi_o <= in_data[write_byte * 8+:4];

                                write_byte <= write_byte + 1;

                                current_nibble[0] <= 0;
                            end
                            else begin
                                spi_mosi_o <= in_data[write_byte * 8 + 4+:4];

                                current_nibble[0] <= 1;
                            end
                        end
                    endcase
                end

                STATE_WRITE_DELAY: begin
                    state <= STATE_DONE;

                    clock_enable <= 0;
                end
                
                STATE_DONE: begin
                    if (!sport_i[`BUS_SI_REQ]) state <= STATE_READY;

                    clock_enable <= 0;
                end
            endcase
        end
    end

    always @(negedge clk_i, negedge nrst_i) begin
        if (!nrst_i) begin
            spi_clk_o <= 0;
        end
        else if (!clk_i) begin
            if (clock_enable) spi_clk_o <= !spi_clk_o;
            else spi_clk_o <= 0;
        end
    end
    
    always @(*) begin
        case (state)
            STATE_READY, STATE_DONE: begin
                sport_o[`BUS_SO_ACK] <= 0;
                
                spi_cs_o <= 1;
            end

            default: begin
                sport_o[`BUS_SO_ACK] <= 1;
                spi_cs_o <= 0;
            end
        endcase
    end

    always @(negedge spi_dqsm_i) begin
        case (state)
            STATE_READ: begin
                data_buf[read_word][read_byte * 8 + 4 +: 4] <= spi_miso_i;
            end
        endcase
    end

    always @(posedge spi_dqsm_i) begin
        case (state)
            default: begin
                data_buf[0] <= 0;
                data_buf[1] <= 0;
                data_buf[2] <= 0;
                data_buf[3] <= 0;

                read_byte <= 0;
                read_word <= 0;
                word_ready   <= 0;
            end

            STATE_READ: begin
                data_buf[read_word][read_byte * 8 +: 4] <= spi_miso_i;

                if (read_byte == 3) begin
                    read_word <= read_word + 1;
                    read_byte <= 0;
                    word_ready   <= 1;
                end
                else begin
                    read_byte <= read_byte + 1;
                    word_ready   <= 0;
                end
            end
        endcase
    end

endmodule

