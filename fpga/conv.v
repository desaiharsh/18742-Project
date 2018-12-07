// `include "mac.v"
// `include "register.v"
// `include "shift_39.v"

module conv(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [PP:0] conv_out,
  output valid
);

	//Define constants
	parameter DIM = 32;	//Image columns/rows
	parameter K = 5; 	//Kernel size

  // weight precision
  parameter WP = 30;
  // pixel precision
  parameter PP = 8;
  // combined precision. TODO: minus 1?
  parameter CP = WP + PP;

  parameter WEIGHT_00 = 0, WEIGHT_01 = 0, WEIGHT_02 = 0, WEIGHT_03 = 0, WEIGHT_04 = 0;
  parameter WEIGHT_10 = 0, WEIGHT_11 = 0, WEIGHT_12 = 0, WEIGHT_13 = 0, WEIGHT_14 = 0;
  parameter WEIGHT_20 = 0, WEIGHT_21 = 0, WEIGHT_22 = 0, WEIGHT_23 = 0, WEIGHT_24 = 0;
  parameter WEIGHT_30 = 0, WEIGHT_31 = 0, WEIGHT_32 = 0, WEIGHT_33 = 0, WEIGHT_34 = 0;
  parameter WEIGHT_40 = 0, WEIGHT_41 = 0, WEIGHT_42 = 0, WEIGHT_43 = 0, WEIGHT_44 = 0;

	// Intermediate wires
  wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
  wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
  wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
  wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
	wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;

  reg signed [WP:0] weight_00 = WEIGHT_00; reg signed [WP:0] weight_01 = WEIGHT_01; reg signed [WP:0] weight_02 = WEIGHT_02; reg signed [WP:0] weight_03 = WEIGHT_03; reg signed [WP:0] weight_04 = WEIGHT_04;
  reg signed [WP:0] weight_10 = WEIGHT_10; reg signed [WP:0] weight_11 = WEIGHT_11; reg signed [WP:0] weight_12 = WEIGHT_12; reg signed [WP:0] weight_13 = WEIGHT_13; reg signed [WP:0] weight_14 = WEIGHT_14;
  reg signed [WP:0] weight_20 = WEIGHT_20; reg signed [WP:0] weight_21 = WEIGHT_21; reg signed [WP:0] weight_22 = WEIGHT_22; reg signed [WP:0] weight_23 = WEIGHT_23; reg signed [WP:0] weight_24 = WEIGHT_24;
  reg signed [WP:0] weight_30 = WEIGHT_30; reg signed [WP:0] weight_31 = WEIGHT_31; reg signed [WP:0] weight_32 = WEIGHT_32; reg signed [WP:0] weight_33 = WEIGHT_33; reg signed [WP:0] weight_34 = WEIGHT_34;
  reg signed [WP:0] weight_40 = WEIGHT_40; reg signed [WP:0] weight_41 = WEIGHT_41; reg signed [WP:0] weight_42 = WEIGHT_42; reg signed [WP:0] weight_43 = WEIGHT_43; reg signed [WP:0] weight_44 = WEIGHT_44;

  wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
  wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
  wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
  wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
	wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

	// Row : 0
  mult #(PP, WP, CP) mult_00(pxl_in, weight_00, wire_00);
	register #(CP) r_00(~clk, reset, wire_00, reg_00);

	mac #(PP, WP, CP, CP) mac_01(pxl_in, weight_01, reg_00, wire_01);
	register #(CP) r_01(~clk, reset, wire_01, reg_01);

	mac #(PP, WP, CP, CP) mac_02(pxl_in, weight_02, reg_01, wire_02);
	register #(CP) r_02(~clk, reset, wire_02, reg_02);

  mac #(PP, WP, CP, CP) mac_03(pxl_in, weight_03, reg_02, wire_03);
	register #(CP) r_03(~clk, reset, wire_03, reg_03);

  mac #(PP, WP, CP, CP) mac_04(pxl_in, weight_04, reg_03, wire_04);
	register #(CP) r_04(~clk, reset, wire_04, reg_04);

	shift_39 #(
    .IMAGE_WIDTH(DIM),
    .KERNEL_WIDTH(K)
  ) row_0(~clk, reset, reg_04, sr_0);

	// Row : 1
  mac #(PP, WP, CP, CP) mac_10(pxl_in, weight_10, sr_0, wire_10);
	register #(CP) r_10(~clk, reset, wire_10, reg_10);

	mac #(PP, WP, CP, CP) mac_11(pxl_in, weight_11, reg_10, wire_11);
	register #(CP) r_11(~clk, reset, wire_11, reg_11);

	mac #(PP, WP, CP, CP) mac_12(pxl_in, weight_12, reg_11, wire_12);
	register #(CP) r_12(~clk, reset, wire_12, reg_12);

  mac #(PP, WP, CP, CP) mac_13(pxl_in, weight_13, reg_12, wire_13);
	register #(CP) r_13(~clk, reset, wire_13, reg_13);

  mac #(PP, WP, CP, CP) mac_14(pxl_in, weight_14, reg_13, wire_14);
	register #(CP) r_14(~clk, reset, wire_14, reg_14);

	shift_39 #(
    .IMAGE_WIDTH(DIM),
    .KERNEL_WIDTH(K)
  ) row_1(~clk, reset, reg_14, sr_1);

	// Row : 2
  mac #(PP, WP, CP, CP) mac_20(pxl_in, weight_20, sr_1, wire_20);
	register #(CP) r_20(~clk, reset, wire_20, reg_20);

	mac #(PP, WP, CP, CP) mac_21(pxl_in, weight_21, reg_20, wire_21);
	register #(CP) r_21(~clk, reset, wire_21, reg_21);

	mac #(PP, WP, CP, CP) mac_22(pxl_in, weight_22, reg_21, wire_22);
	register #(CP) r_22(~clk, reset, wire_22, reg_22);

  mac #(PP, WP, CP, CP) mac_23(pxl_in, weight_23, reg_22, wire_23);
	register #(CP) r_23(~clk, reset, wire_23, reg_23);

  mac #(PP, WP, CP, CP) mac_24(pxl_in, weight_24, reg_23, wire_24);
	register #(CP) r_24(~clk, reset, wire_24, reg_24);

	shift_39 #(
    .IMAGE_WIDTH(DIM),
    .KERNEL_WIDTH(K)
  ) row_2(~clk, reset, reg_24, sr_2);


  // Row : 3
  mac #(PP, WP, CP, CP) mac_30(pxl_in, weight_30, sr_2, wire_30);
	register #(CP) r_30(~clk, reset, wire_30, reg_30);

	mac #(PP, WP, CP, CP) mac_31(pxl_in, weight_31, reg_30, wire_31);
	register #(CP) r_31(~clk, reset, wire_31, reg_31);

	mac #(PP, WP, CP, CP) mac_32(pxl_in, weight_32, reg_31, wire_32);
	register #(CP) r_32(~clk, reset, wire_32, reg_32);

  mac #(PP, WP, CP, CP) mac_33(pxl_in, weight_33, reg_32, wire_33);
	register #(CP) r_33(~clk, reset, wire_33, reg_33);

  mac #(PP, WP, CP, CP) mac_34(pxl_in, weight_34, reg_33, wire_34);
	register #(CP) r_34(~clk, reset, wire_34, reg_34);

	shift_39 #(
    .IMAGE_WIDTH(DIM),
    .KERNEL_WIDTH(K)
  ) row_3(~clk, reset, reg_34, sr_3);

  // Row : 4
  mac #(PP, WP, CP, CP) mac_40(pxl_in, weight_40, sr_3, wire_40);
	register #(CP) r_40(~clk, reset, wire_40, reg_40);

	mac #(PP, WP, CP, CP) mac_41(pxl_in, weight_41, reg_40, wire_41);
	register #(CP) r_41(~clk, reset, wire_41, reg_41);

	mac #(PP, WP, CP, CP) mac_42(pxl_in, weight_42, reg_41, wire_42);
	register #(CP) r_42(~clk, reset, wire_42, reg_42);

  mac #(PP, WP, CP, CP) mac_43(pxl_in, weight_43, reg_42, wire_43);
	register #(CP) r_43(~clk, reset, wire_43, reg_43);

  mac #(PP, WP, CP, CP) mac_44(pxl_in, weight_44, reg_43, wire_44);
	register #(CP) r_44(~clk, reset, wire_44, reg_44);

  assign conv_out = reg_44[CP:CP-PP];


  // these have to be big enough for each dimension
  reg signed [5:0] row = -1;
  reg signed [5:0] col = 0;

	always @(posedge clk) begin
    // row is in [0..DIM-1]
    if (row < DIM-1) begin
      row <= row + 1;
    end else begin
      row <= 0;
      col <= col < DIM-1 ? col + 1 : 0;
    end
  end
  // TODO: is this right?
  assign valid = (row >= K-1) && (col >= K-1);

endmodule
