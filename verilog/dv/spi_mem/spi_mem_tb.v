module spi_mem_tb();

    localparam MEMORY_SIZE = 10000;

    reg clk;
    reg nrst;

    initial forever begin
        clk <= 1;
        #10;
        clk <= 0;
        #10;
    end

    wire [`BUS_MIPORT] mportai;
    wire [`BUS_MOPORT] mportao;

    wire [`BUS_SIPORT] sportai;
    wire [`BUS_SOPORT] sportao;

    busarb_m #(1, 1, 1) arbiter(
        .clk_i(clk),
        .nrst_i(nrst),

        .mports_i({ mportao }),
        .mports_o({ mportai }),

        .sports_i({ sportao }),
        .sports_o({ sportai })
    );

    virtual_master_m master(
        .clk_i(clk),
        .nrst_i(nrst),

        .mport_i(mportai),
        .mport_o(mportao)
    );

    wire spi_clk;
    wire spi_cs;
    wire [3:0] spi_mosi;
    wire [3:0] spi_miso;
    wire spi_dqsmi;
    wire spi_dqsmo;

    reg [7:0] test_mem[MEMORY_SIZE - 1:0];

    spi_mem_m #(0, MEMORY_SIZE) spi_mem(
        .clk_i(clk),
        .nrst_i(nrst),

        .sport_i({ sportai }),
        .sport_o({ sportao }),

        .spi_clk_o(spi_clk),
        .spi_cs_o(spi_cs),
        .spi_mosi_o(spi_mosi),
        .spi_miso_i(spi_miso),
        .spi_dqsm_i(spi_dqsmi),
        .spi_dqsm_o(spi_dqsmo)
    );

    spi_chip_m #(7, 1, MEMORY_SIZE) spi_chip(
        .clk_i(spi_clk),
        .cs_i(spi_cs),
        .mosi_i(spi_mosi),
        .miso_o(spi_miso),
        .dqsm_o(spi_dqsmi),
        .dqsm_i(spi_dqsmo)
    );

    initial begin
		$dumpfile("spi_mem.vcd");
		$dumpvars(0, spi_mem_tb);

        nrst = 0;
        #30;
        nrst = 1;
        #30;

        #100000000;
        $finish;
    end

    initial begin : MAIN_1
        master.WRITE_STREAM(0, 3, 32'hFFFFFFFF);
        master.READ_STREAM(0, 3);

        $finish;
    end

    initial begin
        #1000000;
        $finish;
    end
endmodule
