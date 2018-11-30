// Code your testbench here
// or browse Examples
module conv_tb;
  reg clk;
  reg [15:0] pixel_index;
  wire [7:0] conv_out;

  parameter MULT = 1;
  parameter REPS = 1;
  parameter DIM = 28;
  parameter K = 5;

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

  conv CONV0 (
    .clk (clk),
    .reset (reset),
    .pxl_in (pixel),
    .pxl_out (conv_out)
  );

  always
    #(MULT) clk = !clk;

  always @(posedge clk) begin
    if (pixel_index >= (DIM*(K-1) + K)) begin
      if ((pixel_index - 1 + DIM) % DIM >= (K-1)) begin
        $write("%d ", conv_out);
      end
      if (((pixel_index-1 + DIM) % DIM) == DIM-1) $write("\n");
    end
    // pixel = 1;
    // pixel = image[pixel_index];
    pixel = pixel_index + 1;
    pixel_index = (pixel_index + 1) % (DIM*DIM + 1);
    // if (pixel_index == (DIM*DIM-1)) reset = 1;
    // if (pixel_index == 0) reset = 0;
  end
endmodule
