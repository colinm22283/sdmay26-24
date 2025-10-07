module rasterizer_tb();

    integer current_cycle;
    initial current_cycle = 0;

    reg clk;
    reg nrst;

    initial forever begin
        clk <= 1;
        #10;
        clk <= 0;
        #10;

        current_cycle = current_cycle + 1;
    end

    wire [`BUS_MIPORT] mportai;
    wire [`BUS_MOPORT] mportao;
    wire [`BUS_MIPORT] mportbi;
    wire [`BUS_MOPORT] mportbo;

    wire [`BUS_SIPORT] sportai;
    wire [`BUS_SOPORT] sportao;

    word_stripe_cache_m #(50, 8) cache(
        .clk_i(clk),
        .nrst_i(nrst),

        .cached_mport_i(mportao),
        .cached_mport_o(mportai),

        .mport_i(mportbi),
        .mport_o(mportbo)
    );

    busarb_m #(1, 1, 1) arbiter(
        .clk_i(clk),
        .nrst_i(nrst),

        .mports_i({ mportbo }),
        .mports_o({ mportbi }),

        .sports_i({ sportao }),
        .sports_o({ sportai })
    );
    
    wire spi_clk;
    wire spi_cs;
    wire [3:0] spi_mosi;
    wire [3:0] spi_miso;
    wire spi_dqsmi;
    wire spi_dqsmo;

    spi_mem_m #(0, 500000) spi_mem(
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

    spi_chip_m #(7, 3, 500000) spi_chip(
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
    reg [7:0] color;

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

        .color_i(color),

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
        integer x, y;

		$dumpfile("rasterizer.vcd");
		$dumpvars(0, rasterizer_tb);

        run = 0;

        nrst = 0;
        #30;
        nrst = 1;
        #30;

        for (x = 0; x < 320; x = x + 1) begin
            for (y = 0; y < 240; y = y + 1) begin : DB_FILL
                reg [31:0] value;
                value = 32'hFFFFFFFF;

                // if (x % 5 == 4 || y % 5 == 4) begin
                //     value = 32'h80000000;
                // end

                spi_chip.mem[`ADDR_DEPTH_BUFFER + (y * 320 + x) * 4 + 0] = value[7:0];
                spi_chip.mem[`ADDR_DEPTH_BUFFER + (y * 320 + x) * 4 + 1] = value[15:8];
                spi_chip.mem[`ADDR_DEPTH_BUFFER + (y * 320 + x) * 4 + 2] = value[23:16];
                spi_chip.mem[`ADDR_DEPTH_BUFFER + (y * 320 + x) * 4 + 3] = value[31:24];
            end
        end

        for (x = 0; x < 320; x = x + 1) begin
            for (y = 0; y < 240; y = y + 1) begin
                if (x % 5 == 4 && y % 5 == 4) begin
                    spi_chip.mem[y * 320 + x] = 8'b00000010;
                end
                else if (y % 5 == 4 || x % 5 == 4) begin
                    spi_chip.mem[y * 320 + x] = 8'b00000001;
                end
                else begin : EMPTY_FILL
                    reg [2:0] r;
                    reg [2:0] g;
                    reg [1:0] b;

                    r = x * 7 / 320;
                    g = y * 7 / 320;
                    b = 0;

                    spi_chip.mem[y * 320 + x] = { b, g, r };
                end
            end
        end

        run = 0;

        color <= 8'b00000111;

        v0x = 20 << `DECIMAL_POS;
        v0y = 20 << `DECIMAL_POS;
        v0z = 3 * 64'h80000000 / 3;
        t0x = 0;
        t0y = 0;

        v1x = 140 << `DECIMAL_POS;
        v1y = 50 << `DECIMAL_POS;
        v1z = 1 * 64'h80000000 / 3;
        t1x = 10;
        t1y = 0;

        v2x = 50 << `DECIMAL_POS;
        v2y = 140 << `DECIMAL_POS;
        v2z = 1 * 64'h80000000 / 3;
        t2x = 0;
        t2y = 10;

        wait(!clk);
        run = 1;

        wait(busy);
        wait(!busy);
        run = 0;

        for (i = 0; i < 10; i = i + 1) begin
            wait(clk);
            wait(!clk);
        end

        // `VGA_WRITE("depth1.bmp", spi_chip.mem, `ADDR_DEPTH_BUFFER, 320, 240, `COLOR_TYPE_GSW);

        color <= 8'b00111000;

        v0x = 10 << `DECIMAL_POS;
        v0y = 50 << `DECIMAL_POS;
        v0z = 1 * 64'h80000000 / 3;
        t0x = 0;
        t0y = 0;

        v1x = 50 << `DECIMAL_POS;
        v1y = 10 << `DECIMAL_POS;
        v1z = 1 * 64'h80000000 / 3;
        t1x = 10;
        t1y = 0;

        v2x = 140 << `DECIMAL_POS;
        v2y = 140 << `DECIMAL_POS;
        v2z = 3 * 64'h80000000 / 3;
        t2x = 0;
        t2y = 10;

        wait(!clk);
        run = 1;

        wait(busy);
        wait(!busy);
        run = 0;

        for (i = 0; i < 10; i = i + 1) begin
            wait(clk);
            wait(!clk);
        end

        for (i = 0; i < 200; i = i + 1) begin
            color <= 8'b11000000;

            v0x = ((i % 20) * 15) << `DECIMAL_POS;
            v0y = (70 + (i / 20) * 15) << `DECIMAL_POS;
            v0z = 0;
            t0x = 0;
            t0y = 0;

            v1x = (10 + (i % 20) * 15) << `DECIMAL_POS;
            v1y = (70 + (i / 20) * 15) << `DECIMAL_POS;
            v1z = 0;
            t1x = 10;
            t1y = 0;

            v2x = ((i % 20) * 15) << `DECIMAL_POS;
            v2y = (80 + (i / 20) * 15) << `DECIMAL_POS;
            v2z = 0;
            t2x = 0;
            t2y = 10;

            wait(!clk);
            run = 1;

            wait(busy);
            wait(!busy);
            run = 0;

            for (j = 0; j < 10; j = j + 1) begin
                wait(clk);
                wait(!clk);
            end
        end

        for (i = 0; i < 200; i = i + 1) begin
            color <= 8'b00111000;

            v0x = (5 + (i % 20) * 15) << `DECIMAL_POS;
            v0y = (70 + (i / 20) * 15) << `DECIMAL_POS;
            v0z = 32'h40000000;
            t0x = 0;
            t0y = 0;

            v1x = (5 + 10 + (i % 20) * 15) << `DECIMAL_POS;
            v1y = (70 + (i / 20) * 15) << `DECIMAL_POS;
            v1z = 32'h40000000;
            t1x = 10;
            t1y = 0;

            v2x = (5 + (i % 20) * 15) << `DECIMAL_POS;
            v2y = (80 + (i / 20) * 15) << `DECIMAL_POS;
            v2z = 32'h40000000;
            t2x = 0;
            t2y = 10;

            wait(!clk);
            run = 1;

            wait(busy);
            wait(!busy);
            run = 0;

            for (j = 0; j < 10; j = j + 1) begin
                wait(clk);
                wait(!clk);
            end
        end

        for (i = 0; i < 200; i = i + 1) begin
            color <= 8'b00000111;

            v0x = (10 + (i % 20) * 15) << `DECIMAL_POS;
            v0y = (70 + (i / 20) * 15) << `DECIMAL_POS;
            v0z = 32'h80000000;
            t0x = 0;
            t0y = 0;

            v1x = (10 + 10 + (i % 20) * 15) << `DECIMAL_POS;
            v1y = (70 + (i / 20) * 15) << `DECIMAL_POS;
            v1z = 32'h80000000;
            t1x = 10;
            t1y = 0;

            v2x = (10 + (i % 20) * 15) << `DECIMAL_POS;
            v2y = (80 + (i / 20) * 15) << `DECIMAL_POS;
            v2z = 32'h80000000;
            t2x = 0;
            t2y = 10;

            wait(!clk);
            run = 1;

            wait(busy);
            wait(!busy);
            run = 0;

            for (j = 0; j < 10; j = j + 1) begin
                wait(clk);
                wait(!clk);
            end
        end

        $display("Elapsed %d clock cycles", current_cycle);

        $display("Dumping image...");

        `VGA_WRITE("output.bmp", spi_chip.mem, 0, 320, 240, `COLOR_TYPE_RGB332);

        // `VGA_WRITE("depth2.bmp", spi_chip.mem, `ADDR_DEPTH_BUFFER, 320, 240, `COLOR_TYPE_GSW);

        $finish;
    end

    initial begin
        #1000000000;
        $finish;
    end

endmodule
