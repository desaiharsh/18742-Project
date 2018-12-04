
module conv0_0(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b100101000100110011100110111000; reg signed [WP:0] weight_01 = 30'b101000110001101011001100011000; reg signed [WP:0] weight_02 = 30'b101110100100011110100001101001; reg signed [WP:0] weight_03 = 30'b000111111100010110000000110111; reg signed [WP:0] weight_04 = 30'b000010010010100011111101010001; 
reg signed [WP:0] weight_10 = 30'b111111011001001101000101001011; reg signed [WP:0] weight_11 = 30'b111010110010110100101111101010; reg signed [WP:0] weight_12 = 30'b000011000101000010010101101001; reg signed [WP:0] weight_13 = 30'b111101001110000101011001110000; reg signed [WP:0] weight_14 = 30'b001010111101101001100001110001; 
reg signed [WP:0] weight_20 = 30'b111111000001100011010000001101; reg signed [WP:0] weight_21 = 30'b000000010100011011101110101101; reg signed [WP:0] weight_22 = 30'b111001001000010011011010010100; reg signed [WP:0] weight_23 = 30'b111111101111011111101010101000; reg signed [WP:0] weight_24 = 30'b111110110001000001100010011110; 
reg signed [WP:0] weight_30 = 30'b010001100101011101010111100001; reg signed [WP:0] weight_31 = 30'b000001100111101001010000100011; reg signed [WP:0] weight_32 = 30'b111110101100110001111010100001; reg signed [WP:0] weight_33 = 30'b011100100000000111100100000101; reg signed [WP:0] weight_34 = 30'b011100001011001101011001111100; 
reg signed [WP:0] weight_40 = 30'b101010111011010101010111001001; reg signed [WP:0] weight_41 = 30'b101110110010000110000101110101; reg signed [WP:0] weight_42 = 30'b001000010111100001000011100011; reg signed [WP:0] weight_43 = 30'b110110001110010000000011101111; reg signed [WP:0] weight_44 = 30'b100100001000000000000110010101; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv0_1(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b000100100110000110101000101000; reg signed [WP:0] weight_01 = 30'b000011100001110100001001000011; reg signed [WP:0] weight_02 = 30'b000101000001101100100000110110; reg signed [WP:0] weight_03 = 30'b111100011100010000111101101011; reg signed [WP:0] weight_04 = 30'b100000111101110101101001101010; 
reg signed [WP:0] weight_10 = 30'b010110000001011000001111000111; reg signed [WP:0] weight_11 = 30'b000111011011100101011010010101; reg signed [WP:0] weight_12 = 30'b000011100001010011010111100001; reg signed [WP:0] weight_13 = 30'b011110101101111101101100011011; reg signed [WP:0] weight_14 = 30'b101000010000000101010010000100; 
reg signed [WP:0] weight_20 = 30'b000001111110111111100000000001; reg signed [WP:0] weight_21 = 30'b100010000001001011011101001011; reg signed [WP:0] weight_22 = 30'b100001010101110100111011111110; reg signed [WP:0] weight_23 = 30'b110100011011010000011100100011; reg signed [WP:0] weight_24 = 30'b001011010100011001000010010101; 
reg signed [WP:0] weight_30 = 30'b000100001101011100100110011100; reg signed [WP:0] weight_31 = 30'b111010001001001001000001001100; reg signed [WP:0] weight_32 = 30'b101110111011011101100010111011; reg signed [WP:0] weight_33 = 30'b100101111111111011001110001110; reg signed [WP:0] weight_34 = 30'b011011100100011101000111010100; 
reg signed [WP:0] weight_40 = 30'b010100101111010010100101000111; reg signed [WP:0] weight_41 = 30'b101101010100001010110100001111; reg signed [WP:0] weight_42 = 30'b011111101011011110111110011000; reg signed [WP:0] weight_43 = 30'b001000100101010001100110100000; reg signed [WP:0] weight_44 = 30'b011011110101011101001111101000; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv0_2(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b110100011111100111110000010010; reg signed [WP:0] weight_01 = 30'b100111111101101101001010101110; reg signed [WP:0] weight_02 = 30'b110011101100000010111000101011; reg signed [WP:0] weight_03 = 30'b011011101001010010110010110110; reg signed [WP:0] weight_04 = 30'b111010101000110001001001111001; 
reg signed [WP:0] weight_10 = 30'b110000111000111011010000111101; reg signed [WP:0] weight_11 = 30'b001000001110111111001001111001; reg signed [WP:0] weight_12 = 30'b101110101001000011110010101001; reg signed [WP:0] weight_13 = 30'b000000100010111111001011000000; reg signed [WP:0] weight_14 = 30'b100000101001101010101100010100; 
reg signed [WP:0] weight_20 = 30'b011001000110111001011110001111; reg signed [WP:0] weight_21 = 30'b111100000100010101011101101000; reg signed [WP:0] weight_22 = 30'b101010000001101101101010101011; reg signed [WP:0] weight_23 = 30'b111010111111101100101011111000; reg signed [WP:0] weight_24 = 30'b110010101100100001110111011011; 
reg signed [WP:0] weight_30 = 30'b001101000101000011010101010110; reg signed [WP:0] weight_31 = 30'b011000110101001101010111001011; reg signed [WP:0] weight_32 = 30'b000000000011101000100100110011; reg signed [WP:0] weight_33 = 30'b101100011100100011111000100110; reg signed [WP:0] weight_34 = 30'b011000011100100101111101010001; 
reg signed [WP:0] weight_40 = 30'b110000111101001111111010011001; reg signed [WP:0] weight_41 = 30'b110101110110010010011111100111; reg signed [WP:0] weight_42 = 30'b001010010010000111101011100100; reg signed [WP:0] weight_43 = 30'b010010111000100011111101100101; reg signed [WP:0] weight_44 = 30'b100111100001110000101110100110; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv0_3(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b101010011011101101001011111001; reg signed [WP:0] weight_01 = 30'b001010000111011010000010101100; reg signed [WP:0] weight_02 = 30'b000111000100001001111001110000; reg signed [WP:0] weight_03 = 30'b100001100111010101110000011111; reg signed [WP:0] weight_04 = 30'b010010000101110000100011010100; 
reg signed [WP:0] weight_10 = 30'b111110101111010101111100011011; reg signed [WP:0] weight_11 = 30'b100001011010101000011000111111; reg signed [WP:0] weight_12 = 30'b110010010110001101100001101111; reg signed [WP:0] weight_13 = 30'b000101000000110000000010100001; reg signed [WP:0] weight_14 = 30'b101000110010100010001011100111; 
reg signed [WP:0] weight_20 = 30'b000011101010100100001111110100; reg signed [WP:0] weight_21 = 30'b000111100111100001110110000111; reg signed [WP:0] weight_22 = 30'b100011011111001101101011001111; reg signed [WP:0] weight_23 = 30'b100100010110111000110000001100; reg signed [WP:0] weight_24 = 30'b111101111111011100110011100001; 
reg signed [WP:0] weight_30 = 30'b000110111011011111000110001100; reg signed [WP:0] weight_31 = 30'b110010111101000010110111000010; reg signed [WP:0] weight_32 = 30'b000011010001000001011011111011; reg signed [WP:0] weight_33 = 30'b111111111001011111100100101111; reg signed [WP:0] weight_34 = 30'b111110100011010101110000110111; 
reg signed [WP:0] weight_40 = 30'b100000100010001000110000001001; reg signed [WP:0] weight_41 = 30'b111010100100010010101011111110; reg signed [WP:0] weight_42 = 30'b010101001101101100110110111000; reg signed [WP:0] weight_43 = 30'b001001000000010011000010010011; reg signed [WP:0] weight_44 = 30'b110001001111101011001101110110; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv0_4(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b000101001010000010100010111011; reg signed [WP:0] weight_01 = 30'b000011011110000101100000100001; reg signed [WP:0] weight_02 = 30'b111001001110000000100010001100; reg signed [WP:0] weight_03 = 30'b001100110111001010000100101111; reg signed [WP:0] weight_04 = 30'b101111110000010110100111011101; 
reg signed [WP:0] weight_10 = 30'b010001111101000001111010101001; reg signed [WP:0] weight_11 = 30'b101101011110101110000100101011; reg signed [WP:0] weight_12 = 30'b010000100101010100010100101000; reg signed [WP:0] weight_13 = 30'b011001111110110111100100000111; reg signed [WP:0] weight_14 = 30'b101110001000110011011111101010; 
reg signed [WP:0] weight_20 = 30'b111000111001111110000111010111; reg signed [WP:0] weight_21 = 30'b111100010001010110011110000100; reg signed [WP:0] weight_22 = 30'b101011001000000000101000011000; reg signed [WP:0] weight_23 = 30'b101011011110010011101110001000; reg signed [WP:0] weight_24 = 30'b101101000110010010010011000011; 
reg signed [WP:0] weight_30 = 30'b110111101000101011110111011100; reg signed [WP:0] weight_31 = 30'b110000100011001000101000011111; reg signed [WP:0] weight_32 = 30'b100110001101001111001010000100; reg signed [WP:0] weight_33 = 30'b001110101101001110011100000001; reg signed [WP:0] weight_34 = 30'b011101100011010011110110110111; 
reg signed [WP:0] weight_40 = 30'b000010001100011111100100110111; reg signed [WP:0] weight_41 = 30'b001000101111000010011000101110; reg signed [WP:0] weight_42 = 30'b000010111001010011111011001101; reg signed [WP:0] weight_43 = 30'b011000000110000110111010111100; reg signed [WP:0] weight_44 = 30'b101111010000111010001101011110; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv0_5(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b011111100110101110001101110110; reg signed [WP:0] weight_01 = 30'b111010100000110001010011011111; reg signed [WP:0] weight_02 = 30'b010011111110001011010000101100; reg signed [WP:0] weight_03 = 30'b010110001000001001001111100111; reg signed [WP:0] weight_04 = 30'b110000110000010011001001110110; 
reg signed [WP:0] weight_10 = 30'b110100100010101010100100011100; reg signed [WP:0] weight_11 = 30'b101101101011010001000011111111; reg signed [WP:0] weight_12 = 30'b010111011100111001001110001000; reg signed [WP:0] weight_13 = 30'b110100010101011100110000101010; reg signed [WP:0] weight_14 = 30'b110110110000000010110010101001; 
reg signed [WP:0] weight_20 = 30'b101110110101111111011000111100; reg signed [WP:0] weight_21 = 30'b010011100101011111011100011000; reg signed [WP:0] weight_22 = 30'b011111010111011000010100010011; reg signed [WP:0] weight_23 = 30'b001001011101100001000010110010; reg signed [WP:0] weight_24 = 30'b001100110100111111000010101010; 
reg signed [WP:0] weight_30 = 30'b000000011000101101110101101001; reg signed [WP:0] weight_31 = 30'b111100011000100111001000100001; reg signed [WP:0] weight_32 = 30'b000011101001001000010110011100; reg signed [WP:0] weight_33 = 30'b010000111111100110010110101000; reg signed [WP:0] weight_34 = 30'b101010001010110000000000101101; 
reg signed [WP:0] weight_40 = 30'b011110101101100001100110110110; reg signed [WP:0] weight_41 = 30'b110010001000001001010101100001; reg signed [WP:0] weight_42 = 30'b111011000000110011111000110001; reg signed [WP:0] weight_43 = 30'b010110010010101100111001110101; reg signed [WP:0] weight_44 = 30'b000111110011111000101010010011; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_0(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b000001011100100111101111000111; reg signed [WP:0] weight_01 = 30'b100010101010111100111111111001; reg signed [WP:0] weight_02 = 30'b000010110110101011011010001100; reg signed [WP:0] weight_03 = 30'b101000001001000001001010000000; reg signed [WP:0] weight_04 = 30'b000101000000111110110011000111; 
reg signed [WP:0] weight_10 = 30'b010010010001110110000001100001; reg signed [WP:0] weight_11 = 30'b101100001000001011110011101000; reg signed [WP:0] weight_12 = 30'b000100001110111101010101011101; reg signed [WP:0] weight_13 = 30'b011001110111000101000000110110; reg signed [WP:0] weight_14 = 30'b111110110011111001011000000111; 
reg signed [WP:0] weight_20 = 30'b000001111000100110111000100010; reg signed [WP:0] weight_21 = 30'b010001100011110101000011000001; reg signed [WP:0] weight_22 = 30'b110110010011010000010110101001; reg signed [WP:0] weight_23 = 30'b000001000100101110011000100000; reg signed [WP:0] weight_24 = 30'b101001000101010101100001011000; 
reg signed [WP:0] weight_30 = 30'b000101101111111110110010100001; reg signed [WP:0] weight_31 = 30'b010001000010100001010101010100; reg signed [WP:0] weight_32 = 30'b000010110111001010010011100110; reg signed [WP:0] weight_33 = 30'b010011010110011110101010000001; reg signed [WP:0] weight_34 = 30'b001010111001001100110000111000; 
reg signed [WP:0] weight_40 = 30'b111110100001011011100111111110; reg signed [WP:0] weight_41 = 30'b000001111001111111001001000000; reg signed [WP:0] weight_42 = 30'b000111011110011100101010011010; reg signed [WP:0] weight_43 = 30'b111111001101011100010100011101; reg signed [WP:0] weight_44 = 30'b101010101101101111101110100110; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_1(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b101100101111010010111000010010; reg signed [WP:0] weight_01 = 30'b010011011101001101010010011111; reg signed [WP:0] weight_02 = 30'b110000001011100010101100010011; reg signed [WP:0] weight_03 = 30'b100111010100100000001110000111; reg signed [WP:0] weight_04 = 30'b101000101101111111111001111110; 
reg signed [WP:0] weight_10 = 30'b100111001111001101111100110110; reg signed [WP:0] weight_11 = 30'b011000000101110001100001010011; reg signed [WP:0] weight_12 = 30'b000000001001101101100011101101; reg signed [WP:0] weight_13 = 30'b011111100011011010011011101100; reg signed [WP:0] weight_14 = 30'b001011000100010000100010001111; 
reg signed [WP:0] weight_20 = 30'b110101010101010001010101101011; reg signed [WP:0] weight_21 = 30'b011000101101001100011100000000; reg signed [WP:0] weight_22 = 30'b110100110101001100010100001111; reg signed [WP:0] weight_23 = 30'b111101010101100000001000100000; reg signed [WP:0] weight_24 = 30'b100100111111000110001000010111; 
reg signed [WP:0] weight_30 = 30'b011011000101011110110100010010; reg signed [WP:0] weight_31 = 30'b110110100101100000011101001011; reg signed [WP:0] weight_32 = 30'b001111010110110101100011011001; reg signed [WP:0] weight_33 = 30'b011001011111110111111111111111; reg signed [WP:0] weight_34 = 30'b011011110110110011010010011010; 
reg signed [WP:0] weight_40 = 30'b111111111001110010111101000000; reg signed [WP:0] weight_41 = 30'b111111001110111001000000001111; reg signed [WP:0] weight_42 = 30'b110111000000010011000001100101; reg signed [WP:0] weight_43 = 30'b011010101100010111101111000110; reg signed [WP:0] weight_44 = 30'b100100010110000010010101010010; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_2(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b000101111010110101000001010111; reg signed [WP:0] weight_01 = 30'b001010110101100010100110011110; reg signed [WP:0] weight_02 = 30'b100110000011010011100110100110; reg signed [WP:0] weight_03 = 30'b111110010011101000010101010010; reg signed [WP:0] weight_04 = 30'b111001111001100010010111111000; 
reg signed [WP:0] weight_10 = 30'b001010000010100011011100011011; reg signed [WP:0] weight_11 = 30'b001100001111111011000100110100; reg signed [WP:0] weight_12 = 30'b011000101001000011001111011100; reg signed [WP:0] weight_13 = 30'b110101011100110110000100101001; reg signed [WP:0] weight_14 = 30'b011100110110101110001000010001; 
reg signed [WP:0] weight_20 = 30'b010010001101101101100100110000; reg signed [WP:0] weight_21 = 30'b001100010110111000101010000000; reg signed [WP:0] weight_22 = 30'b111011110101100100101011010111; reg signed [WP:0] weight_23 = 30'b011100101101000110000101110111; reg signed [WP:0] weight_24 = 30'b111010001110000000100100011101; 
reg signed [WP:0] weight_30 = 30'b011010010111100111000110010101; reg signed [WP:0] weight_31 = 30'b000100101100001011101100011101; reg signed [WP:0] weight_32 = 30'b110101001000111110001010000000; reg signed [WP:0] weight_33 = 30'b101010110000000001110100101011; reg signed [WP:0] weight_34 = 30'b101111010111111111100101110001; 
reg signed [WP:0] weight_40 = 30'b011000101011000010111110011000; reg signed [WP:0] weight_41 = 30'b101101011101110011110010011110; reg signed [WP:0] weight_42 = 30'b001110000010000101111000000000; reg signed [WP:0] weight_43 = 30'b100001100001111110110010001010; reg signed [WP:0] weight_44 = 30'b011111000110101001101010000111; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_3(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b110101001000110111000100011101; reg signed [WP:0] weight_01 = 30'b001100101110010000001111111001; reg signed [WP:0] weight_02 = 30'b111110001101110111100010000000; reg signed [WP:0] weight_03 = 30'b011010100000011010000001011110; reg signed [WP:0] weight_04 = 30'b001011111111101011001000101000; 
reg signed [WP:0] weight_10 = 30'b111100010010100110010110011010; reg signed [WP:0] weight_11 = 30'b000000101101010111011010101101; reg signed [WP:0] weight_12 = 30'b001111101000000011000100101001; reg signed [WP:0] weight_13 = 30'b010101111001011110100111101101; reg signed [WP:0] weight_14 = 30'b001101110100010111010111101101; 
reg signed [WP:0] weight_20 = 30'b100110101001101001101001110010; reg signed [WP:0] weight_21 = 30'b101100000001100100010110001110; reg signed [WP:0] weight_22 = 30'b111000010011010111001110100001; reg signed [WP:0] weight_23 = 30'b001110001100010101100110100000; reg signed [WP:0] weight_24 = 30'b111101101111110000110001000101; 
reg signed [WP:0] weight_30 = 30'b101001101100001100011111011011; reg signed [WP:0] weight_31 = 30'b100000111111000011001110101111; reg signed [WP:0] weight_32 = 30'b011110111001100100100101111111; reg signed [WP:0] weight_33 = 30'b101010000100010101111101010100; reg signed [WP:0] weight_34 = 30'b100001101000111001011101011100; 
reg signed [WP:0] weight_40 = 30'b100110011000010001000000100001; reg signed [WP:0] weight_41 = 30'b101001011111000110101011100101; reg signed [WP:0] weight_42 = 30'b111101000101001001010011011101; reg signed [WP:0] weight_43 = 30'b100101000010100110110010101101; reg signed [WP:0] weight_44 = 30'b011110101100001111011111011111; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_4(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b000100001100000110101110010100; reg signed [WP:0] weight_01 = 30'b100011011101011101111001001100; reg signed [WP:0] weight_02 = 30'b101101111011011011010110010111; reg signed [WP:0] weight_03 = 30'b110101010000101011111101111011; reg signed [WP:0] weight_04 = 30'b011110111100101000010111110101; 
reg signed [WP:0] weight_10 = 30'b010000110000111000001000100010; reg signed [WP:0] weight_11 = 30'b111011001010111111010101000001; reg signed [WP:0] weight_12 = 30'b011010000000010011101101000110; reg signed [WP:0] weight_13 = 30'b100010111000110010111001100101; reg signed [WP:0] weight_14 = 30'b010001010111100101010110110110; 
reg signed [WP:0] weight_20 = 30'b110001110111101010101111111010; reg signed [WP:0] weight_21 = 30'b011100110100110011111000011011; reg signed [WP:0] weight_22 = 30'b010100111011000110100111000100; reg signed [WP:0] weight_23 = 30'b111000001010010101101101111010; reg signed [WP:0] weight_24 = 30'b010001000010011101100010101010; 
reg signed [WP:0] weight_30 = 30'b111110001100100000111101100011; reg signed [WP:0] weight_31 = 30'b011100001111011011110100111101; reg signed [WP:0] weight_32 = 30'b011001101010001011111011000111; reg signed [WP:0] weight_33 = 30'b000111111111100110011110000010; reg signed [WP:0] weight_34 = 30'b010010010010110111100100100100; 
reg signed [WP:0] weight_40 = 30'b101011100101101000010101011011; reg signed [WP:0] weight_41 = 30'b100110000010011001000110000111; reg signed [WP:0] weight_42 = 30'b111100111111101111000100000011; reg signed [WP:0] weight_43 = 30'b010001101101101000111100101001; reg signed [WP:0] weight_44 = 30'b111000011111100111001011011010; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_5(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b100111001111010011000100110001; reg signed [WP:0] weight_01 = 30'b011100111100111111101010011100; reg signed [WP:0] weight_02 = 30'b101110000111111111100110111110; reg signed [WP:0] weight_03 = 30'b000010101100000100010110010010; reg signed [WP:0] weight_04 = 30'b110110000101001000011010111001; 
reg signed [WP:0] weight_10 = 30'b000100011111001001100010101111; reg signed [WP:0] weight_11 = 30'b010111110000100110100010101010; reg signed [WP:0] weight_12 = 30'b000010000011001111011110101011; reg signed [WP:0] weight_13 = 30'b001011000001110101011101100001; reg signed [WP:0] weight_14 = 30'b000010111101101110001110110010; 
reg signed [WP:0] weight_20 = 30'b100000010100111101000000111111; reg signed [WP:0] weight_21 = 30'b010001101010001110000001000011; reg signed [WP:0] weight_22 = 30'b011010010010101100110101001001; reg signed [WP:0] weight_23 = 30'b100110010101110001110011100101; reg signed [WP:0] weight_24 = 30'b010010000111001011100001011110; 
reg signed [WP:0] weight_30 = 30'b100110011111101101110010001011; reg signed [WP:0] weight_31 = 30'b001111100111100001011000011011; reg signed [WP:0] weight_32 = 30'b010010100011101001010110100000; reg signed [WP:0] weight_33 = 30'b001010000011100001001100111110; reg signed [WP:0] weight_34 = 30'b100000111000111100110001001101; 
reg signed [WP:0] weight_40 = 30'b000111000011010100000101000011; reg signed [WP:0] weight_41 = 30'b111000000010100101100011001101; reg signed [WP:0] weight_42 = 30'b110101100001001010110111000001; reg signed [WP:0] weight_43 = 30'b010100011100101110010111010010; reg signed [WP:0] weight_44 = 30'b010111110111100111110001000110; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_6(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b101100010010011110010001001000; reg signed [WP:0] weight_01 = 30'b111101100010011111110000101000; reg signed [WP:0] weight_02 = 30'b011111101001001100100110011011; reg signed [WP:0] weight_03 = 30'b010000001000011110100110100101; reg signed [WP:0] weight_04 = 30'b101000000001101110111010111010; 
reg signed [WP:0] weight_10 = 30'b111101100010001000101011001010; reg signed [WP:0] weight_11 = 30'b101010011111001000011100011000; reg signed [WP:0] weight_12 = 30'b111010111000001001011110100010; reg signed [WP:0] weight_13 = 30'b110100111001011010100100110001; reg signed [WP:0] weight_14 = 30'b111010111011011011110110100111; 
reg signed [WP:0] weight_20 = 30'b010011110011010000001111010111; reg signed [WP:0] weight_21 = 30'b110100000100101110100011101000; reg signed [WP:0] weight_22 = 30'b110000111000001111100101110010; reg signed [WP:0] weight_23 = 30'b101010101100010001101000000010; reg signed [WP:0] weight_24 = 30'b011000011111101000101011101011; 
reg signed [WP:0] weight_30 = 30'b100101101110111100101001010000; reg signed [WP:0] weight_31 = 30'b111100101101110110000001101001; reg signed [WP:0] weight_32 = 30'b000011001101000000000110000001; reg signed [WP:0] weight_33 = 30'b110100001010001111001011010010; reg signed [WP:0] weight_34 = 30'b000111100110001001000011011011; 
reg signed [WP:0] weight_40 = 30'b011010101000111011111011111011; reg signed [WP:0] weight_41 = 30'b110111110101011111000011000011; reg signed [WP:0] weight_42 = 30'b101001110100111110010011110110; reg signed [WP:0] weight_43 = 30'b101000001001111010101010111001; reg signed [WP:0] weight_44 = 30'b101010000010110111110111100000; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_7(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b001100111101101101101001110100; reg signed [WP:0] weight_01 = 30'b111100101101111100111110101101; reg signed [WP:0] weight_02 = 30'b100111100101000000000100000101; reg signed [WP:0] weight_03 = 30'b011001001110001010111011101010; reg signed [WP:0] weight_04 = 30'b010100001111001110110000001011; 
reg signed [WP:0] weight_10 = 30'b000001001010101100100011110111; reg signed [WP:0] weight_11 = 30'b111010010101011101100110010101; reg signed [WP:0] weight_12 = 30'b000110000110011111101010000101; reg signed [WP:0] weight_13 = 30'b000100100101000101010001111010; reg signed [WP:0] weight_14 = 30'b110101111101010010101010001001; 
reg signed [WP:0] weight_20 = 30'b010111011111101110001001010111; reg signed [WP:0] weight_21 = 30'b101000111000001100110111101110; reg signed [WP:0] weight_22 = 30'b001111101100100101011001011010; reg signed [WP:0] weight_23 = 30'b010110100111001110110101010111; reg signed [WP:0] weight_24 = 30'b000010100010011110000101001010; 
reg signed [WP:0] weight_30 = 30'b011111101100000001100010010111; reg signed [WP:0] weight_31 = 30'b011000111100100000110010101001; reg signed [WP:0] weight_32 = 30'b000011010011010110100010000101; reg signed [WP:0] weight_33 = 30'b111101001000111111010000110000; reg signed [WP:0] weight_34 = 30'b111011010110100011110010100010; 
reg signed [WP:0] weight_40 = 30'b010001101101101010110111100001; reg signed [WP:0] weight_41 = 30'b101101000110110000000000001111; reg signed [WP:0] weight_42 = 30'b110101001011101010100010100100; reg signed [WP:0] weight_43 = 30'b011000101010000110001011010101; reg signed [WP:0] weight_44 = 30'b100110000101111100000010000101; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_8(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b010101011101111010100111000101; reg signed [WP:0] weight_01 = 30'b000100010110001011011010110100; reg signed [WP:0] weight_02 = 30'b110101001100010001001110111001; reg signed [WP:0] weight_03 = 30'b110011110110110101010111000010; reg signed [WP:0] weight_04 = 30'b110001011000000011110000001000; 
reg signed [WP:0] weight_10 = 30'b111101111011011110100101111011; reg signed [WP:0] weight_11 = 30'b001110011011100101111101111011; reg signed [WP:0] weight_12 = 30'b011100100100000110011110000010; reg signed [WP:0] weight_13 = 30'b011100100111100000111001111000; reg signed [WP:0] weight_14 = 30'b011001110110011001000000101110; 
reg signed [WP:0] weight_20 = 30'b101100011001000111111000011000; reg signed [WP:0] weight_21 = 30'b111110011010110000010000001010; reg signed [WP:0] weight_22 = 30'b111101111000111101101110101101; reg signed [WP:0] weight_23 = 30'b010011110000110101101110000010; reg signed [WP:0] weight_24 = 30'b010111101010011000000110001100; 
reg signed [WP:0] weight_30 = 30'b100011010101010000110110100001; reg signed [WP:0] weight_31 = 30'b011010011101101001011000000000; reg signed [WP:0] weight_32 = 30'b010010100111101011011000011001; reg signed [WP:0] weight_33 = 30'b111010011011001101011000011111; reg signed [WP:0] weight_34 = 30'b100011110011100100110101101001; 
reg signed [WP:0] weight_40 = 30'b011110100100111100110111110101; reg signed [WP:0] weight_41 = 30'b111001001010010000010000111111; reg signed [WP:0] weight_42 = 30'b111011111001010111010100000000; reg signed [WP:0] weight_43 = 30'b001010010101010111011100101110; reg signed [WP:0] weight_44 = 30'b011100010000110110111010000010; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_9(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b010010101000011011001100000101; reg signed [WP:0] weight_01 = 30'b010011011001000101001110001110; reg signed [WP:0] weight_02 = 30'b101111010001010010001010100011; reg signed [WP:0] weight_03 = 30'b110111010001101011101111100011; reg signed [WP:0] weight_04 = 30'b110001011000100111111011101010; 
reg signed [WP:0] weight_10 = 30'b111010011110000011100111010001; reg signed [WP:0] weight_11 = 30'b001010100100011110111001011010; reg signed [WP:0] weight_12 = 30'b011001000000111011010100101000; reg signed [WP:0] weight_13 = 30'b001010000110010000111001010001; reg signed [WP:0] weight_14 = 30'b011111101001001000111111010000; 
reg signed [WP:0] weight_20 = 30'b111000001110011110100000110011; reg signed [WP:0] weight_21 = 30'b010011011000101111000001011011; reg signed [WP:0] weight_22 = 30'b001110000111111101001011010000; reg signed [WP:0] weight_23 = 30'b110001100001110111111110110101; reg signed [WP:0] weight_24 = 30'b001111000111110000000001011101; 
reg signed [WP:0] weight_30 = 30'b011001000101111111010000111000; reg signed [WP:0] weight_31 = 30'b101110111101101100111111010111; reg signed [WP:0] weight_32 = 30'b100110100011101000100011001100; reg signed [WP:0] weight_33 = 30'b000111101110100101100101000100; reg signed [WP:0] weight_34 = 30'b110110111001010110100001010100; 
reg signed [WP:0] weight_40 = 30'b011101110011101101000001111100; reg signed [WP:0] weight_41 = 30'b100001000111011100000011000101; reg signed [WP:0] weight_42 = 30'b101110010011110001111001101101; reg signed [WP:0] weight_43 = 30'b001000101000110100010101110110; reg signed [WP:0] weight_44 = 30'b100111111101001101000001101001; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_10(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b110101110010011011111000010111; reg signed [WP:0] weight_01 = 30'b110001000011101111101110001111; reg signed [WP:0] weight_02 = 30'b010100011000101111110000101001; reg signed [WP:0] weight_03 = 30'b100000111100001000111101100101; reg signed [WP:0] weight_04 = 30'b101101110011101000110010100110; 
reg signed [WP:0] weight_10 = 30'b010001011111110001011011011111; reg signed [WP:0] weight_11 = 30'b111101001000100011100111111100; reg signed [WP:0] weight_12 = 30'b100001101110100001010101010010; reg signed [WP:0] weight_13 = 30'b000010001111000000111011100100; reg signed [WP:0] weight_14 = 30'b000110100010101011011110010010; 
reg signed [WP:0] weight_20 = 30'b010000111110101011010111110001; reg signed [WP:0] weight_21 = 30'b001010011110101010001011101111; reg signed [WP:0] weight_22 = 30'b110010111000010111101100001011; reg signed [WP:0] weight_23 = 30'b001001110110010000100100011011; reg signed [WP:0] weight_24 = 30'b101101000111101111100000101110; 
reg signed [WP:0] weight_30 = 30'b001101001011111011011110011011; reg signed [WP:0] weight_31 = 30'b000111101011000101010111101111; reg signed [WP:0] weight_32 = 30'b000000111110011010110110111011; reg signed [WP:0] weight_33 = 30'b001101010101111000000000011001; reg signed [WP:0] weight_34 = 30'b010011111010001000000010010100; 
reg signed [WP:0] weight_40 = 30'b101011110110001101000110000111; reg signed [WP:0] weight_41 = 30'b110001010001100100100111110100; reg signed [WP:0] weight_42 = 30'b001111011101100101111010101111; reg signed [WP:0] weight_43 = 30'b111000110010100011111111000110; reg signed [WP:0] weight_44 = 30'b110101100101101000100110000101; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_11(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b110010110110001011101010101101; reg signed [WP:0] weight_01 = 30'b110111010010011011100111001111; reg signed [WP:0] weight_02 = 30'b001100001101101001100000100010; reg signed [WP:0] weight_03 = 30'b111000100011111111101101010001; reg signed [WP:0] weight_04 = 30'b111110000000000101011001110010; 
reg signed [WP:0] weight_10 = 30'b010000111101101000111000110111; reg signed [WP:0] weight_11 = 30'b010110011010000010010110010100; reg signed [WP:0] weight_12 = 30'b100100001101011101010011011111; reg signed [WP:0] weight_13 = 30'b010101011101001001100111000111; reg signed [WP:0] weight_14 = 30'b111111001011111100011110010110; 
reg signed [WP:0] weight_20 = 30'b001100100001111000111111001011; reg signed [WP:0] weight_21 = 30'b001101010000100011011010101100; reg signed [WP:0] weight_22 = 30'b001001000001100000000100111001; reg signed [WP:0] weight_23 = 30'b110101101010011001111000101010; reg signed [WP:0] weight_24 = 30'b111011011110110010001111011110; 
reg signed [WP:0] weight_30 = 30'b001010110011001101010001000001; reg signed [WP:0] weight_31 = 30'b000101101110011001101001100110; reg signed [WP:0] weight_32 = 30'b000010011100101011101100001110; reg signed [WP:0] weight_33 = 30'b010001001011101011010100001001; reg signed [WP:0] weight_34 = 30'b001100101100111100100100011111; 
reg signed [WP:0] weight_40 = 30'b101001101110101110000111101001; reg signed [WP:0] weight_41 = 30'b111000010110011001110101000111; reg signed [WP:0] weight_42 = 30'b100110011101111000110010010010; reg signed [WP:0] weight_43 = 30'b000101010110100100010100010100; reg signed [WP:0] weight_44 = 30'b011100100111000010010110100101; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_12(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b111001100100110010001001010000; reg signed [WP:0] weight_01 = 30'b101110100110100110011001000110; reg signed [WP:0] weight_02 = 30'b110110000111110010100100110101; reg signed [WP:0] weight_03 = 30'b010100111010001000001000101100; reg signed [WP:0] weight_04 = 30'b110000110010101001011011111010; 
reg signed [WP:0] weight_10 = 30'b111100101001010011001001010001; reg signed [WP:0] weight_11 = 30'b001000000010000100101000100001; reg signed [WP:0] weight_12 = 30'b111110100011101000100101001100; reg signed [WP:0] weight_13 = 30'b010011000001110111001101011100; reg signed [WP:0] weight_14 = 30'b100110011010110110111101101000; 
reg signed [WP:0] weight_20 = 30'b110000000000010001010100000100; reg signed [WP:0] weight_21 = 30'b001111010100100111111001011010; reg signed [WP:0] weight_22 = 30'b000100011110100010110110011011; reg signed [WP:0] weight_23 = 30'b100100101010001001001110110010; reg signed [WP:0] weight_24 = 30'b101101000010000100001010100110; 
reg signed [WP:0] weight_30 = 30'b011101001001100101001001110001; reg signed [WP:0] weight_31 = 30'b001010110111100010000101100110; reg signed [WP:0] weight_32 = 30'b001000000101110101001110011010; reg signed [WP:0] weight_33 = 30'b010001011101101000001010010010; reg signed [WP:0] weight_34 = 30'b101011000100000111100101000010; 
reg signed [WP:0] weight_40 = 30'b100010011100110011000100001001; reg signed [WP:0] weight_41 = 30'b000010010010010001111000001101; reg signed [WP:0] weight_42 = 30'b111100010001111110010111111001; reg signed [WP:0] weight_43 = 30'b101100010000011110011010010111; reg signed [WP:0] weight_44 = 30'b100110001011010001011010101110; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_13(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b001100101111100110100110111000; reg signed [WP:0] weight_01 = 30'b000101101001000111111000011010; reg signed [WP:0] weight_02 = 30'b010010011001011101111010001111; reg signed [WP:0] weight_03 = 30'b011010000111111011011010111011; reg signed [WP:0] weight_04 = 30'b011000011010011110101010100011; 
reg signed [WP:0] weight_10 = 30'b100100011000101000000001011010; reg signed [WP:0] weight_11 = 30'b111111101100001111001000111000; reg signed [WP:0] weight_12 = 30'b001111110100000101101010101011; reg signed [WP:0] weight_13 = 30'b001010101100000000111001100101; reg signed [WP:0] weight_14 = 30'b101100001110100001110011100010; 
reg signed [WP:0] weight_20 = 30'b111101111010010011001111000111; reg signed [WP:0] weight_21 = 30'b101010001111000011000101111010; reg signed [WP:0] weight_22 = 30'b011010001111110001101111110110; reg signed [WP:0] weight_23 = 30'b000001001001110001001100111001; reg signed [WP:0] weight_24 = 30'b011001101000010011011001011101; 
reg signed [WP:0] weight_30 = 30'b001101010001100010010110000011; reg signed [WP:0] weight_31 = 30'b111001000011010110001100111000; reg signed [WP:0] weight_32 = 30'b101001111000000000001011100001; reg signed [WP:0] weight_33 = 30'b111100100100000100011101100110; reg signed [WP:0] weight_34 = 30'b000011011001001101011001010010; 
reg signed [WP:0] weight_40 = 30'b100010101111101101010101110100; reg signed [WP:0] weight_41 = 30'b000011100110010010001010101101; reg signed [WP:0] weight_42 = 30'b001111011111011001100100000110; reg signed [WP:0] weight_43 = 30'b011000000000010010010100101100; reg signed [WP:0] weight_44 = 30'b010000111000011100001011111101; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_14(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b111010000110110100001001010110; reg signed [WP:0] weight_01 = 30'b001001010101110010001000110111; reg signed [WP:0] weight_02 = 30'b101110100001111101000100000010; reg signed [WP:0] weight_03 = 30'b000110111100000110001011000000; reg signed [WP:0] weight_04 = 30'b101111010101001001111001110010; 
reg signed [WP:0] weight_10 = 30'b001001100100110010011001101000; reg signed [WP:0] weight_11 = 30'b101100001010011000110111111001; reg signed [WP:0] weight_12 = 30'b011101010001111001111010011110; reg signed [WP:0] weight_13 = 30'b001111110011111110011100011110; reg signed [WP:0] weight_14 = 30'b110010001101011010011001110001; 
reg signed [WP:0] weight_20 = 30'b111011111110010011101000111100; reg signed [WP:0] weight_21 = 30'b101111100000010010101101111001; reg signed [WP:0] weight_22 = 30'b100100011111101000111111010101; reg signed [WP:0] weight_23 = 30'b011100000110001111011101001110; reg signed [WP:0] weight_24 = 30'b000101100011011001100011110001; 
reg signed [WP:0] weight_30 = 30'b111101010010101111001110101001; reg signed [WP:0] weight_31 = 30'b010101001110000001111110010101; reg signed [WP:0] weight_32 = 30'b001110010000110101111100010001; reg signed [WP:0] weight_33 = 30'b101110011100010001111010111001; reg signed [WP:0] weight_34 = 30'b011001110110000111100100011111; 
reg signed [WP:0] weight_40 = 30'b100111011101001100011110001000; reg signed [WP:0] weight_41 = 30'b100001001111111010001101101110; reg signed [WP:0] weight_42 = 30'b010011010111100111111010110101; reg signed [WP:0] weight_43 = 30'b010101010101110110001010101100; reg signed [WP:0] weight_44 = 30'b111100000111101000000100100011; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule
module conv1_15(
input clk,
input reset,
input signed [PP:0] pxl_in,
output signed [PP:0] conv_out,
output valid
);

parameter DIM = 32;	//Image columns/rows
parameter K = 5; 	//Kernel size

parameter WP = 30;
parameter PP = 8;
parameter CP = WP + PP;


wire signed [CP:0] wire_00; wire signed [CP:0] wire_01; wire signed [CP:0] wire_02; wire signed [CP:0] wire_03; wire signed [CP:0] wire_04;
wire signed [CP:0] wire_10; wire signed [CP:0] wire_11; wire signed [CP:0] wire_12; wire signed [CP:0] wire_13; wire signed [CP:0] wire_14;
wire signed [CP:0] wire_20; wire signed [CP:0] wire_21; wire signed [CP:0] wire_22; wire signed [CP:0] wire_23; wire signed [CP:0] wire_24;
wire signed [CP:0] wire_30; wire signed [CP:0] wire_31; wire signed [CP:0] wire_32; wire signed [CP:0] wire_33; wire signed [CP:0] wire_34;
wire signed [CP:0] wire_40; wire signed [CP:0] wire_41; wire signed [CP:0] wire_42; wire signed [CP:0] wire_43; wire signed [CP:0] wire_44;



reg signed [WP:0] weight_00 = 30'b010000010100000011011111010010; reg signed [WP:0] weight_01 = 30'b101110110100110100100110111000; reg signed [WP:0] weight_02 = 30'b010101001101110101011100100011; reg signed [WP:0] weight_03 = 30'b010011101000100001111101100011; reg signed [WP:0] weight_04 = 30'b111110010010110011010011110100; 
reg signed [WP:0] weight_10 = 30'b111110010010001101011010100101; reg signed [WP:0] weight_11 = 30'b111101010110111111010011000011; reg signed [WP:0] weight_12 = 30'b011011111000101111001101110100; reg signed [WP:0] weight_13 = 30'b000000010100000100111001001001; reg signed [WP:0] weight_14 = 30'b110110111100100010100111010010; 
reg signed [WP:0] weight_20 = 30'b100000100110110001011000011101; reg signed [WP:0] weight_21 = 30'b100111011011010100011101001110; reg signed [WP:0] weight_22 = 30'b010000101011011101001100011101; reg signed [WP:0] weight_23 = 30'b000011000010001011011100011111; reg signed [WP:0] weight_24 = 30'b111000001011101001000100000011; 
reg signed [WP:0] weight_30 = 30'b001001000101010100100101000111; reg signed [WP:0] weight_31 = 30'b000000011000000101010111010001; reg signed [WP:0] weight_32 = 30'b111111110111110110010011110000; reg signed [WP:0] weight_33 = 30'b001011010000000111010100000010; reg signed [WP:0] weight_34 = 30'b100011101101000010101110011101; 
reg signed [WP:0] weight_40 = 30'b001100000011110011010010101111; reg signed [WP:0] weight_41 = 30'b101010111010000111100101000111; reg signed [WP:0] weight_42 = 30'b011101011010111111111000010001; reg signed [WP:0] weight_43 = 30'b000101011000011100110110100100; reg signed [WP:0] weight_44 = 30'b100001000111110101011000011011; 



wire signed [CP:0] reg_00; wire signed [CP:0] reg_01; wire signed [CP:0] reg_02; wire signed [CP:0] reg_03; wire signed [CP:0] reg_04;  wire signed [CP:0] sr_0;
wire signed [CP:0] reg_10; wire signed [CP:0] reg_11; wire signed [CP:0] reg_12; wire signed [CP:0] reg_13; wire signed [CP:0] reg_14;  wire signed [CP:0] sr_1;
wire signed [CP:0] reg_20; wire signed [CP:0] reg_21; wire signed [CP:0] reg_22; wire signed [CP:0] reg_23; wire signed [CP:0] reg_24;  wire signed [CP:0] sr_2;
wire signed [CP:0] reg_30; wire signed [CP:0] reg_31; wire signed [CP:0] reg_32; wire signed [CP:0] reg_33; wire signed [CP:0] reg_34;  wire signed [CP:0] sr_3;
wire signed [CP:0] reg_40; wire signed [CP:0] reg_41; wire signed [CP:0] reg_42; wire signed [CP:0] reg_43; wire signed [CP:0] reg_44;

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


reg signed [5:0] row = -1;
reg signed [5:0] col = 0;

always @(posedge clk) begin
if (row < DIM-1) begin
row <= row + 1;
end else begin
row <= 0;
col <= col < DIM-1 ? col + 1 : 0;
end
end
assign valid = (row >= K-1) && (col >= K-1);

endmodule