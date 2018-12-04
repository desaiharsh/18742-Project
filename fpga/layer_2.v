
module layer_2_0(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_0_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_0_out;
  wire conv1_0_valid;
  conv1_0 #(.DIM(14)) CONV1_0(clk, reset, pxl_in, conv1_0_out, conv1_0_valid);

  wire pool1_0_clk;
  assign pool1_0_clk = clk && conv1_0_valid;
  wire pool1_0_valid;
  wire signed [PP:0] pool1_0_out;

  reg signed [5:0] pool1_0_row = -2;
  always @ (posedge clk) begin
    pool1_0_row <= pool1_0_row < 32-1 ? pool1_0_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_0_clk, reset, conv1_0_out, pool1_0_out, pool1_0_valid);

  wire pool1_0_out_clk;
  assign pool1_0_out_clk = pool1_0_clk && pool1_0_valid && (pool1_0_row >= 5-1);
  wire signed [PP:0] conv2_0_out;
endmodule // layer_1

module layer_2_1(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_1_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_1_out;
  wire conv1_1_valid;
  conv1_1 #(.DIM(14)) CONV1_1(clk, reset, pxl_in, conv1_1_out, conv1_1_valid);

  wire pool1_1_clk;
  assign pool1_1_clk = clk && conv1_1_valid;
  wire pool1_1_valid;
  wire signed [PP:0] pool1_1_out;

  reg signed [5:0] pool1_1_row = -2;
  always @ (posedge clk) begin
    pool1_1_row <= pool1_1_row < 32-1 ? pool1_1_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_1_clk, reset, conv1_1_out, pool1_1_out, pool1_1_valid);

  wire pool1_1_out_clk;
  assign pool1_1_out_clk = pool1_1_clk && pool1_1_valid && (pool1_1_row >= 5-1);
  wire signed [PP:0] conv2_1_out;
endmodule // layer_1

module layer_2_2(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_2_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_2_out;
  wire conv1_2_valid;
  conv1_2 #(.DIM(14)) CONV1_2(clk, reset, pxl_in, conv1_2_out, conv1_2_valid);

  wire pool1_2_clk;
  assign pool1_2_clk = clk && conv1_2_valid;
  wire pool1_2_valid;
  wire signed [PP:0] pool1_2_out;

  reg signed [5:0] pool1_2_row = -2;
  always @ (posedge clk) begin
    pool1_2_row <= pool1_2_row < 32-1 ? pool1_2_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_2_clk, reset, conv1_2_out, pool1_2_out, pool1_2_valid);

  wire pool1_2_out_clk;
  assign pool1_2_out_clk = pool1_2_clk && pool1_2_valid && (pool1_2_row >= 5-1);
  wire signed [PP:0] conv2_2_out;
endmodule // layer_1

module layer_2_3(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_3_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_3_out;
  wire conv1_3_valid;
  conv1_3 #(.DIM(14)) CONV1_3(clk, reset, pxl_in, conv1_3_out, conv1_3_valid);

  wire pool1_3_clk;
  assign pool1_3_clk = clk && conv1_3_valid;
  wire pool1_3_valid;
  wire signed [PP:0] pool1_3_out;

  reg signed [5:0] pool1_3_row = -2;
  always @ (posedge clk) begin
    pool1_3_row <= pool1_3_row < 32-1 ? pool1_3_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_3_clk, reset, conv1_3_out, pool1_3_out, pool1_3_valid);

  wire pool1_3_out_clk;
  assign pool1_3_out_clk = pool1_3_clk && pool1_3_valid && (pool1_3_row >= 5-1);
  wire signed [PP:0] conv2_3_out;
endmodule // layer_1

module layer_2_4(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_4_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_4_out;
  wire conv1_4_valid;
  conv1_4 #(.DIM(14)) CONV1_4(clk, reset, pxl_in, conv1_4_out, conv1_4_valid);

  wire pool1_4_clk;
  assign pool1_4_clk = clk && conv1_4_valid;
  wire pool1_4_valid;
  wire signed [PP:0] pool1_4_out;

  reg signed [5:0] pool1_4_row = -2;
  always @ (posedge clk) begin
    pool1_4_row <= pool1_4_row < 32-1 ? pool1_4_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_4_clk, reset, conv1_4_out, pool1_4_out, pool1_4_valid);

  wire pool1_4_out_clk;
  assign pool1_4_out_clk = pool1_4_clk && pool1_4_valid && (pool1_4_row >= 5-1);
  wire signed [PP:0] conv2_4_out;
endmodule // layer_1

module layer_2_5(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_5_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_5_out;
  wire conv1_5_valid;
  conv1_5 #(.DIM(14)) CONV1_5(clk, reset, pxl_in, conv1_5_out, conv1_5_valid);

  wire pool1_5_clk;
  assign pool1_5_clk = clk && conv1_5_valid;
  wire pool1_5_valid;
  wire signed [PP:0] pool1_5_out;

  reg signed [5:0] pool1_5_row = -2;
  always @ (posedge clk) begin
    pool1_5_row <= pool1_5_row < 32-1 ? pool1_5_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_5_clk, reset, conv1_5_out, pool1_5_out, pool1_5_valid);

  wire pool1_5_out_clk;
  assign pool1_5_out_clk = pool1_5_clk && pool1_5_valid && (pool1_5_row >= 5-1);
  wire signed [PP:0] conv2_5_out;
endmodule // layer_1

module layer_2_6(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_6_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_6_out;
  wire conv1_6_valid;
  conv1_6 #(.DIM(14)) CONV1_6(clk, reset, pxl_in, conv1_6_out, conv1_6_valid);

  wire pool1_6_clk;
  assign pool1_6_clk = clk && conv1_6_valid;
  wire pool1_6_valid;
  wire signed [PP:0] pool1_6_out;

  reg signed [5:0] pool1_6_row = -2;
  always @ (posedge clk) begin
    pool1_6_row <= pool1_6_row < 32-1 ? pool1_6_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_6_clk, reset, conv1_6_out, pool1_6_out, pool1_6_valid);

  wire pool1_6_out_clk;
  assign pool1_6_out_clk = pool1_6_clk && pool1_6_valid && (pool1_6_row >= 5-1);
  wire signed [PP:0] conv2_6_out;
endmodule // layer_1

module layer_2_7(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_7_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_7_out;
  wire conv1_7_valid;
  conv1_7 #(.DIM(14)) CONV1_7(clk, reset, pxl_in, conv1_7_out, conv1_7_valid);

  wire pool1_7_clk;
  assign pool1_7_clk = clk && conv1_7_valid;
  wire pool1_7_valid;
  wire signed [PP:0] pool1_7_out;

  reg signed [5:0] pool1_7_row = -2;
  always @ (posedge clk) begin
    pool1_7_row <= pool1_7_row < 32-1 ? pool1_7_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_7_clk, reset, conv1_7_out, pool1_7_out, pool1_7_valid);

  wire pool1_7_out_clk;
  assign pool1_7_out_clk = pool1_7_clk && pool1_7_valid && (pool1_7_row >= 5-1);
  wire signed [PP:0] conv2_7_out;
endmodule // layer_1

module layer_2_8(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_8_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_8_out;
  wire conv1_8_valid;
  conv1_8 #(.DIM(14)) CONV1_8(clk, reset, pxl_in, conv1_8_out, conv1_8_valid);

  wire pool1_8_clk;
  assign pool1_8_clk = clk && conv1_8_valid;
  wire pool1_8_valid;
  wire signed [PP:0] pool1_8_out;

  reg signed [5:0] pool1_8_row = -2;
  always @ (posedge clk) begin
    pool1_8_row <= pool1_8_row < 32-1 ? pool1_8_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_8_clk, reset, conv1_8_out, pool1_8_out, pool1_8_valid);

  wire pool1_8_out_clk;
  assign pool1_8_out_clk = pool1_8_clk && pool1_8_valid && (pool1_8_row >= 5-1);
  wire signed [PP:0] conv2_8_out;
endmodule // layer_1

module layer_2_9(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_9_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_9_out;
  wire conv1_9_valid;
  conv1_9 #(.DIM(14)) CONV1_9(clk, reset, pxl_in, conv1_9_out, conv1_9_valid);

  wire pool1_9_clk;
  assign pool1_9_clk = clk && conv1_9_valid;
  wire pool1_9_valid;
  wire signed [PP:0] pool1_9_out;

  reg signed [5:0] pool1_9_row = -2;
  always @ (posedge clk) begin
    pool1_9_row <= pool1_9_row < 32-1 ? pool1_9_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_9_clk, reset, conv1_9_out, pool1_9_out, pool1_9_valid);

  wire pool1_9_out_clk;
  assign pool1_9_out_clk = pool1_9_clk && pool1_9_valid && (pool1_9_row >= 5-1);
  wire signed [PP:0] conv2_9_out;
endmodule // layer_1

module layer_2_10(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_10_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_10_out;
  wire conv1_10_valid;
  conv1_10 #(.DIM(14)) CONV1_10(clk, reset, pxl_in, conv1_10_out, conv1_10_valid);

  wire pool1_10_clk;
  assign pool1_10_clk = clk && conv1_10_valid;
  wire pool1_10_valid;
  wire signed [PP:0] pool1_10_out;

  reg signed [5:0] pool1_10_row = -2;
  always @ (posedge clk) begin
    pool1_10_row <= pool1_10_row < 32-1 ? pool1_10_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_10_clk, reset, conv1_10_out, pool1_10_out, pool1_10_valid);

  wire pool1_10_out_clk;
  assign pool1_10_out_clk = pool1_10_clk && pool1_10_valid && (pool1_10_row >= 5-1);
  wire signed [PP:0] conv2_10_out;
endmodule // layer_1

module layer_2_11(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_11_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_11_out;
  wire conv1_11_valid;
  conv1_11 #(.DIM(14)) CONV1_11(clk, reset, pxl_in, conv1_11_out, conv1_11_valid);

  wire pool1_11_clk;
  assign pool1_11_clk = clk && conv1_11_valid;
  wire pool1_11_valid;
  wire signed [PP:0] pool1_11_out;

  reg signed [5:0] pool1_11_row = -2;
  always @ (posedge clk) begin
    pool1_11_row <= pool1_11_row < 32-1 ? pool1_11_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_11_clk, reset, conv1_11_out, pool1_11_out, pool1_11_valid);

  wire pool1_11_out_clk;
  assign pool1_11_out_clk = pool1_11_clk && pool1_11_valid && (pool1_11_row >= 5-1);
  wire signed [PP:0] conv2_11_out;
endmodule // layer_1

module layer_2_12(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_12_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_12_out;
  wire conv1_12_valid;
  conv1_12 #(.DIM(14)) CONV1_12(clk, reset, pxl_in, conv1_12_out, conv1_12_valid);

  wire pool1_12_clk;
  assign pool1_12_clk = clk && conv1_12_valid;
  wire pool1_12_valid;
  wire signed [PP:0] pool1_12_out;

  reg signed [5:0] pool1_12_row = -2;
  always @ (posedge clk) begin
    pool1_12_row <= pool1_12_row < 32-1 ? pool1_12_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_12_clk, reset, conv1_12_out, pool1_12_out, pool1_12_valid);

  wire pool1_12_out_clk;
  assign pool1_12_out_clk = pool1_12_clk && pool1_12_valid && (pool1_12_row >= 5-1);
  wire signed [PP:0] conv2_12_out;
endmodule // layer_1

module layer_2_13(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_13_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_13_out;
  wire conv1_13_valid;
  conv1_13 #(.DIM(14)) CONV1_13(clk, reset, pxl_in, conv1_13_out, conv1_13_valid);

  wire pool1_13_clk;
  assign pool1_13_clk = clk && conv1_13_valid;
  wire pool1_13_valid;
  wire signed [PP:0] pool1_13_out;

  reg signed [5:0] pool1_13_row = -2;
  always @ (posedge clk) begin
    pool1_13_row <= pool1_13_row < 32-1 ? pool1_13_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_13_clk, reset, conv1_13_out, pool1_13_out, pool1_13_valid);

  wire pool1_13_out_clk;
  assign pool1_13_out_clk = pool1_13_clk && pool1_13_valid && (pool1_13_row >= 5-1);
  wire signed [PP:0] conv2_13_out;
endmodule // layer_1

module layer_2_14(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_14_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_14_out;
  wire conv1_14_valid;
  conv1_14 #(.DIM(14)) CONV1_14(clk, reset, pxl_in, conv1_14_out, conv1_14_valid);

  wire pool1_14_clk;
  assign pool1_14_clk = clk && conv1_14_valid;
  wire pool1_14_valid;
  wire signed [PP:0] pool1_14_out;

  reg signed [5:0] pool1_14_row = -2;
  always @ (posedge clk) begin
    pool1_14_row <= pool1_14_row < 32-1 ? pool1_14_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_14_clk, reset, conv1_14_out, pool1_14_out, pool1_14_valid);

  wire pool1_14_out_clk;
  assign pool1_14_out_clk = pool1_14_clk && pool1_14_valid && (pool1_14_row >= 5-1);
  wire signed [PP:0] conv2_14_out;
endmodule // layer_1

module layer_2_15(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_15_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_15_out;
  wire conv1_15_valid;
  conv1_15 #(.DIM(14)) CONV1_15(clk, reset, pxl_in, conv1_15_out, conv1_15_valid);

  wire pool1_15_clk;
  assign pool1_15_clk = clk && conv1_15_valid;
  wire pool1_15_valid;
  wire signed [PP:0] pool1_15_out;

  reg signed [5:0] pool1_15_row = -2;
  always @ (posedge clk) begin
    pool1_15_row <= pool1_15_row < 32-1 ? pool1_15_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_15_clk, reset, conv1_15_out, pool1_15_out, pool1_15_valid);

  wire pool1_15_out_clk;
  assign pool1_15_out_clk = pool1_15_clk && pool1_15_valid && (pool1_15_row >= 5-1);
  wire signed [PP:0] conv2_15_out;
endmodule // layer_1
