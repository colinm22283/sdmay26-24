module spi_mem_tb();

    reg clk;
    reg nrst;

    initial forever begin
        clk <= 1;
        #10;
        clk <= 0;
        #10;
    end

    wire [`BUS_MIPORT] mportai;
    reg  [`BUS_MOPORT] mportao;
    wire [`BUS_MIPORT] mportbi;
    reg  [`BUS_MOPORT] mportbo;

    wire [`BUS_SIPORT] sportai;
    wire [`BUS_SOPORT] sportao;

    busarb_m #(2, 1, 1) arbiter(
        .clk_i(clk),
        .nrst_i(nrst),

        .mports_i({ mportao, mportbo }),
        .mports_o({ mportai, mportbi }),

        .sports_i({ sportao }),
        .sports_o({ sportai })
    );

    wire spi_clk;
    wire spi_cs;
    wire [3:0] spi_mosi;
    wire [3:0] spi_miso;
    wire spi_dqsmi;
    wire spi_dqsmo;

    spi_mem_m #(0, 10000000) spi_mem(
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

    initial begin
		$dumpfile("spi_mem.vcd");
		$dumpvars(0, spi_mem_tb);

        mportao = 0;
        mportbo = 0;

        nrst = 0;
        #30;
        nrst = 1;
        #30;

        #50000;
        // $finish;
    end

    initial begin : MAIN_1
        integer i;

        reg [31:0] read_data;

        #100;

        for (i = 0; i < 1021; i = i + 1) begin : LOOP
            reg [31:0] data;
            data = {$random};

            PORTA_WRITE(i, data);
            PORTA_READ(i, read_data);

            if (data != data) begin
                $display("Read error at address 0x%h", i);
                $finish;
            end
        end

        $finish;
    end

    initial begin : MAIN_2
        reg [31:0] read_data;

        #200;

        PORTB_READ(7, read_data);
        PORTB_READ(32 + 7, read_data);
        PORTB_READ(8, read_data);
        PORTB_READ(32 + 8, read_data);
    end

    task PORTA_READ;
        input  [31:0] addr;
        output [31:0] data;
    begin
        mportao[`BUS_MO_ADDR] = addr;
        mportao[`BUS_MO_RW]   = 0;
        mportao[`BUS_MO_SIZE] = `BUS_SIZE_WORD;
        mportao[`BUS_MO_REQ]  = 1;

        wait(mportai[`BUS_MI_ACK]);
        wait(!mportai[`BUS_MI_ACK]);
        $display("A READ 0x%0h: 0x%0h", addr, mportai[`BUS_MI_DATA]);

        wait(clk);
        wait(!clk);
        
        mportao[`BUS_MO_REQ] = 0;

        wait(clk);
        wait(!clk);
    end
    endtask

    task PORTA_WRITE;
        input  [31:0] addr;
        input  [31:0] data;
    begin
        mportao[`BUS_MO_ADDR] = addr;
        mportao[`BUS_MO_DATA] = data;
        mportao[`BUS_MO_RW]   = 1;
        mportao[`BUS_MO_SIZE] = `BUS_SIZE_WORD;
        mportao[`BUS_MO_REQ]  = 1;

        wait(mportai[`BUS_MI_ACK]);
        wait(!mportai[`BUS_MI_ACK]);

        wait(clk);
        wait(!clk);

        mportao[`BUS_MO_REQ] = 0;

        wait(clk);
        wait(!clk);
    end
    endtask

    task PORTB_READ;
        input  [31:0] addr;
        output [31:0] data;
    begin
        mportbo[`BUS_MO_ADDR] = addr;
        mportbo[`BUS_MO_RW]   = 0;
        mportbo[`BUS_MO_SIZE] = `BUS_SIZE_WORD;
        mportbo[`BUS_MO_REQ]  = 1;

        wait(mportbi[`BUS_MI_ACK]);
        wait(!mportbi[`BUS_MI_ACK]);
        $display("B READ 0x%0h: 0x%0h", addr, mportbi[`BUS_MI_DATA]);

        wait(clk);
        wait(!clk);

        mportbo[`BUS_MO_REQ] = 0;

        wait(clk);
        wait(!clk);
    end
    endtask

endmodule
