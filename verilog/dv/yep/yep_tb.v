module yep_tb();

    wire clk, nrst;

    clk_rst_m clk_rst(
        .clk_o(clk),
        .nrst_o(nrst)
    );

    wire [`BUS_MIPORT] mportai;
    wire [`BUS_MOPORT] mportao;

    wire [`BUS_MIPORT] mportbi;
    reg  [`BUS_MOPORT] mportbo;

    wire [`BUS_SIPORT] sportai;
    wire [`BUS_SOPORT] sportao;

    busarb_m #(2, 1, 1) arbiter(
        .clk_i(clk),
        .nrst_i(nrst),

        .mports_i({ mportbo, mportao }),
        .mports_o({ mportbi, mportai }),

        .sports_i({ sportao }),
        .sports_o({ sportai })
    );

    wire spi_clk;
    wire spi_cs;
    wire [3:0] spi_mosi;
    wire [3:0] spi_miso;
    wire spi_dqsmi;
    wire spi_dqsmo;
    wire [3:0] spi_sio_en;
    wire spi_dqsm_en;

    spi_mem_m #(0, 1000000) spi_mem(
        .clk_i(clk),
        .nrst_i(nrst),

        .sport_i({ sportai }),
        .sport_o({ sportao }),

        .spi_clk_o(spi_clk),
        .spi_cs_o(spi_cs),
        .spi_mosi_o(spi_mosi),
        .spi_miso_i(spi_miso),
        .spi_dqsm_i(spi_dqsmi),
        .spi_dqsm_o(spi_dqsmo),

        .spi_sio_en_o(spi_sio_en),
        .spi_dqsm_en_o(spi_dqsm_en)
    );

    spi_chip_m #(7, 1, 500000) spi_chip(
        .clk_i(spi_clk),
        .cs_i(spi_cs),
        .mosi_i(spi_mosi),
        .miso_o(spi_miso),
        .dqsm_o(spi_dqsmi),
        .dqsm_i(spi_dqsmo)
    );

    wire [2:0] red;
    wire [2:0] green;
    wire [1:0] blue;
    wire hsync;
    wire vsync;

    reg enable;

    vga_m #(0, 0) my_vga (
        .clk_i(clk),
        .nrst_i(nrst),
        .enable_i(enable),
        .prescaler_i(4'b0001),
        .resolution_i(`VGA_RES_320x240),
        .base_h_active_i(`VGA_BASE_H_ACTIVE),
        .base_h_fporch_i(`VGA_BASE_H_FPORCH),
        .base_h_sync_i(`VGA_BASE_H_SYNC),
        .base_h_bporch_i(`VGA_BASE_H_BPORCH),
        .base_v_active_i(`VGA_BASE_V_ACTIVE),
        .base_v_fporch_i(`VGA_BASE_V_FPORCH),
        .base_v_sync_i(`VGA_BASE_V_SYNC),
        .base_v_bporch_i(`VGA_BASE_V_BPORCH),
        .mport_i(mportai),
        .mport_o(mportao),
        .fb_i(0),
        .pixel_o({ red, green, blue }), // Remap standard 8 bit color to the correct IO
        .hsync_o(hsync),
        .vsync_o(vsync)
    );

    reg [7:0] state;

    reg [31:0] addr;

    reg [31:0] timer;

    always @(posedge clk, negedge nrst) begin
        if (!nrst) begin
            state <= 100;

            mportbo <= 0;

            addr  <= 0;

            enable <= 0;
        end
        else if (clk) begin
            case (state)
                100: begin
                    state <= 2;

                    timer <= 0;
                end

                0: begin
                    if (mportbi[`BUS_MI_ACK]) state <= 1;

                    mportbo[`BUS_MO_ADDR] <= addr;
                    mportbo[`BUS_MO_DATA] <= 8'b11100000;
                    mportbo[`BUS_MO_SIZE] <= `BUS_SIZE_BYTE;
                    mportbo[`BUS_MO_RW]   <= `BUS_WRITE;
                    mportbo[`BUS_MO_REQ]  <= 1;
                end

                1: begin
                    if (!mportbi[`BUS_MI_ACK]) begin
                        state <= 2;

                        mportbo[`BUS_MO_REQ]  <= 0;

                        if (addr == 320 * 50) addr <= 0;
                        else addr <= addr + 1;

                        timer <= 0;
                    end
                end

                2: begin
                    if (timer == 500) begin
                        state <= 0;
                        
                        enable <= 1;
                    end

                    timer <= timer + 1;
                end
            endcase
        end
    end

    initial begin
		$dumpfile("yep.vcd");
		$dumpvars(0, yep_tb);

        #20000000;
        $finish;
    end

endmodule
