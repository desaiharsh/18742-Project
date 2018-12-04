// `include "mac.v"
// `include "register.v"
// `include "shift_39.v"

module max_pool(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [PP:0] pool_out,
  output valid
);

	//Define constants
	parameter DIM = 28;	//Image columns/rows
	parameter K = 2; 	//Kernel size
  parameter STRIDE = 2;

  // pixel precision
  parameter PP = 8;

	// Intermediate wires
  wire signed [PP:0] wire_00; wire signed [PP:0] wire_01;
  wire signed [PP:0] wire_10; wire signed [PP:0] wire_11;

  wire signed [PP:0] reg_00; wire signed [PP:0] reg_01;
  wire signed [PP:0] reg_10; wire signed [PP:0] reg_11;
  wire signed [PP:0] sr_0;


	// Row : 0
  max #(PP) max_00(pxl_in, 9'h000, wire_00);
	register #(PP) r_00(~clk, reset, wire_00, reg_00);

  // register #(PP) r_00(~clk, reset, pxl_in, reg_00);

	max #(PP) max_01(pxl_in, reg_00, wire_01);
	register #(PP) r_01(~clk, reset, wire_01, reg_01);

	shift_9 #(
    .IMAGE_WIDTH(DIM),
    .KERNEL_WIDTH(K)
  ) row_0(~clk, reset, reg_01, sr_0);

	// Row : 1
  max #(PP) max_10(pxl_in, sr_0, wire_10);
	register #(PP) r_10(~clk, reset, wire_10, reg_10);

	max #(PP) max_11(pxl_in, reg_10, wire_11);
	register #(PP) r_11(~clk, reset, wire_11, reg_11);

  assign pool_out = reg_11;

  // every other valid??
  // index into row/col
  reg signed [5:0] row = -1;
  reg signed [5:0] col = 0;
  // revisit this intial value if stride is different than 2.

	always @(posedge clk) begin
    // row is in [0..DIM-1]
    if (row < DIM) begin
      row <= row + 1;
    end else begin
      row <= 0;
      col <= col < DIM-1 ? col + 1 : 0;
    end
  end
  // TODO: is this right?
  // assign valid = (row >= K-1) && (col >= K-1) && (row_stride == 0) && (col_stride == 0);

  assign valid = (row >= K-1) && (col >= K-1) && (~row[0]) && (col[0]);

endmodule
