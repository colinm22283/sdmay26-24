`define BUS_DATA_SIZE (32)
module single_cycle_mat_mult_tb; 
    reg signed [`BUS_DATA_SIZE-1:0] m00, m01, m02, m03; 
    reg signed [`BUS_DATA_SIZE-1:0] m10, m11, m12, m13; 
    reg signed [`BUS_DATA_SIZE-1:0] m20, m21, m22, m23; 
    reg signed [`BUS_DATA_SIZE-1:0] m30, m31, m32, m33; 
    reg signed [`BUS_DATA_SIZE-1:0] vx, vy, vz, vw; 
    wire signed [`BUS_DATA_SIZE*2-1:0] outx, outy, outz, outw; 

single_cycle_mat_mult #(.BUS_DATA_SIZE(`BUS_DATA_SIZE)) dut ( 
    .m00(m00), .m01(m01), .m02(m02), .m03(m03), 
    .m10(m10), .m11(m11), .m12(m12), .m13(m13), 
    .m20(m20), .m21(m21), .m22(m22), .m23(m23), 
    .m30(m30), .m31(m31), .m32(m32), .m33(m33), 
    .vx(vx), .vy(vy), .vz(vz), .vw(vw), 
    .outx(outx), .outy(outy), .outz(outz), .outw(outw) 
); 
 
initial begin 
    // Example matrix = Identity 
    m00=1; m01=0; m02=0; m03=0; 
    m10=0; m11=1; m12=0; m13=0; 
    m20=0; m21=0; m22=1; m23=0; 
    m30=0; m31=0; m32=0; m33=1; 
 
    vx=10; vy=20; vz=30; vw=1; 
 
    #10; 
    $display("Result: %d %d %d %d", outx, outy, outz, outw); 
    $finish; 
end 
endmodule