`include "virtual_vga.v"
`include "spi_chip.v"

module rasterizer_tb();

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
    
    wire spi_clk;
    wire spi_cs;
    wire [3:0] spi_mosi;
    wire [3:0] spi_miso;
    wire spi_dqsmi;
    wire spi_dqsmo;

    spi_mem_m #(0, 1024) spi_mem(
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

    spi_chip_m spi_chip(
        .clk_i(spi_clk),
        .cs_i(spi_cs),
        .mosi_i(spi_mosi),
        .miso_o(spi_miso),
        .dqsm_o(spi_dqsmi),
        .dqsm_i(spi_dqsmo)
    );

    reg  run;
    wire busy;
    wire output_ready;

    reg [31:0] t0x;
    reg [31:0] t0y;
    reg [31:0] t1x;
    reg [31:0] t1y;
    reg [31:0] t2x;
    reg [31:0] t2y;

    reg [31:0] v0x;
    reg [31:0] v0y;
    reg [31:0] v0z;
    reg [31:0] v1x;
    reg [31:0] v1y;
    reg [31:0] v1z;
    reg [31:0] v2x;
    reg [31:0] v2y;
    reg [31:0] v2z;

    rasterizer_m rasterizer(
        .clk_i(clk),
        .nrst_i(nrst),

        .mport_i({ mportai }),
        .mport_o({ mportao }),

        .run_i(run),
        .busy_o(busy),
        .output_ready_o(output_ready),

        .t0x(t0x),
        .t0y(t0y),
        .t1x(t1x),
        .t1y(t1y),
        .t2x(t2x),
        .t2y(t2y),

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

    initial begin : MAIN
        integer i, j;

		$dumpfile("rasterizer.vcd");
		$dumpvars(0, rasterizer_tb);

        run = 0;

        nrst = 0;
        #30;
        nrst = 1;
        #30;

        for (i = 0; i < 320 * 240; i = i + 1) begin
            spi_chip.mem[i] = 0;
        end

        run = 0;

        v0x = 5 << `DECIMAL_POS;
        v0y = 5 << `DECIMAL_POS;
        v0z = 0;
        t0x = 0;
        t0y = 0;

        v1x = 10 << `DECIMAL_POS;
        v1y = 5 << `DECIMAL_POS;
        v1z = 0;
        t1x = 10;
        t1y = 0;

        v2x = 5 << `DECIMAL_POS;
        v2y = 10 << `DECIMAL_POS;
        v2z = 0;
        t2x = 0;
        t2y = 10;

        wait(!clk);
        run = 1;
        wait(clk);
        wait(!clk);

        wait(busy);
        wait(!busy);

        `VGA_WRITE("output.bmp", spi_chip.mem, 0, 320, 240, `COLOR_TYPE_RGB332);

        $finish;
    end

    initial begin
        #1000000;
        $finish;
    end

endmodule
