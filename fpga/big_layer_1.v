module layer_1_0(
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
  conv_0 CONV(
    .clk (clk),
    .reset (reset),
    .pxl_in (pxl_in),
    .conv_out (conv_out),
    .valid (conv_valid)
  );

  // TODO: need to do valid checking for the output here?

  wire pool_clk;
  assign pool_clk = clk && conv_valid;
  // assign pool_clk = clk && row >= 5-1;
  // TODO: register between these two to pipeline?

  wire pool_valid;
  // this reg stops the last valid pool value from echoing for the next
  // few invalid convolution values.

  reg signed [5:0] row = -2;

  always @ (posedge clk) begin
    // row <= row + 1;
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
  // assign valid = pool_valid;
  // assign valid = (row >= 5-1);
  // assign valid = conv_valid && (row >= 5-1);
  // assign valid = conv_valid;

  // assign pool_out = conv_out;

endmodule // layer_1
module layer_1_1(
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
  conv_1 CONV(
    .clk (clk),
    .reset (reset),
    .pxl_in (pxl_in),
    .conv_out (conv_out),
    .valid (conv_valid)
  );

  // TODO: need to do valid checking for the output here?

  wire pool_clk;
  assign pool_clk = clk && conv_valid;
  // assign pool_clk = clk && row >= 5-1;
  // TODO: register between these two to pipeline?

  wire pool_valid;
  // this reg stops the last valid pool value from echoing for the next
  // few invalid convolution values.

  reg signed [5:0] row = -2;

  always @ (posedge clk) begin
    // row <= row + 1;
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
  // assign valid = pool_valid;
  // assign valid = (row >= 5-1);
  // assign valid = conv_valid && (row >= 5-1);
  // assign valid = conv_valid;

  // assign pool_out = conv_out;

endmodule // layer_1
module layer_1_2(
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
  conv_2 CONV(
    .clk (clk),
    .reset (reset),
    .pxl_in (pxl_in),
    .conv_out (conv_out),
    .valid (conv_valid)
  );

  // TODO: need to do valid checking for the output here?

  wire pool_clk;
  assign pool_clk = clk && conv_valid;
  // assign pool_clk = clk && row >= 5-1;
  // TODO: register between these two to pipeline?

  wire pool_valid;
  // this reg stops the last valid pool value from echoing for the next
  // few invalid convolution values.

  reg signed [5:0] row = -2;

  always @ (posedge clk) begin
    // row <= row + 1;
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
  // assign valid = pool_valid;
  // assign valid = (row >= 5-1);
  // assign valid = conv_valid && (row >= 5-1);
  // assign valid = conv_valid;

  // assign pool_out = conv_out;

endmodule // layer_1
module layer_1_3(
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
  conv_3 CONV(
    .clk (clk),
    .reset (reset),
    .pxl_in (pxl_in),
    .conv_out (conv_out),
    .valid (conv_valid)
  );

  // TODO: need to do valid checking for the output here?

  wire pool_clk;
  assign pool_clk = clk && conv_valid;
  // assign pool_clk = clk && row >= 5-1;
  // TODO: register between these two to pipeline?

  wire pool_valid;
  // this reg stops the last valid pool value from echoing for the next
  // few invalid convolution values.

  reg signed [5:0] row = -2;

  always @ (posedge clk) begin
    // row <= row + 1;
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
  // assign valid = pool_valid;
  // assign valid = (row >= 5-1);
  // assign valid = conv_valid && (row >= 5-1);
  // assign valid = conv_valid;

  // assign pool_out = conv_out;

endmodule // layer_1
module layer_1_4(
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
  conv_4 CONV(
    .clk (clk),
    .reset (reset),
    .pxl_in (pxl_in),
    .conv_out (conv_out),
    .valid (conv_valid)
  );

  // TODO: need to do valid checking for the output here?

  wire pool_clk;
  assign pool_clk = clk && conv_valid;
  // assign pool_clk = clk && row >= 5-1;
  // TODO: register between these two to pipeline?

  wire pool_valid;
  // this reg stops the last valid pool value from echoing for the next
  // few invalid convolution values.

  reg signed [5:0] row = -2;

  always @ (posedge clk) begin
    // row <= row + 1;
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
  // assign valid = pool_valid;
  // assign valid = (row >= 5-1);
  // assign valid = conv_valid && (row >= 5-1);
  // assign valid = conv_valid;

  // assign pool_out = conv_out;

endmodule // layer_1
module layer_1_5(
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
  conv_5 CONV(
    .clk (clk),
    .reset (reset),
    .pxl_in (pxl_in),
    .conv_out (conv_out),
    .valid (conv_valid)
  );

  // TODO: need to do valid checking for the output here?

  wire pool_clk;
  assign pool_clk = clk && conv_valid;
  // assign pool_clk = clk && row >= 5-1;
  // TODO: register between these two to pipeline?

  wire pool_valid;
  // this reg stops the last valid pool value from echoing for the next
  // few invalid convolution values.

  reg signed [5:0] row = -2;

  always @ (posedge clk) begin
    // row <= row + 1;
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
  // assign valid = pool_valid;
  // assign valid = (row >= 5-1);
  // assign valid = conv_valid && (row >= 5-1);
  // assign valid = conv_valid;

  // assign pool_out = conv_out;

endmodule // layer_1
