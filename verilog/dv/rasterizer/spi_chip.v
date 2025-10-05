module spi_chip_m #(
    parameter LATENCY_COUNT = 7,
    parameter PRE_CYCLES = 3,
    parameter SIZE = 1024
) (
    input  wire       clk_i,
    
    input  wire       cs_i,
    input  wire [3:0] mosi_i,
    output reg  [3:0] miso_o,
    output reg        dqsm_o,
    input  wire       dqsm_i
);

    localparam CMD_READ  = 8'h0A;
    localparam CMD_WRITE = 8'h02;

    reg [7:0] mem [SIZE - 1:0];

    initial begin : MEM_INIT
        integer i;

        for (i = 0; i < SIZE; i = i + 1) mem[i] = i;
    end

    reg [7:0] command;

    reg [31:0] full_address;
    wire [25:0] address;
    assign address = {
        full_address[26:17],
        full_address[15:3]
    };

    initial begin
        #10;

        forever begin : MAIN
            integer i;
            integer clock_per, half_clk, quarter_clk;

            i = $random;
            i = $random;
            i = $random;
            i = $random;
            i = $random;

            miso_o = 0;
            dqsm_o = 0;

            wait(!cs_i);

            wait(clk_i);
            command[3:0] = mosi_i;
            wait(!clk_i);

            wait(clk_i);
            command[7:4] = mosi_i;
            wait(!clk_i);

            $display("Got command 0x%h", command);

            for (i = 0; i < 4; i = i + 1) begin
                wait(clk_i);
                full_address[i * 8 +: 4] = mosi_i;
                wait(!clk_i);
                full_address[i * 8 + 4 +: 4] = mosi_i;
            end

            $display("Got address 0x%h", address);

            begin : LATENCY
                integer latency;

                latency = LATENCY_COUNT - 3;

                clock_per = $time;
                wait(clk_i);
                wait(!clk_i);
                clock_per = $time - clock_per;
                half_clk = clock_per / 2;
                quarter_clk = half_clk / 2;

                while (latency != 0) begin
                    for (i = 0; i < latency; i = i + 1) begin
                        wait(!clk_i);
                        wait(clk_i);
                    end

                    if (command == CMD_READ) begin
                        if ({$random} % 2 == 0) begin
                            latency = 0;
                        end
                        else begin
                            $display("Refresh collision!");
                            latency = LATENCY_COUNT;
                        end
                    end
                    else begin
                        latency = 0;
                    end
                end
            end

            if (command == CMD_READ) begin : READ
                integer addr;

                begin : OFFSET_DELAY
                    integer delay;
                    delay = {$random} % 6 + 1;

                    $display("Offset delay: %d ns", delay);

                    #delay;
                end

                for (i = 0; i < PRE_CYCLES; i = i + 1) begin
                    dqsm_o = 1;
                    #half_clk;
                    dqsm_o = 0;
                    #half_clk;
                end

                addr = address;

                dqsm_o = 1;
                #quarter_clk;

                miso_o = mem[addr][7:4];

                #quarter_clk;

                while (!cs_i) begin

                    dqsm_o = 0;
                    #quarter_clk;

                    miso_o = mem[addr][3:0];
                    
                    #quarter_clk;
                    dqsm_o = 1;
                    #quarter_clk;

                    addr = addr + 1;

                    miso_o = mem[addr][7:4];
                    #quarter_clk;
                end
            end
            else if (command == CMD_WRITE) begin : WRITE
                integer addr;
                reg [7:0] write_data;

                addr = address;

                while (!cs_i) begin
                    wait(clk_i || cs_i);

                    if (!cs_i) begin
                        if (!dqsm_i) begin
                            mem[addr][3:0] = mosi_i;
                            write_data[3:0] = mosi_i;
                        end

                        wait(!clk_i);
                        if (!dqsm_i) begin
                            mem[addr][7:4] = mosi_i;
                            write_data[7:4] = mosi_i;
                        end

                        $display("Write 0x%h to 0x%h", write_data, addr);

                        addr = addr + 1;
                    end
                end
            end
        end
    end

endmodule
