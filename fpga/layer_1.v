module layer_1(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  parameter WEIGHT_00 = 0, WEIGHT_01 = 0, WEIGHT_02 = 0, WEIGHT_03 = 0, WEIGHT_04 = 0;
  parameter WEIGHT_10 = 0, WEIGHT_11 = 0, WEIGHT_12 = 0, WEIGHT_13 = 0, WEIGHT_14 = 0;
  parameter WEIGHT_20 = 0, WEIGHT_21 = 0, WEIGHT_22 = 0, WEIGHT_23 = 0, WEIGHT_24 = 0;
  parameter WEIGHT_30 = 0, WEIGHT_31 = 0, WEIGHT_32 = 0, WEIGHT_33 = 0, WEIGHT_34 = 0;
  parameter WEIGHT_40 = 0, WEIGHT_41 = 0, WEIGHT_42 = 0, WEIGHT_43 = 0, WEIGHT_44 = 0;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv0_out;
  wire conv0_valid;
  conv #(
    .WEIGHT_00(WEIGHT_00), .WEIGHT_01(WEIGHT_01), .WEIGHT_02(WEIGHT_02), .WEIGHT_03(WEIGHT_03), .WEIGHT_04(WEIGHT_04),
    .WEIGHT_10(WEIGHT_10), .WEIGHT_11(WEIGHT_11), .WEIGHT_12(WEIGHT_12), .WEIGHT_13(WEIGHT_13), .WEIGHT_14(WEIGHT_14),
    .WEIGHT_20(WEIGHT_20), .WEIGHT_21(WEIGHT_21), .WEIGHT_22(WEIGHT_22), .WEIGHT_23(WEIGHT_23), .WEIGHT_24(WEIGHT_24),
    .WEIGHT_30(WEIGHT_30), .WEIGHT_31(WEIGHT_31), .WEIGHT_32(WEIGHT_32), .WEIGHT_33(WEIGHT_33), .WEIGHT_34(WEIGHT_34),
    .WEIGHT_40(WEIGHT_40), .WEIGHT_41(WEIGHT_41), .WEIGHT_42(WEIGHT_42), .WEIGHT_43(WEIGHT_43), .WEIGHT_44(WEIGHT_44)
  ) CONV(
  .clk (clk),
  .reset (reset),
  .pxl_in (pxl_in),
  .conv_out (conv0_out),
  // .conv_out (pool_out),
  // .valid (valid)
  .valid (conv0_valid)
  );

  wire pool0_clk;
  assign pool0_clk = clk && conv0_valid;
  // wire pool0_valid;
  // wire signed [PP:0] pool0_out;

  reg signed [5:0] pool0_row = -2;
  always @ (posedge clk) begin
    pool0_row <= pool0_row < 32-1 ? pool0_row + 1 : 0;
  end

  wire pool0_valid;
  max_pool MAX_POOL(
    .clk (pool0_clk),
    .reset (reset),
    .pxl_in (conv0_out),
    .pool_out (pool_out),
    .valid (pool0_valid)
  );
 assign valid = pool0_valid && (pool0_row >= 5-1);

endmodule // layer_1
