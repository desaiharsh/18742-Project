// Code your testbench here
// or browse Examples
module max_pool_tb;
  reg clk;
  reg [15:0] pixel_index;
  wire signed [8:0] conv_out;

  parameter MULT = 1;
  parameter REPS = 1;
  parameter DIM = 16;
  parameter K = 2;

  parameter STRIDE = 2;
  parameter PP = 8;

  reg reset;
  wire valid;

  reg [7:0] image [0:(DIM*DIM - 1 + 3)];
  initial begin
    $display("loading image...");
    $readmemh("image_0.hex", image);
    clk = 0;
    pixel_index = 0;
    reset = 0;
    // $dumpfile ("conv_tb.vcd");
    // $dumpvars;
    // DIM^2 pixels, plus 1 for the 1 cycle delay from conv_out.
    #((DIM*DIM+1 + 3)*2*MULT*REPS) $finish;
  end

  reg [7:0] pixel;

  max_pool #(DIM, K, STRIDE, PP) max_pool_0 (
    .clk (clk),
    .reset (reset),
    .pxl_in ({1'b0, pixel}),
    // .pxl_out (conv_out)
    .pool_out (conv_out),
    .valid (valid)
  );

  always
    #(MULT) clk = !clk;

  // wire [8:0] tmp;
  // max max_0(pixel, 42, tmp);
  // index into row/col
  // reg [4:0] row = 0;
  // reg [4:0] col = 0;


  always @(posedge clk) begin

    if (valid) begin
      $write("%d\t", conv_out);
    end

    if (pixel_index == 0) $write("\n");


    // if (valid) begin
    //   $write("%d ", conv_out);
    // end

  //   if (row < DIM-1) begin
  //     row <= row + 1;
  //   end else begin
  //     row <= 0;
  //   end


    // if (pixel_index >= (DIM*(K-1) + K)) begin
    //   if ((pixel_index - 1 + DIM) % DIM >= (K-1)) begin
    //   // $write("%d:%d ", pixel, conv_out);
    //     if (valid) begin
    //       $write("%d ", conv_out);
    //     end
    //   end
    //   if (((pixel_index-1 + DIM) % DIM) == DIM-1) begin
    //     // if (valid) begin
    //       $write("\n");
    //     // end
    //   end
    // end
    // pixel = 1;
    // pixel = image[pixel_index];
    pixel = pixel_index + 1;
    pixel_index = (pixel_index + 1) % (DIM*DIM + 1);
    // if (pixel_index == (DIM*DIM-1)) reset = 1;
    // if (pixel_index == 0) reset = 0;
  end
endmodule
