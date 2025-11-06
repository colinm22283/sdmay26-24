module single_cycle_mat_mult #(parameter BUS_DATA_SIZE = 32) ( 
  input signed [BUS_DATA_SIZE-1:0] m00, input signed [BUS_DATA_SIZE-1:0] m01, input signed [BUS_DATA_SIZE-1:0] m02, input signed [BUS_DATA_SIZE-1:0] m03, 
  input signed [BUS_DATA_SIZE-1:0] m10, input signed [BUS_DATA_SIZE-1:0] m11, input signed [BUS_DATA_SIZE-1:0] m12, input signed [BUS_DATA_SIZE-1:0] m13, 
  input signed [BUS_DATA_SIZE-1:0] m20, input signed [BUS_DATA_SIZE-1:0] m21, input signed [BUS_DATA_SIZE-1:0] m22, input signed [BUS_DATA_SIZE-1:0] m23, 
  input signed [BUS_DATA_SIZE-1:0] m30, input signed [BUS_DATA_SIZE-1:0] m31, input signed [BUS_DATA_SIZE-1:0] m32, input signed [BUS_DATA_SIZE-1:0] m33, 

  input  signed [BUS_DATA_SIZE-1:0] vx, input signed [BUS_DATA_SIZE-1:0] vy, 
  input  signed [BUS_DATA_SIZE-1:0] vz, input signed [BUS_DATA_SIZE-1:0] vw, 
 
  output signed [BUS_DATA_SIZE*2-1:0] outx, output signed [BUS_DATA_SIZE*2-1:0] outy, 
  output signed [BUS_DATA_SIZE*2-1:0] outz, output signed [BUS_DATA_SIZE*2-1:0] outw 
); 

  // Row 0 
  assign outx = (m00 * vx) + (m01 * vy) + (m02 * vz) + (m03 * vw); 
 
  // Row 1 
  assign outy = (m10 * vx) + (m11 * vy) + (m12 * vz) + (m13 * vw); 
 
  // Row 2 
  assign outz = (m20 * vx) + (m21 * vy) + (m22 * vz) + (m23 * vw); 
 
  // Row 3 
  assign outw = (m30 * vx) + (m31 * vy) + (m32 * vz) + (m33 * vw); 
  

endmodule 