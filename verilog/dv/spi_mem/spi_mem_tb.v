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
    reg  [`BUS_MOPORT] mportao;

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

        mportao = 0;

        nrst = 0;
        #30;
        nrst = 1;
        #30;

        #100000000;
        $finish;
    end

    initial begin : MAIN_1
        integer i;

        reg [95:0] read_data;

        #100;

        for (i = 0; i < MEMORY_SIZE; i = i + 1) begin
            test_mem[i] = 0;
            spi_chip.mem[i] = 0;
        end

        $display("Byte write-read test");

        for (i = 0; i < MEMORY_SIZE - 1; i = i + 1) begin : LOOP1
            integer j;

            reg [7:0] data;
            data = {$random};

            test_mem[i] = data;

            $display("Writing 0x%h to address 0x%h", data, i);

            PORTA_WRITE_BYTE(i, data);
            PORTA_READ_BYTE(i, read_data);

            $display("0x%h == 0x%h", data, read_data[7:0]);
            if (data != read_data[7:0]) begin
                $display("Read error at address 0x%h", i);
                $finish;
            end

            for (j = 0; j < MEMORY_SIZE; j = j + 1) begin
                if (test_mem[j] != spi_chip.mem[j]) begin
                    $display("Full test failure at address 0x%h\n", j);
                    $finish;
                end
            end
        end

        // $display("Word write-read test");

        // for (i = 0; i < 1021; i = i + 1) begin : LOOP2
        //     integer j;

        //     reg [31:0] data;
        //     data = {$random};

        //     { test_mem[i + 3], test_mem[i + 2], test_mem[i + 1], test_mem[i + 0] } = data;

        //     $display("Writing 0x%h to address 0x%h", data, i);

        //     PORTA_WRITE_WORD(i, data);
        //     PORTA_READ_WORD(i, read_data);

        //     $display("0x%h == 0x%h", data, read_data[31:0]);
        //     if (data != read_data[31:0]) begin
        //         $display("Read error at address 0x%h", i);
        //         $finish;
        //     end

        //     for (j = 0; j < 1023; j = j + 1) begin
        //         if (test_mem[j] != spi_chip.mem[j]) begin
        //             $display("Full test failure at address 0x%h\n", j);
        //             $finish;
        //         end
        //     end
        // end

        // $display("TWord write-read test");

        // for (i = 0; i < 1013; i = i + 1) begin : LOOP3
        //     integer j;

        //     reg [95:0] data;
        //     data[31:0] = {$random};
        //     data[63:32] = {$random};
        //     data[95:64] = {$random};

        //     {
        //         test_mem[i + 11], test_mem[i + 10], test_mem[i + 9], test_mem[i + 8],
        //         test_mem[i + 7], test_mem[i + 6], test_mem[i + 5], test_mem[i + 4],
        //         test_mem[i + 3], test_mem[i + 2], test_mem[i + 1], test_mem[i + 0]
        //     } = data;

        //     $display("Writing 0x%h to address 0x%h", data, i);

        //     PORTA_WRITE_TWORD(i, data);
        //     PORTA_READ_TWORD(i, read_data);

        //     $display("0x%h == 0x%h", data, read_data);
        //     if (data != read_data) begin
        //         $display("Read error at address 0x%h", i);
        //         $finish;
        //     end

        //     for (j = 0; j < 1023; j = j + 1) begin
        //         if (test_mem[j] != spi_chip.mem[j]) begin
        //             $display("Full test failure at address 0x%h\n", j);
        //             $finish;
        //         end
        //     end
        // end

        $finish;
    end

    task PORTA_READ_BYTE;
        input  [31:0] addr;
        output [7:0] data;
    begin
        mportao[`BUS_MO_ADDR] = addr;
        mportao[`BUS_MO_RW]   = 0;
        mportao[`BUS_MO_SIZE] = `BUS_SIZE_BYTE;
        mportao[`BUS_MO_REQ]  = 1;

        wait(mportai[`BUS_MI_ACK]);
        wait(!mportai[`BUS_MI_ACK]);
        data = mportai[`BUS_MI_DATA];
        $display("A READ 0x%0h: 0x%0h", addr, mportai[`BUS_MI_DATA]);

        wait(clk);
        wait(!clk);
        
        mportao[`BUS_MO_REQ] = 0;

        wait(clk);
        wait(!clk);
    end
    endtask

    task PORTA_WRITE_BYTE;
        input  [31:0] addr;
        input  [7:0] data;
    begin
        mportao[`BUS_MO_ADDR] = addr;
        mportao[`BUS_MO_DATA] = data;
        mportao[`BUS_MO_RW]   = 1;
        mportao[`BUS_MO_SIZE] = `BUS_SIZE_BYTE;
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

    task PORTA_READ_WORD;
        input  [31:0] addr;
        output [31:0] data;
    begin
        mportao[`BUS_MO_ADDR] = addr;
        mportao[`BUS_MO_RW]   = 0;
        mportao[`BUS_MO_SIZE] = `BUS_SIZE_WORD;
        mportao[`BUS_MO_REQ]  = 1;

        wait(mportai[`BUS_MI_ACK]);
        wait(!mportai[`BUS_MI_ACK]);

        data = mportai[`BUS_MI_DATA];
        $display("A READ 0x%0h: 0x%0h", addr, mportai[`BUS_MI_DATA]);

        wait(clk);
        wait(!clk);
        
        mportao[`BUS_MO_REQ] = 0;

        wait(clk);
        wait(!clk);
    end
    endtask

    task PORTA_WRITE_WORD;
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

    task PORTA_READ_TWORD;
        input  [31:0] addr;
        output [95:0] data;

        integer i;
    begin
        mportao[`BUS_MO_ADDR] = addr;
        mportao[`BUS_MO_RW]   = 0;
        mportao[`BUS_MO_SIZE] = `BUS_SIZE_TWORD;
        mportao[`BUS_MO_REQ]  = 1;

        wait(mportai[`BUS_MI_ACK]);

        for (i = 0; i < 3; i = i + 1) begin
            wait(mportai[`BUS_MI_SEQSLV]);
            wait(!mportai[`BUS_MI_SEQSLV]);

            data[i * 32+:32] = mportai[`BUS_MI_DATA];
        end

        wait(!mportai[`BUS_MI_ACK]);

        wait(clk);
        wait(!clk);
        
        mportao[`BUS_MO_REQ] = 0;

        wait(clk);
        wait(!clk);
    end
    endtask

    task PORTA_WRITE_TWORD;
        input  [31:0] addr;
        input  [95:0] data;

        integer i;
    begin
        mportao[`BUS_MO_ADDR] = addr;
        mportao[`BUS_MO_DATA] = data;
        mportao[`BUS_MO_RW]   = 1;
        mportao[`BUS_MO_SIZE] = `BUS_SIZE_TWORD;
        mportao[`BUS_MO_REQ]  = 1;

        mportao[`BUS_MO_DATA] = data[0+:32];

        wait(mportai[`BUS_MI_ACK]);

        for (i = 0; i < 3; i = i + 1) begin
            wait(mportai[`BUS_MI_SEQSLV]);
            if (i != 2) mportao[`BUS_MO_DATA] = data[(i + 1) * 32+:32];
            wait(!mportai[`BUS_MI_SEQSLV]); 
        end

        wait(!mportai[`BUS_MI_ACK]);

        wait(clk);
        wait(!clk);

        mportao[`BUS_MO_REQ] = 0;

        wait(clk);
        wait(!clk);
    end
    endtask

endmodule
