// `include "conv_gen.v"
// `include "conv.v"
// source:
// https://www.fpga4fun.com/SPI2.html
module SPI_slave(CLK, SCK, MOSI, MISO, SSEL, RESET);
input CLK;

input SCK, SSEL, MOSI;
output MISO;

input RESET;

parameter PP = 8;


// SCKr is a register holding the last 3 values of the SCK.
// this assumes we're super sampling the clock I guess?
// sync SCK to the FPGA clock using a 3-bits shift register
reg [2:0] SCKr;  always @(posedge CLK) SCKr <= {SCKr[1:0], SCK};
wire SCK_risingedge = (SCKr[2:1] == 2'b01);  // now we can detect SCK rising edges
wire SCK_fallingedge = (SCKr[2:1] == 2'b10);  // and falling edges

// same thing for SSEL
reg [2:0] SSELr;  always @(posedge CLK) SSELr <= {SSELr[1:0], SSEL};
wire SSEL_active = ~SSELr[1];  // SSEL is active low
// wire SSEL_startmessage = (SSELr[2:1]==2'b10);  // message starts at falling edge
// wire SSEL_endmessage = (SSELr[2:1]==2'b01);  // message stops at rising edge

// and for MOSI
reg [1:0] MOSIr;  always @(posedge CLK) MOSIr <= {MOSIr[0], MOSI};
wire MOSI_data = MOSIr[1];

// reg [2:0] reset_reg; always @(posedge CLK) reset_reg <= {reset_reg[1:0], RESET};
// wire RESET_risingedge = (reset_reg[2:1] == 2'b10);
// wire RESET_fallingedge = (reset_reg[2:1] == 2'b01);

// we handle SPI in 8-bits format,
//  so we need a 3 bits counter to count the bits as they come in
reg [2:0] bitcnt;

reg pixel_clock;
reg [7:0] byte_data_received;
reg [7:0] input_pixel;
reg [7:0] byte_data_sent;
reg byte_received;

// wire [7:0] conv_0_out;
// wire [7:0] conv_1_out;
// wire [7:0] conv_2_out;
// wire [7:0] conv_3_out;
// wire [7:0] conv_4_out;
// wire [7:0] conv_5_out;
// wire [7:0] conv_6_out;
// wire [7:0] conv_7_out;
// wire [7:0] conv_8_out;
// wire [7:0] conv_9_out;
// wire [7:0] conv_10_out;
// wire [7:0] conv_11_out;
// wire [7:0] conv_12_out;
// wire [7:0] conv_13_out;
// wire [7:0] conv_14_out;
// wire [7:0] conv_15_out;
// wire [7:0] conv_16_out;
// wire [7:0] conv_17_out;
// wire [7:0] conv_18_out;
// wire [7:0] conv_19_out;
// wire [7:0] conv_20_out;
wire signed [8:0] byte_data_to_send;

// wire reset;
// assign reset = 0;
// wire valid;

wire [8:0] layer_1_0_out;
wire [8:0] layer_1_1_out;
wire [8:0] layer_1_2_out;
wire [8:0] layer_1_3_out;
wire [8:0] layer_1_4_out;
wire [8:0] layer_1_5_out;
// wire [8:0] layer_1_6_out;
// wire [8:0] layer_1_7_out;
// wire [8:0] layer_1_8_out;
// wire [8:0] layer_1_9_out;
// wire [8:0] layer_1_10_out;
// wire [8:0] layer_1_11_out;
// wire [8:0] layer_1_12_out;
// wire [8:0] layer_1_13_out;
// wire [8:0] layer_1_14_out;
// wire [8:0] layer_1_15_out;
// wire [8:0] layer_1_16_out;
// wire [8:0] layer_1_17_out;
// wire [8:0] layer_1_18_out;
// wire [8:0] layer_1_19_out;


wire layer_1_0_valid;
wire layer_1_1_valid;
wire layer_1_2_valid;
wire layer_1_3_valid;
wire layer_1_4_valid;
wire layer_1_5_valid;


layer_1_0 layer_1_0 (
  .clk (pixel_clock),
  .reset (~SSEL_active),
  .pxl_in ({1'b0, input_pixel}),
  .pool_out (layer_1_0_out),
  .valid (layer_1_0_valid)
);

layer_1_1 layer_1_1 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_1_out, layer_1_1_valid);
layer_1_2 layer_1_2 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_2_out, layer_1_2_valid);
layer_1_3 layer_1_3 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_3_out, layer_1_3_valid);
layer_1_4 layer_1_4 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_4_out, layer_1_4_valid);
layer_1_5 layer_1_5 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_5_out, layer_1_5_valid);

// layer_1 layer_1_6 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_6_out);
// layer_1 layer_1_7 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_7_out);
// layer_1 layer_1_8 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_8_out);
// layer_1 layer_1_9 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_9_out);
// layer_1 layer_1_10 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_10_out);
// layer_1 layer_1_11 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_11_out);
// layer_1 layer_1_12 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_12_out);
// layer_1 layer_1_13 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_13_out);
// layer_1 layer_1_14 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_14_out);
// layer_1 layer_1_15 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_15_out);
// layer_1 layer_1_16 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_16_out);
// layer_1 layer_1_17 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_17_out);
// layer_1 layer_1_18 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_18_out);
// layer_1 layer_1_19 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_19_out);


assign byte_data_to_send =
layer_1_0_out +
layer_1_1_out +
layer_1_2_out +
layer_1_3_out +
layer_1_4_out +
layer_1_5_out;
// layer_1_6_out +
// layer_1_7_out +
// layer_1_8_out +
// layer_1_9_out +
// layer_1_10_out +
// layer_1_11_out +
// layer_1_12_out +
// layer_1_13_out +
// layer_1_14_out +
// layer_1_15_out +
// layer_1_16_out +
// layer_1_17_out +
// layer_1_18_out +
// layer_1_19_out;

// conv CONV0(pixel_clock, ~SSEL_active, {1'b0, input_pixel}, byte_data_to_send);
// conv_sep CONV0(byte_received, ~SSEL_active, input_pixel, byte_data_to_send);
// conv CONV0(byte_received, ~SSEL_active, input_pixel, conv_0_out);
// conv CONV1(byte_received, ~SSEL_active, input_pixel, conv_1_out);
// conv CONV2(byte_received, ~SSEL_active, input_pixel, conv_2_out);
// conv CONV3(byte_received, ~SSEL_active, input_pixel, conv_3_out);
// conv CONV4(byte_received, ~SSEL_active, input_pixel, conv_4_out);
//
// conv CONV5(byte_received, ~SSEL_active, input_pixel, conv_5_out);
// conv CONV6(byte_received, ~SSEL_active, input_pixel, conv_6_out);
// conv CONV7(byte_received, ~SSEL_active, input_pixel, conv_7_out);
// conv CONV8(byte_received, ~SSEL_active, input_pixel, conv_8_out);
// conv CONV9(byte_received, ~SSEL_active, input_pixel, conv_9_out);
//
// conv CONV10(byte_received, ~SSEL_active, input_pixel, conv_10_out);
// conv CONV11(byte_received, ~SSEL_active, input_pixel, conv_11_out);
// conv CONV12(byte_received, ~SSEL_active, input_pixel, conv_12_out);
// conv CONV13(byte_received, ~SSEL_active, input_pixel, conv_13_out);
// conv CONV14(byte_received, ~SSEL_active, input_pixel, conv_14_out);
//
// conv CONV15(byte_received, ~SSEL_active, input_pixel, conv_15_out);
// conv CONV16(byte_received, ~SSEL_active, input_pixel, conv_16_out);
// conv CONV17(byte_received, ~SSEL_active, input_pixel, conv_17_out);
// conv CONV18(byte_received, ~SSEL_active, input_pixel, conv_18_out);
// conv CONV19(byte_received, ~SSEL_active, input_pixel, conv_19_out);

// assign byte_data_to_send =
// conv_0_out +
// conv_1_out +
// conv_2_out +
// conv_3_out +
// conv_4_out +
// conv_5_out +
// conv_6_out +
// conv_7_out +
// conv_8_out +
// conv_9_out +
// conv_10_out +
// conv_11_out +
// conv_12_out +
// conv_13_out +
// conv_14_out +
// conv_15_out +
// conv_16_out +
// conv_17_out +
// conv_18_out +
// conv_19_out;

always @(posedge CLK) begin
  if (SSEL_active) begin
    // SCK RISING EDGE
    if (SCK_risingedge) begin
      bitcnt <= bitcnt + 3'b001;
      byte_data_received <= {byte_data_received[6:0], MOSI_data};
      byte_data_sent <= {byte_data_sent[6:0], 1'b0};
      byte_received <= (bitcnt == 3'b111);
    end
    // SCK FALLING EDGE
    if (SCK_fallingedge) begin
    // if (bitcnt==3'b000) begin
      if (byte_received) begin
        byte_data_sent <= byte_data_to_send[PP-1:0];  // after that, we send conv results
        input_pixel <= byte_data_received;
        // byte_data_sent <= input_pixel;  // after that, we send conv results
      end else begin
        // byte_data_sent <= {byte_data_sent[6:0], 1'b0};
      end
    end
  end else begin
  // ~SSEL_active
    bitcnt <= 3'b000;
    pixel_clock <= 1'b0;
    byte_data_received <= 8'b00000000;
    byte_received <= 1'b0;
    byte_data_sent <= 8'b00000000;
    input_pixel <= 8'b00000000;
  end
end

assign MISO = byte_data_sent[7];  // send MSB first
// assign MISO = 0;  // send MSB first
// we assume that there is only one slave on the SPI bus
// so we don't bother with a tri-state buffer for MISO
// otherwise we would need to tri-state MISO when SSEL is inactive

endmodule
