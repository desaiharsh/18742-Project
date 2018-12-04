module layer_1(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv_out;
  wire conv_valid;
  conv CONV(
    .clk (clk),
    .reset (reset),
    .pxl_in (pxl_in),
    .conv_out (conv_out),
    .valid (conv_valid)
  );

  wire pool_clk;
  assign pool_clk = clk && conv_valid;
  wire pool_valid;

  reg signed [5:0] row = -2;
  always @ (posedge clk) begin
    row <= row < 32-1 ? row + 1 : 0;
  end

  max_pool MAX_POOL(
    .clk (pool_clk),
    .reset (reset),
    .pxl_in (conv_out),
    .pool_out (pool_out),
    .valid (pool_valid)
  );

  assign valid = pool_valid && (row >= 5-1);



endmodule // layer_1
