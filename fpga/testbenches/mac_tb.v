// `include "mac.v"
// `include "shift.v"
// `include "register.v"

module mac_tb;
  parameter MULT = 5;

  reg clk;

  wire signed [16:0] wire_00;
  wire signed [16:0] wire_01;
  wire signed [16:0] wire_02;
  wire signed [16:0] wire_03;
  wire signed [16:0] wire_04;

  reg signed [7:0] weight_00 = 1;
  reg signed [7:0] weight_01 = 1;
  reg signed [7:0] weight_02 = 1;
  reg signed [7:0] weight_03 = 1;
  reg signed [7:0] weight_04 = 1;

  wire signed [16:0] reg_00;
  wire signed [16:0] reg_01;
  wire signed [16:0] reg_02;
  wire signed [16:0] reg_03;
  wire signed [16:0] reg_04;
  wire signed [16:0] sr_0;

  wire [15:0] clip_up;
  wire [7:0] clip_down;


  reg [7:0] image [0:59];
  reg [7:0] pixel;
  reg [15:0] pixel_index;

  wire reset = 0;

  initial begin
    $readmemh("mac_tb.hex", image);
    clk = 1;
    pixel_index = 0;

    $monitor("%d, mac_00: %d * %d + 0 = %d, prev: %d\n", $time, pixel, weight_00, wire_00, reg_00);
    // $monitor("%d, mac_01: %d * %d + %d = %d, prev: %d", $time, pixel, weight_01, reg_00, wire_01, reg_01);

    #(70*MULT) $finish;
  end

mac mac_00(pixel, weight_00, 17'h000, wire_00);
register r_00(clk, reset, wire_00, reg_00);

mac mac_01(pixel, weight_01, reg_00, wire_01);
register r_01(clk, reset, wire_01, reg_01);

mac mac_02(pixel, weight_02, reg_01, wire_02);
register r_02(clk, reset, wire_02, reg_02);

mac mac_03(pixel, weight_03, reg_02, wire_03);
register r_03(clk, reset, wire_03, reg_03);

mac mac_04(pixel, weight_04, reg_03, wire_04);
register r_04(clk, reset, wire_04, reg_04);

shift row_0(clk, reg_04, sr_0);

assign clip_up = sr_0 < 0 ? 0 : sr_0[15:0];
assign clip_down = clip_up > 255 ? 255 : clip_up;


always
  #(MULT) clk = !clk;

always @ ( posedge clk ) begin
  // $write("pixel: %d, %d %d %d %d %d %d %d %d\n", pixel, reg_00, reg_01, reg_02, reg_03, reg_04, sr_0, clip_up, clip_down);
  // $write("%d %d %d %d %d\n", pixel, weight_00, 17'h000, wire_00, reg_00);
  $write("%d, mac_00: %d * %d + 0 = %d, prev: %d\n", $time, pixel, weight_00, wire_00, reg_00);
  pixel = image[pixel_index];
  pixel_index = pixel_index + 1;
end

endmodule
