
module conv_0(
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



reg signed [WP:0] weight_00 = 30'b000011010111100001010101001110; reg signed [WP:0] weight_01 = 30'b001100100100100101101100001101; reg signed [WP:0] weight_02 = 30'b101000001110010101010111000010; reg signed [WP:0] weight_03 = 30'b101110101101010110101001111100; reg signed [WP:0] weight_04 = 30'b110011111001101000011111001011; 
reg signed [WP:0] weight_10 = 30'b110111000111010011011000000001; reg signed [WP:0] weight_11 = 30'b000001101011100110101001110111; reg signed [WP:0] weight_12 = 30'b010000100111010011000100000001; reg signed [WP:0] weight_13 = 30'b001000010111001010111011011110; reg signed [WP:0] weight_14 = 30'b110101101111111001010110110111; 
reg signed [WP:0] weight_20 = 30'b111110101101011111100100100101; reg signed [WP:0] weight_21 = 30'b110100111011010010111110111111; reg signed [WP:0] weight_22 = 30'b111100111110110011111000100100; reg signed [WP:0] weight_23 = 30'b000001001100110111111110001000; reg signed [WP:0] weight_24 = 30'b101110001100111100011001011110; 
reg signed [WP:0] weight_30 = 30'b100110010110010011110110011011; reg signed [WP:0] weight_31 = 30'b101101111110001100111010111010; reg signed [WP:0] weight_32 = 30'b100000111101011001000001011110; reg signed [WP:0] weight_33 = 30'b111101010001101010000000001010; reg signed [WP:0] weight_34 = 30'b111100111101001011000100011011; 
reg signed [WP:0] weight_40 = 30'b101001100110101100001111110000; reg signed [WP:0] weight_41 = 30'b001000000000100100000011001011; reg signed [WP:0] weight_42 = 30'b110101010011100001000111110011; reg signed [WP:0] weight_43 = 30'b011000001000000010011111001010; reg signed [WP:0] weight_44 = 30'b000010000111101000011011110111; 



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
module conv_1(
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



reg signed [WP:0] weight_00 = 30'b010011000110101011101011001001; reg signed [WP:0] weight_01 = 30'b111000100001101010100100110000; reg signed [WP:0] weight_02 = 30'b111001110101100000101111011100; reg signed [WP:0] weight_03 = 30'b111011010010010101101001101111; reg signed [WP:0] weight_04 = 30'b001011000110110000111110001111; 
reg signed [WP:0] weight_10 = 30'b111110111110011001110100100100; reg signed [WP:0] weight_11 = 30'b111100110110001110111000011000; reg signed [WP:0] weight_12 = 30'b110000100100011101001111011001; reg signed [WP:0] weight_13 = 30'b010111101111010100011100111100; reg signed [WP:0] weight_14 = 30'b010111000100010111101001111000; 
reg signed [WP:0] weight_20 = 30'b110000011001100101011100001101; reg signed [WP:0] weight_21 = 30'b101000001000001000100001011111; reg signed [WP:0] weight_22 = 30'b100110100101001000010100100110; reg signed [WP:0] weight_23 = 30'b111010000111010101010000001101; reg signed [WP:0] weight_24 = 30'b000110011011110010001011011100; 
reg signed [WP:0] weight_30 = 30'b000001101100011000001011110101; reg signed [WP:0] weight_31 = 30'b010001110101101001010001000011; reg signed [WP:0] weight_32 = 30'b100001011100111000101001101101; reg signed [WP:0] weight_33 = 30'b011101100100001101101111100100; reg signed [WP:0] weight_34 = 30'b110000101111100110011010011111; 
reg signed [WP:0] weight_40 = 30'b111010000111110010010110111010; reg signed [WP:0] weight_41 = 30'b110101011011110001110111000111; reg signed [WP:0] weight_42 = 30'b100000110110101000111111001001; reg signed [WP:0] weight_43 = 30'b010001111111011101111111000111; reg signed [WP:0] weight_44 = 30'b001001101000001110111010110111; 



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
module conv_2(
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



reg signed [WP:0] weight_00 = 30'b011100100111000100111100100011; reg signed [WP:0] weight_01 = 30'b010001000111111000001000100110; reg signed [WP:0] weight_02 = 30'b110010110011001001111001101010; reg signed [WP:0] weight_03 = 30'b100101100111110000010011000100; reg signed [WP:0] weight_04 = 30'b110101001011111110001100011110; 
reg signed [WP:0] weight_10 = 30'b001101011111111101111110010011; reg signed [WP:0] weight_11 = 30'b111101001001000101111000110001; reg signed [WP:0] weight_12 = 30'b010010110011000110000101111011; reg signed [WP:0] weight_13 = 30'b001110001110011000010100111110; reg signed [WP:0] weight_14 = 30'b111100101011001111001101001011; 
reg signed [WP:0] weight_20 = 30'b010110010011011010111010000111; reg signed [WP:0] weight_21 = 30'b010100101011001100001001011000; reg signed [WP:0] weight_22 = 30'b001111000001001001101000111011; reg signed [WP:0] weight_23 = 30'b000010010110110010000111001000; reg signed [WP:0] weight_24 = 30'b011111111010111001000011111101; 
reg signed [WP:0] weight_30 = 30'b000011101100001001001111010111; reg signed [WP:0] weight_31 = 30'b000100110001110010111011100110; reg signed [WP:0] weight_32 = 30'b010111111000110011111110100110; reg signed [WP:0] weight_33 = 30'b001100111011001010101100111100; reg signed [WP:0] weight_34 = 30'b101111101111011100011000101000; 
reg signed [WP:0] weight_40 = 30'b101110000111001011000011010001; reg signed [WP:0] weight_41 = 30'b100110100111111110001111001001; reg signed [WP:0] weight_42 = 30'b010101010001101001000011000001; reg signed [WP:0] weight_43 = 30'b001101110111010111000000110101; reg signed [WP:0] weight_44 = 30'b010011111001100001001001101111; 



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
module conv_3(
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



reg signed [WP:0] weight_00 = 30'b010010111010000101111110001100; reg signed [WP:0] weight_01 = 30'b111101010101100100101001001110; reg signed [WP:0] weight_02 = 30'b010101111110011010110011101001; reg signed [WP:0] weight_03 = 30'b010111110010110001001101110001; reg signed [WP:0] weight_04 = 30'b101001000110100100010011100100; 
reg signed [WP:0] weight_10 = 30'b000110010101011011001001110000; reg signed [WP:0] weight_11 = 30'b001101111010111000110001001100; reg signed [WP:0] weight_12 = 30'b100000100001111011110111001110; reg signed [WP:0] weight_13 = 30'b100001111001011101000110100100; reg signed [WP:0] weight_14 = 30'b100101010110001001010011111111; 
reg signed [WP:0] weight_20 = 30'b001100101100101010111111011010; reg signed [WP:0] weight_21 = 30'b100111010011000011010101011000; reg signed [WP:0] weight_22 = 30'b001010100011101100101100010101; reg signed [WP:0] weight_23 = 30'b000010110111101011000111011110; reg signed [WP:0] weight_24 = 30'b110111110010100100011001001010; 
reg signed [WP:0] weight_30 = 30'b001100111110011101100010111011; reg signed [WP:0] weight_31 = 30'b110011101101110001001000011010; reg signed [WP:0] weight_32 = 30'b010101011111000000001001011111; reg signed [WP:0] weight_33 = 30'b000101000100001001100100010010; reg signed [WP:0] weight_34 = 30'b110011001101010110101110100001; 
reg signed [WP:0] weight_40 = 30'b110001010101001000100101001001; reg signed [WP:0] weight_41 = 30'b111111000101010010001110110011; reg signed [WP:0] weight_42 = 30'b100110010000011101000111111011; reg signed [WP:0] weight_43 = 30'b110101111111001111100011101111; reg signed [WP:0] weight_44 = 30'b110100111101001010110010111101; 



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
module conv_4(
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



reg signed [WP:0] weight_00 = 30'b000100010011011001100010011101; reg signed [WP:0] weight_01 = 30'b110010011101001110110100011100; reg signed [WP:0] weight_02 = 30'b100100011001010111000111100101; reg signed [WP:0] weight_03 = 30'b000011110101000000111011100011; reg signed [WP:0] weight_04 = 30'b110101011001001100101111110101; 
reg signed [WP:0] weight_10 = 30'b010010111110001011111100100100; reg signed [WP:0] weight_11 = 30'b001111011001001001001001011111; reg signed [WP:0] weight_12 = 30'b100011110010001001111000111010; reg signed [WP:0] weight_13 = 30'b011111100100000111100110011010; reg signed [WP:0] weight_14 = 30'b001100001101110100000010100000; 
reg signed [WP:0] weight_20 = 30'b011000000011110000110110011100; reg signed [WP:0] weight_21 = 30'b001011100100110110001100000100; reg signed [WP:0] weight_22 = 30'b010111100111000011101101111000; reg signed [WP:0] weight_23 = 30'b001100001011000000101001011110; reg signed [WP:0] weight_24 = 30'b010100111001100111000011110011; 
reg signed [WP:0] weight_30 = 30'b011000000111011011011110101111; reg signed [WP:0] weight_31 = 30'b111011101110110001000110100110; reg signed [WP:0] weight_32 = 30'b001011010101010100110011101000; reg signed [WP:0] weight_33 = 30'b011101010100110111000110011101; reg signed [WP:0] weight_34 = 30'b000110111011111100100111011100; 
reg signed [WP:0] weight_40 = 30'b000000011111101110001010111001; reg signed [WP:0] weight_41 = 30'b110011111110100011011110110111; reg signed [WP:0] weight_42 = 30'b010110101101111010111011100101; reg signed [WP:0] weight_43 = 30'b010001110100010000011001111111; reg signed [WP:0] weight_44 = 30'b011001010111011001101010000100; 



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
module conv_5(
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



reg signed [WP:0] weight_00 = 30'b010011011100111111001001000100; reg signed [WP:0] weight_01 = 30'b101100001011111100001111000011; reg signed [WP:0] weight_02 = 30'b010110110011111000001100001000; reg signed [WP:0] weight_03 = 30'b100000010100100001100001010001; reg signed [WP:0] weight_04 = 30'b110101011101000010001100001100; 
reg signed [WP:0] weight_10 = 30'b010011000111100011100000011101; reg signed [WP:0] weight_11 = 30'b110000001101011010001101000000; reg signed [WP:0] weight_12 = 30'b101100110100110011001110010110; reg signed [WP:0] weight_13 = 30'b001100011011000101110001000110; reg signed [WP:0] weight_14 = 30'b010010100100001010101100110011; 
reg signed [WP:0] weight_20 = 30'b110100011010101000110010010010; reg signed [WP:0] weight_21 = 30'b100011001111101110111001000011; reg signed [WP:0] weight_22 = 30'b111100010011000111011000000000; reg signed [WP:0] weight_23 = 30'b100110101010001100100000110110; reg signed [WP:0] weight_24 = 30'b111010101000100111100011101011; 
reg signed [WP:0] weight_30 = 30'b101010010100100110100101000010; reg signed [WP:0] weight_31 = 30'b110010101000011110110000100000; reg signed [WP:0] weight_32 = 30'b011110101111111010000000011110; reg signed [WP:0] weight_33 = 30'b100101000111100011010011010101; reg signed [WP:0] weight_34 = 30'b111110110111011110111111110111; 
reg signed [WP:0] weight_40 = 30'b110110111010000110100110111100; reg signed [WP:0] weight_41 = 30'b000000000011001011110111111100; reg signed [WP:0] weight_42 = 30'b100101000000000000110000111100; reg signed [WP:0] weight_43 = 30'b101010011110001101010110010110; reg signed [WP:0] weight_44 = 30'b011011000010000101100000100010; 



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