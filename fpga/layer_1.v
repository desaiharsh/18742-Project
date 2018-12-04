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
  wire signed [PP:0] conv0_out;
  wire conv0_valid;
  conv CONV(
    .clk (clk),
    .reset (reset),
    .pxl_in (pxl_in),
    .conv_out (conv0_out),
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
