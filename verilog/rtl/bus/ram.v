module ram_m #(
    parameter ADDRESS = 0,
    parameter SIZE = 1
) (
    input wire clk_i,
    input wire nrst_i,

    input  wire [`BUS_SIPORT] sport_i,
    output wire [`BUS_SOPORT] sport_o
);

    wire        req;
    reg         ack;
    wire [1:0]  size;
    wire        rw;
    wire [`BUS_ADDR_PORT] addr;
    wire [`BUS_DATA_PORT] datai;
    reg  [`BUS_DATA_PORT] datao;

    busslave_m #(ADDRESS, SIZE) slave(
        .sport_i(sport_i),
        .sport_o(sport_o),

        .req_o(req),
        .ack_i(ack),

        .size_o(size),
        .rw_o(rw),

        .addr_o(addr),
        .data_i(datao),
        .data_o(datai)
    );

    reg [7:0] mem [SIZE - 1:0];
    initial begin : MEM_INIT
		integer i;

		for (i = 0; i < SIZE; i = i + 1) mem[i] <= i;
    end

    localparam STATE_READY   = 2'b00;
    localparam STATE_RUNNING = 2'b01;
    localparam STATE_WAIT    = 2'b10;
    localparam STATE_DONE    = 2'b11;

    reg [1:0] state;

    reg [5:0] byte_count;

    always @(posedge clk_i, negedge nrst_i) begin
		if (!nrst_i) begin
			datao     <= 0;

			state     <= STATE_READY;

			byte_count <= 0;
		end
		else if (clk_i) begin
			case (state)
				STATE_READY: begin
					if (req) begin
						state     <= STATE_RUNNING;

						case (size)
							2'b00: byte_count <= 1 - 1;
							2'b01: byte_count <= 4 - 1;
							2'b10: byte_count <= 12 - 1;
							2'b11: byte_count <= 8 - 1;
						endcase
					end
				end

				STATE_RUNNING: begin
					if (byte_count == 0) state <= STATE_WAIT;

					if (rw) mem[addr + byte_count] <= datai[byte_count * 8 +: 8];
					else datao[byte_count * 8 +: 8] <= mem[addr + byte_count];

					byte_count <= byte_count - 1;
				end

				STATE_WAIT: begin
					state <= STATE_DONE;
				end

				STATE_DONE: begin
					if (!req) state <= STATE_READY;
				end
			endcase
		end
    end

    always @(*) begin
		case (state)
			default: begin
				ack <= 0;
			end

			STATE_RUNNING, STATE_WAIT: begin
				ack <= 1;
			end
		endcase
    end

endmodule
