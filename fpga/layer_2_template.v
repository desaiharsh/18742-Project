module layer_2(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_0_0_out;
  wire conv1_0_0_valid;
  conv1_0_0 #(.DIM(14)) CONV1_0_0(clk,reset, pxl_in, conv1_0_0_out, conv1_0_0_valid);

  wire pool1_0_0_clk;
  assign pool1_0_0_clk = clk && conv1_0_0_valid;
  wire pool1_0_0_valid;
  wire signed [PP:0] pool1_0_0_out;

  reg signed [5:0] pool1_0_0_row = -2;
  always @ (posedge clk) begin
    pool1_0_0_row <= pool1_0_0_row < 32-1 ? pool1_0_0_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_0_0_clk, reset, conv1_0_0_out, pool1_0_0_out, pool1_0_0_valid);

  wire pool1_0_0_out_clk;
  assign pool1_0_0_out_clk = pool1_0_0_clk && pool1_0_0_valid && (pool1_0_0_row >= 5-1);
  wire signed [PP:0] conv2_0_0_out;

endmodule // layer_1
