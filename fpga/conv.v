// `include "mac.v"
// `include "register.v"
// `include "shift.v"

module conv(
  input clk,
  input reset,
  input [7:0] pxl_in,
  output [7:0] pxl_out
);

	//Define constants
	parameter N = 28;	//Image columns
	parameter M = 28;	//Image rows
	parameter K = 5; 	//Kernel size

	// Intermediate wires
  wire signed [16:0] wire_00; wire signed [16:0] wire_01; wire signed [16:0] wire_02; wire signed [16:0] wire_03; wire signed [16:0] wire_04;
  wire signed [16:0] wire_10; wire signed [16:0] wire_11; wire signed [16:0] wire_12; wire signed [16:0] wire_13; wire signed [16:0] wire_14;
  wire signed [16:0] wire_20; wire signed [16:0] wire_21; wire signed [16:0] wire_22; wire signed [16:0] wire_23; wire signed [16:0] wire_24;
  wire signed [16:0] wire_30; wire signed [16:0] wire_31; wire signed [16:0] wire_32; wire signed [16:0] wire_33; wire signed [16:0] wire_34;
	wire signed [16:0] wire_40; wire signed [16:0] wire_41; wire signed [16:0] wire_42; wire signed [16:0] wire_43; wire signed [16:0] wire_44;

  reg signed [7:0] weight_00 = -1; reg signed [7:0] weight_01 = 0; reg signed [7:0] weight_02 = 0; reg signed [7:0] weight_03 = 0; reg signed [7:0] weight_04 = 0;
  reg signed [7:0] weight_10 = 0; reg signed [7:0] weight_11 = -2; reg signed [7:0] weight_12 = 0; reg signed [7:0] weight_13 = 0; reg signed [7:0] weight_14 = 0;
  reg signed [7:0] weight_20 = 0; reg signed [7:0] weight_21 = 0; reg signed [7:0] weight_22 = 6; reg signed [7:0] weight_23 = 0; reg signed [7:0] weight_24 = 0;
  reg signed [7:0] weight_30 = 0; reg signed [7:0] weight_31 = 0; reg signed [7:0] weight_32 = 0; reg signed [7:0] weight_33 = -2; reg signed [7:0] weight_34 = 0;
	reg signed [7:0] weight_40 = 0; reg signed [7:0] weight_41 = 0; reg signed [7:0] weight_42 = 0; reg signed [7:0] weight_43 = 0; reg signed [7:0] weight_44 = -1;

  wire signed [16:0] reg_00; wire signed [16:0] reg_01; wire signed [16:0] reg_02; wire signed [16:0] reg_03; wire signed [16:0] reg_04;  wire signed [16:0] sr_0;
  wire signed [16:0] reg_10; wire signed [16:0] reg_11; wire signed [16:0] reg_12; wire signed [16:0] reg_13; wire signed [16:0] reg_14;  wire signed [16:0] sr_1;
  wire signed [16:0] reg_20; wire signed [16:0] reg_21; wire signed [16:0] reg_22; wire signed [16:0] reg_23; wire signed [16:0] reg_24;  wire signed [16:0] sr_2;
  wire signed [16:0] reg_30; wire signed [16:0] reg_31; wire signed [16:0] reg_32; wire signed [16:0] reg_33; wire signed [16:0] reg_34;  wire signed [16:0] sr_3;
	wire signed [16:0] reg_40; wire signed [16:0] reg_41; wire signed [16:0] reg_42; wire signed [16:0] reg_43; wire signed [16:0] reg_44;

  wire [15:0] clip_up;
  wire [7:0] clip_down;

	// Row : 0
  mac mac_00(pxl_in, weight_00, 17'h000, wire_00);
	register r_00(~clk, reset, wire_00, reg_00);


	mac mac_01(pxl_in, weight_01, reg_00, wire_01);
	register r_01(~clk, reset, wire_01, reg_01);

	mac mac_02(pxl_in, weight_02, reg_01, wire_02);
	register r_02(~clk, reset, wire_02, reg_02);

  mac mac_03(pxl_in, weight_03, reg_02, wire_03);
	register r_03(~clk, reset, wire_03, reg_03);

  mac mac_04(pxl_in, weight_04, reg_03, wire_04);
	register r_04(~clk, reset, wire_04, reg_04);

	shift row_0(~clk, reset, reg_04, sr_0);

	// Row : 1
  mac mac_10(pxl_in, weight_10, sr_0, wire_10);
	register r_10(~clk, reset, wire_10, reg_10);

	mac mac_11(pxl_in, weight_11, reg_10, wire_11);
	register r_11(~clk, reset, wire_11, reg_11);

	mac mac_12(pxl_in, weight_12, reg_11, wire_12);
	register r_12(~clk, reset, wire_12, reg_12);

  mac mac_13(pxl_in, weight_13, reg_12, wire_13);
	register r_13(~clk, reset, wire_13, reg_13);

  mac mac_14(pxl_in, weight_14, reg_13, wire_14);
	register r_14(~clk, reset, wire_14, reg_14);

	shift row_1(~clk, reset, reg_14, sr_1);

	// Row : 2
  mac mac_20(pxl_in, weight_20, sr_1, wire_20);
	register r_20(~clk, reset, wire_20, reg_20);

	mac mac_21(pxl_in, weight_21, reg_20, wire_21);
	register r_21(~clk, reset, wire_21, reg_21);

	mac mac_22(pxl_in, weight_22, reg_21, wire_22);
	register r_22(~clk, reset, wire_22, reg_22);

  mac mac_23(pxl_in, weight_23, reg_22, wire_23);
	register r_23(~clk, reset, wire_23, reg_23);

  mac mac_24(pxl_in, weight_24, reg_23, wire_24);
	register r_24(~clk, reset, wire_24, reg_24);

	shift row_2(~clk, reset, reg_24, sr_2);


  // Row : 3
  mac mac_30(pxl_in, weight_30, sr_2, wire_30);
	register r_30(~clk, reset, wire_30, reg_30);

	mac mac_31(pxl_in, weight_31, reg_30, wire_31);
	register r_31(~clk, reset, wire_31, reg_31);

	mac mac_32(pxl_in, weight_32, reg_31, wire_32);
	register r_32(~clk, reset, wire_32, reg_32);

  mac mac_33(pxl_in, weight_33, reg_32, wire_33);
	register r_33(~clk, reset, wire_33, reg_33);

  mac mac_34(pxl_in, weight_34, reg_33, wire_34);
	register r_34(~clk, reset, wire_34, reg_34);

	shift row_3(~clk, reset, reg_34, sr_3);

  // Row : 4
  mac mac_40(pxl_in, weight_40, sr_3, wire_40);
	register r_40(~clk, reset, wire_40, reg_40);

	mac mac_41(pxl_in, weight_41, reg_40, wire_41);
	register r_41(~clk, reset, wire_41, reg_41);

	mac mac_42(pxl_in, weight_42, reg_41, wire_42);
	register r_42(~clk, reset, wire_42, reg_42);

  mac mac_43(pxl_in, weight_43, reg_42, wire_43);
	register r_43(~clk, reset, wire_43, reg_43);

  mac mac_44(pxl_in, weight_44, reg_43, wire_44);
	register r_44(~clk, reset, wire_44, reg_44);

  assign clip_up = reg_44 < 0 ? 0 : reg_44[15:0];
  assign clip_down = clip_up > 255 ? 255 : clip_up[7:0];

  // assign pxl_out = clip_up;
  assign pxl_out = clip_down;
  // assign pxl_out = pxl_in;

endmodule
