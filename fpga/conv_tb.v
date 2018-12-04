// Code your testbench here
// or browse Examples
module conv_tb;
  reg clk;
  reg [15:0] pixel_index;
  wire signed [8:0] conv_out;

  parameter MULT = 1;
  parameter REPS = 1;
  parameter DIM = 32;
  parameter K = 5;

  reg reset;
  wire valid;

  // reg [7:0] image [0:(DIM*DIM - 1 + 3)];
  initial begin
    // $display("loading image...");
    // $readmemh("image_0.hex", image);
    clk = 0;
    pixel_index = 0;
    reset = 0;
    // $dumpfile ("conv_tb.vcd");
    // $dumpvars;
    // DIM^2 pixels, plus 1 for the 1 cycle delay from conv_out.
    #((DIM*DIM+2)*2*MULT*REPS) $finish;
  end

  reg [7:0] pixel;

  layer_1 layer_1_0 (
    .clk (clk),
    .reset (reset),
    .pxl_in ({1'b0, pixel}),
    // .pxl_out (conv_out)
    .pool_out (conv_out),
    .valid (valid)
  );

  // should produce
  // [33, 35,.. , 57, 59,
  // 97, 99,.. , 121, 123,
  // ,,]

  // conv conv_0 (
  //   .clk (clk),
  //   .reset (reset),
  //   .pxl_in ({1'b0, pixel}),
  //   // .pxl_out (conv_out)
  //   .conv_out (conv_out),
  //   .valid (valid)
  // );


  always
    #(MULT) clk = !clk;

  always @(posedge clk) begin
  // if (valid) $write("[%d]", conv_out);
    if (valid) $write("%d", conv_out);
    // if (~valid) $write(" %d ", conv_out);
    // if (valid) begin
    //   $write("%d ", conv_out);
    // end
    if ((((pixel_index-2 + DIM) % DIM) == DIM-1) && valid) $write("\n");
    // pixel = 1;
    // pixel = image[pixel_index];
    pixel = pixel_index + 1;
    // pixel_index = (pixel_index + 1) % (DIM*DIM + 1);
    pixel_index = pixel_index + 1;
    // if (pixel_index == (DIM*DIM-1)) reset = 1;
    // if (pixel_index == 0) reset = 0;
  end
endmodule
