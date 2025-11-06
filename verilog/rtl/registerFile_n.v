module registerFile_n #(parameter addrWidth = (5), registersN = (48), baseAdr = 0)(  
    input wire regf_clk_i,                                  //Clock
    input wire regf_we_i,                               //Write Enable
    input wire regf_rst_i,                                  //Reset
    input wire [addrWidth:0] regf_r1_i,                 //reg1 addr
    input wire [addrWidth:0] regf_r2_i,                 //reg2 addr
    input wire [31:0] regf_r1_data_i,                       //In data reg1
    output reg [31:0] regf_r1_o,                           //Output Data reg1
    output reg [31:0] regf_r2_o                            //Output Data reg2s
    );



reg [31: 0] regFile [baseAdr: baseAdr + registersN - 1]; // instantiate N registers size of 32 bits
integer i;

always @(posedge regf_clk_i, posedge regf_rst_i) begin
    
    if(regf_rst_i)
        for(i = baseAdr; i < baseAdr + registersN - 1; i++) //iterate through all defined regs
            regFile[i] <= '0; // set all regs to 0
    else if(regf_we_i) begin
        regFile[regf_r1_i] <= regf_r1_data_i; //write data into reg1
    end
    else begin

    end
end

always @(negedge regf_clk_i) begin
    regf_r1_o <= regFile[regf_r1_i];  //Output Data reg1
    regf_r2_o <= regFile[regf_r2_i];  //Output Data reg1
end 

endmodule
`default_nettype wire
