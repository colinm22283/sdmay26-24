module dff_n #(parameter N = 32)(
    input logic dff_clk_i,                  //Clock
    input logic dff_rst_i,                  //Reset
    input logic dff_we_i,                   //Write Enable
    input logic [ N-1:0] dff_dat_i,          //Input Data 
    output logic [ N-1:0] dff_dat_o          //Output Data 
    );



always @(posedge dff_clk_i, posedge dff_rst_i) begin
    //reset logic, reset occurs only at beggning to flush possible random values
    if(dff_rst_i)
        dff_dat_o <= '0;
    else if(dff_we_i) begin
        dff_dat_o <= dff_dat_i;
    end
    else begin
        dff_dat_o <= dff_dat_o;
    end
end

    
endmodule
`default_nettype wire
