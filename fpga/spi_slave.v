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

// --------------------- LAYER 1 -------------------------------------


wire signed [8:0] layer_1_0_out;
wire signed [8:0] layer_1_1_out;
wire signed [8:0] layer_1_2_out;
wire signed [8:0] layer_1_3_out;
wire signed [8:0] layer_1_4_out;
wire signed [8:0] layer_1_5_out;

wire layer_1_0_valid;
wire layer_1_1_valid;
wire layer_1_2_valid;
wire layer_1_3_valid;
wire layer_1_4_valid;
wire layer_1_5_valid;

// assign pixel_clock = byte_received;

layer_1 layer_1 (
  .clk (byte_received),
  .reset (~SSEL_active),
  .pxl_in ({1'b0, input_pixel}),
  .pool_out (layer_1_0_out),
  .valid (layer_1_0_valid)
);

assign byte_data_to_send = layer_1_0_valid ? layer_1_0_out : 0;
// assign byte_data_to_send = {1'b0, input_pixel};


// layer_1_0 layer_1_0 (
//   .clk (pixel_clock),
//   .reset (~SSEL_active),
//   .pxl_in ({1'b0, input_pixel}),
//   .pool_out (layer_1_0_out),
//   .valid (layer_1_0_valid)
// );
//
// layer_1_1 layer_1_1 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_1_out, layer_1_1_valid);
// layer_1_2 layer_1_2 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_2_out, layer_1_2_valid);
// layer_1_3 layer_1_3 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_3_out, layer_1_3_valid);
// layer_1_4 layer_1_4 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_4_out, layer_1_4_valid);
// layer_1_5 layer_1_5 (pixel_clock, ~SSEL_active, {1'b0, input_pixel}, layer_1_5_out, layer_1_5_valid);

// --------------------- LAYER 2 -------------------------------------


// wire layer_2_0_clk = pixel_clock && layer_1_0_valid; // TODO: is this right?
// wire signed [8:0] layer_2_0_out;
// wire signed [8:0] layer_2_0_0_out;
// wire signed [8:0] layer_2_0_1_out;
// wire signed [8:0] layer_2_0_2_out;
// layer_2_0 LAYER_2_0_0 (layer_2_0_clk, ~SSEL_active, layer_1_0_out, layer_2_0_0_out, layer_2_0_0_valid);
// layer_2_0 LAYER_2_0_1 (layer_2_0_clk, ~SSEL_active, layer_1_1_out, layer_2_0_1_out, layer_2_0_1_valid);
// layer_2_0 LAYER_2_0_2 (layer_2_0_clk, ~SSEL_active, layer_1_2_out, layer_2_0_2_out, layer_2_0_2_valid);
// assign layer_2_0_out = layer_2_0_0_out + layer_2_0_1_out + layer_2_0_2_out;
//
// wire layer_2_1_clk = pixel_clock && layer_1_1_valid;
// wire signed [8:0] layer_2_1_out;
// wire signed [8:0] layer_2_1_0_out;
// wire signed [8:0] layer_2_1_1_out;
// wire signed [8:0] layer_2_1_2_out;
// layer_2_1 LAYER_2_1_0 (layer_2_1_clk, ~SSEL_active, layer_1_1_1_out, layer_2_1_0_out, layer_2_1_0_valid);
// layer_2_1 LAYER_2_1_1 (layer_2_1_clk, ~SSEL_active, layer_1_1_2_out, layer_2_1_1_out, layer_2_1_1_valid);
// layer_2_1 LAYER_2_1_2 (layer_2_1_clk, ~SSEL_active, layer_1_1_3_out, layer_2_1_2_out, layer_2_1_2_valid);
// assign layer_2_1_out = layer_2_1_0_out + layer_2_1_1_out + layer_2_1_2_out;
// wire layer_2_0_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_0_out;
// wire signed [8:0] layer_2_0_0_out; wire layer_2_0_0_valid;
// wire signed [8:0] layer_2_0_1_out; wire layer_2_0_1_valid;
// wire signed [8:0] layer_2_0_2_out; wire layer_2_0_2_valid;
// layer_2_0 LAYER_2_0_0 (layer_2_0_clk, ~SSEL_active, layer_1_0_out, layer_2_0_0_out, layer_2_0_0_valid);
// layer_2_0 LAYER_2_0_1 (layer_2_0_clk, ~SSEL_active, layer_1_1_out, layer_2_0_1_out, layer_2_0_1_valid);
// layer_2_0 LAYER_2_0_2 (layer_2_0_clk, ~SSEL_active, layer_1_2_out, layer_2_0_2_out, layer_2_0_2_valid);
// assign layer_2_0_out = layer_2_0_0_out + layer_2_0_1_out + layer_2_0_2_out;
// wire pool2_0_clk;
// assign pool2_0_clk = layer_2_0_clk && layer_2_0_0_valid;
// wire signed [8:0] pool2_0_out;
// wire pool2_0_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_0(pool2_0_clk, ~SSEL_active, layer_2_0_out, pool2_0_out, pool2_0_valid);
//
// wire layer_2_1_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_1_out;
// wire signed [8:0] layer_2_1_1_out; wire layer_2_1_1_valid;
// wire signed [8:0] layer_2_1_2_out; wire layer_2_1_2_valid;
// wire signed [8:0] layer_2_1_3_out; wire layer_2_1_3_valid;
// layer_2_1 LAYER_2_1_1 (layer_2_1_clk, ~SSEL_active, layer_1_1_out, layer_2_1_1_out, layer_2_1_1_valid);
// layer_2_1 LAYER_2_1_2 (layer_2_1_clk, ~SSEL_active, layer_1_2_out, layer_2_1_2_out, layer_2_1_2_valid);
// layer_2_1 LAYER_2_1_3 (layer_2_1_clk, ~SSEL_active, layer_1_3_out, layer_2_1_3_out, layer_2_1_3_valid);
// assign layer_2_1_out = layer_2_1_1_out + layer_2_1_2_out + layer_2_1_3_out;
// wire pool2_1_clk;
// assign pool2_1_clk = layer_2_1_clk && layer_2_1_1_valid;
// wire signed [8:0] pool2_1_out;
// wire pool2_1_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_1(pool2_1_clk, ~SSEL_active, layer_2_1_out, pool2_1_out, pool2_1_valid);
//
// wire layer_2_2_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_2_out;
// wire signed [8:0] layer_2_2_2_out; wire layer_2_2_2_valid;
// wire signed [8:0] layer_2_2_3_out; wire layer_2_2_3_valid;
// wire signed [8:0] layer_2_2_4_out; wire layer_2_2_4_valid;
// layer_2_2 LAYER_2_2_2 (layer_2_2_clk, ~SSEL_active, layer_1_2_out, layer_2_2_2_out, layer_2_2_2_valid);
// layer_2_2 LAYER_2_2_3 (layer_2_2_clk, ~SSEL_active, layer_1_3_out, layer_2_2_3_out, layer_2_2_3_valid);
// layer_2_2 LAYER_2_2_4 (layer_2_2_clk, ~SSEL_active, layer_1_4_out, layer_2_2_4_out, layer_2_2_4_valid);
// assign layer_2_2_out = layer_2_2_2_out + layer_2_2_3_out + layer_2_2_4_out;
// wire pool2_2_clk;
// assign pool2_2_clk = layer_2_2_clk && layer_2_2_2_valid;
// wire signed [8:0] pool2_2_out;
// wire pool2_2_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_2(pool2_2_clk, ~SSEL_active, layer_2_2_out, pool2_2_out, pool2_2_valid);
//
// wire layer_2_3_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_3_out;
// wire signed [8:0] layer_2_3_3_out; wire layer_2_3_3_valid;
// wire signed [8:0] layer_2_3_4_out; wire layer_2_3_4_valid;
// wire signed [8:0] layer_2_3_5_out; wire layer_2_3_5_valid;
// layer_2_3 LAYER_2_3_3 (layer_2_3_clk, ~SSEL_active, layer_1_3_out, layer_2_3_3_out, layer_2_3_3_valid);
// layer_2_3 LAYER_2_3_4 (layer_2_3_clk, ~SSEL_active, layer_1_4_out, layer_2_3_4_out, layer_2_3_4_valid);
// layer_2_3 LAYER_2_3_5 (layer_2_3_clk, ~SSEL_active, layer_1_5_out, layer_2_3_5_out, layer_2_3_5_valid);
// assign layer_2_3_out = layer_2_3_3_out + layer_2_3_4_out + layer_2_3_5_out;
// wire pool2_3_clk;
// assign pool2_3_clk = layer_2_3_clk && layer_2_3_3_valid;
// wire signed [8:0] pool2_3_out;
// wire pool2_3_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_3(pool2_3_clk, ~SSEL_active, layer_2_3_out, pool2_3_out, pool2_3_valid);
//
// wire layer_2_4_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_4_out;
// wire signed [8:0] layer_2_4_0_out; wire layer_2_4_0_valid;
// wire signed [8:0] layer_2_4_4_out; wire layer_2_4_4_valid;
// wire signed [8:0] layer_2_4_5_out; wire layer_2_4_5_valid;
// layer_2_4 LAYER_2_4_0 (layer_2_4_clk, ~SSEL_active, layer_1_0_out, layer_2_4_0_out, layer_2_4_0_valid);
// layer_2_4 LAYER_2_4_4 (layer_2_4_clk, ~SSEL_active, layer_1_4_out, layer_2_4_4_out, layer_2_4_4_valid);
// layer_2_4 LAYER_2_4_5 (layer_2_4_clk, ~SSEL_active, layer_1_5_out, layer_2_4_5_out, layer_2_4_5_valid);
// assign layer_2_4_out = layer_2_4_0_out + layer_2_4_4_out + layer_2_4_5_out;
// wire pool2_4_clk;
// assign pool2_4_clk = layer_2_4_clk && layer_2_4_0_valid;
// wire signed [8:0] pool2_4_out;
// wire pool2_4_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_4(pool2_4_clk, ~SSEL_active, layer_2_4_out, pool2_4_out, pool2_4_valid);
//
// wire layer_2_5_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_5_out;
// wire signed [8:0] layer_2_5_0_out; wire layer_2_5_0_valid;
// wire signed [8:0] layer_2_5_1_out; wire layer_2_5_1_valid;
// wire signed [8:0] layer_2_5_5_out; wire layer_2_5_5_valid;
// layer_2_5 LAYER_2_5_0 (layer_2_5_clk, ~SSEL_active, layer_1_0_out, layer_2_5_0_out, layer_2_5_0_valid);
// layer_2_5 LAYER_2_5_1 (layer_2_5_clk, ~SSEL_active, layer_1_1_out, layer_2_5_1_out, layer_2_5_1_valid);
// layer_2_5 LAYER_2_5_5 (layer_2_5_clk, ~SSEL_active, layer_1_5_out, layer_2_5_5_out, layer_2_5_5_valid);
// assign layer_2_5_out = layer_2_5_0_out + layer_2_5_1_out + layer_2_5_5_out;
// wire pool2_5_clk;
// assign pool2_5_clk = layer_2_5_clk && layer_2_5_0_valid;
// wire signed [8:0] pool2_5_out;
// wire pool2_5_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_5(pool2_5_clk, ~SSEL_active, layer_2_5_out, pool2_5_out, pool2_5_valid);
//
// wire layer_2_6_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_6_out;
// wire signed [8:0] layer_2_6_0_out; wire layer_2_6_0_valid;
// wire signed [8:0] layer_2_6_1_out; wire layer_2_6_1_valid;
// wire signed [8:0] layer_2_6_2_out; wire layer_2_6_2_valid;
// wire signed [8:0] layer_2_6_3_out; wire layer_2_6_3_valid;
// layer_2_6 LAYER_2_6_0 (layer_2_6_clk, ~SSEL_active, layer_1_0_out, layer_2_6_0_out, layer_2_6_0_valid);
// layer_2_6 LAYER_2_6_1 (layer_2_6_clk, ~SSEL_active, layer_1_1_out, layer_2_6_1_out, layer_2_6_1_valid);
// layer_2_6 LAYER_2_6_2 (layer_2_6_clk, ~SSEL_active, layer_1_2_out, layer_2_6_2_out, layer_2_6_2_valid);
// layer_2_6 LAYER_2_6_3 (layer_2_6_clk, ~SSEL_active, layer_1_3_out, layer_2_6_3_out, layer_2_6_3_valid);
// assign layer_2_6_out = layer_2_6_0_out + layer_2_6_1_out + layer_2_6_2_out + layer_2_6_3_out;
// wire pool2_6_clk;
// assign pool2_6_clk = layer_2_6_clk && layer_2_6_0_valid;
// wire signed [8:0] pool2_6_out;
// wire pool2_6_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_6(pool2_6_clk, ~SSEL_active, layer_2_6_out, pool2_6_out, pool2_6_valid);
//
// wire layer_2_7_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_7_out;
// wire signed [8:0] layer_2_7_1_out; wire layer_2_7_1_valid;
// wire signed [8:0] layer_2_7_2_out; wire layer_2_7_2_valid;
// wire signed [8:0] layer_2_7_3_out; wire layer_2_7_3_valid;
// wire signed [8:0] layer_2_7_4_out; wire layer_2_7_4_valid;
// layer_2_7 LAYER_2_7_1 (layer_2_7_clk, ~SSEL_active, layer_1_1_out, layer_2_7_1_out, layer_2_7_1_valid);
// layer_2_7 LAYER_2_7_2 (layer_2_7_clk, ~SSEL_active, layer_1_2_out, layer_2_7_2_out, layer_2_7_2_valid);
// layer_2_7 LAYER_2_7_3 (layer_2_7_clk, ~SSEL_active, layer_1_3_out, layer_2_7_3_out, layer_2_7_3_valid);
// layer_2_7 LAYER_2_7_4 (layer_2_7_clk, ~SSEL_active, layer_1_4_out, layer_2_7_4_out, layer_2_7_4_valid);
// assign layer_2_7_out = layer_2_7_1_out + layer_2_7_2_out + layer_2_7_3_out + layer_2_7_4_out;
// wire pool2_7_clk;
// assign pool2_7_clk = layer_2_7_clk && layer_2_7_1_valid;
// wire signed [8:0] pool2_7_out;
// wire pool2_7_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_7(pool2_7_clk, ~SSEL_active, layer_2_7_out, pool2_7_out, pool2_7_valid);
//
// wire layer_2_8_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_8_out;
// wire signed [8:0] layer_2_8_2_out; wire layer_2_8_2_valid;
// wire signed [8:0] layer_2_8_3_out; wire layer_2_8_3_valid;
// wire signed [8:0] layer_2_8_4_out; wire layer_2_8_4_valid;
// wire signed [8:0] layer_2_8_5_out; wire layer_2_8_5_valid;
// layer_2_8 LAYER_2_8_2 (layer_2_8_clk, ~SSEL_active, layer_1_2_out, layer_2_8_2_out, layer_2_8_2_valid);
// layer_2_8 LAYER_2_8_3 (layer_2_8_clk, ~SSEL_active, layer_1_3_out, layer_2_8_3_out, layer_2_8_3_valid);
// layer_2_8 LAYER_2_8_4 (layer_2_8_clk, ~SSEL_active, layer_1_4_out, layer_2_8_4_out, layer_2_8_4_valid);
// layer_2_8 LAYER_2_8_5 (layer_2_8_clk, ~SSEL_active, layer_1_5_out, layer_2_8_5_out, layer_2_8_5_valid);
// assign layer_2_8_out = layer_2_8_2_out + layer_2_8_3_out + layer_2_8_4_out + layer_2_8_5_out;
// wire pool2_8_clk;
// assign pool2_8_clk = layer_2_8_clk && layer_2_8_2_valid;
// wire signed [8:0] pool2_8_out;
// wire pool2_8_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_8(pool2_8_clk, ~SSEL_active, layer_2_8_out, pool2_8_out, pool2_8_valid);
//
// wire layer_2_9_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_9_out;
// wire signed [8:0] layer_2_9_3_out; wire layer_2_9_3_valid;
// wire signed [8:0] layer_2_9_4_out; wire layer_2_9_4_valid;
// wire signed [8:0] layer_2_9_5_out; wire layer_2_9_5_valid;
// wire signed [8:0] layer_2_9_0_out; wire layer_2_9_0_valid;
// layer_2_9 LAYER_2_9_3 (layer_2_9_clk, ~SSEL_active, layer_1_3_out, layer_2_9_3_out, layer_2_9_3_valid);
// layer_2_9 LAYER_2_9_4 (layer_2_9_clk, ~SSEL_active, layer_1_4_out, layer_2_9_4_out, layer_2_9_4_valid);
// layer_2_9 LAYER_2_9_5 (layer_2_9_clk, ~SSEL_active, layer_1_5_out, layer_2_9_5_out, layer_2_9_5_valid);
// layer_2_9 LAYER_2_9_0 (layer_2_9_clk, ~SSEL_active, layer_1_0_out, layer_2_9_0_out, layer_2_9_0_valid);
// assign layer_2_9_out = layer_2_9_3_out + layer_2_9_4_out + layer_2_9_5_out + layer_2_9_0_out;
// wire pool2_9_clk;
// assign pool2_9_clk = layer_2_9_clk && layer_2_9_3_valid;
// wire signed [8:0] pool2_9_out;
// wire pool2_9_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_9(pool2_9_clk, ~SSEL_active, layer_2_9_out, pool2_9_out, pool2_9_valid);
//
// wire layer_2_10_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_10_out;
// wire signed [8:0] layer_2_10_4_out; wire layer_2_10_4_valid;
// wire signed [8:0] layer_2_10_5_out; wire layer_2_10_5_valid;
// wire signed [8:0] layer_2_10_0_out; wire layer_2_10_0_valid;
// wire signed [8:0] layer_2_10_1_out; wire layer_2_10_1_valid;
// layer_2_10 LAYER_2_10_4 (layer_2_10_clk, ~SSEL_active, layer_1_4_out, layer_2_10_4_out, layer_2_10_4_valid);
// layer_2_10 LAYER_2_10_5 (layer_2_10_clk, ~SSEL_active, layer_1_5_out, layer_2_10_5_out, layer_2_10_5_valid);
// layer_2_10 LAYER_2_10_0 (layer_2_10_clk, ~SSEL_active, layer_1_0_out, layer_2_10_0_out, layer_2_10_0_valid);
// layer_2_10 LAYER_2_10_1 (layer_2_10_clk, ~SSEL_active, layer_1_1_out, layer_2_10_1_out, layer_2_10_1_valid);
// assign layer_2_10_out = layer_2_10_4_out + layer_2_10_5_out + layer_2_10_0_out + layer_2_10_1_out;
// wire pool2_10_clk;
// assign pool2_10_clk = layer_2_10_clk && layer_2_10_4_valid;
// wire signed [8:0] pool2_10_out;
// wire pool2_10_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_10(pool2_10_clk, ~SSEL_active, layer_2_10_out, pool2_10_out, pool2_10_valid);
//
// wire layer_2_11_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_11_out;
// wire signed [8:0] layer_2_11_5_out; wire layer_2_11_5_valid;
// wire signed [8:0] layer_2_11_0_out; wire layer_2_11_0_valid;
// wire signed [8:0] layer_2_11_1_out; wire layer_2_11_1_valid;
// wire signed [8:0] layer_2_11_2_out; wire layer_2_11_2_valid;
// layer_2_11 LAYER_2_11_5 (layer_2_11_clk, ~SSEL_active, layer_1_5_out, layer_2_11_5_out, layer_2_11_5_valid);
// layer_2_11 LAYER_2_11_0 (layer_2_11_clk, ~SSEL_active, layer_1_0_out, layer_2_11_0_out, layer_2_11_0_valid);
// layer_2_11 LAYER_2_11_1 (layer_2_11_clk, ~SSEL_active, layer_1_1_out, layer_2_11_1_out, layer_2_11_1_valid);
// layer_2_11 LAYER_2_11_2 (layer_2_11_clk, ~SSEL_active, layer_1_2_out, layer_2_11_2_out, layer_2_11_2_valid);
// assign layer_2_11_out = layer_2_11_5_out + layer_2_11_0_out + layer_2_11_1_out + layer_2_11_2_out;
// wire pool2_11_clk;
// assign pool2_11_clk = layer_2_11_clk && layer_2_11_5_valid;
// wire signed [8:0] pool2_11_out;
// wire pool2_11_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_11(pool2_11_clk, ~SSEL_active, layer_2_11_out, pool2_11_out, pool2_11_valid);
//
// wire layer_2_12_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_12_out;
// wire signed [8:0] layer_2_12_0_out; wire layer_2_12_0_valid;
// wire signed [8:0] layer_2_12_1_out; wire layer_2_12_1_valid;
// wire signed [8:0] layer_2_12_3_out; wire layer_2_12_3_valid;
// wire signed [8:0] layer_2_12_4_out; wire layer_2_12_4_valid;
// layer_2_12 LAYER_2_12_0 (layer_2_12_clk, ~SSEL_active, layer_1_0_out, layer_2_12_0_out, layer_2_12_0_valid);
// layer_2_12 LAYER_2_12_1 (layer_2_12_clk, ~SSEL_active, layer_1_1_out, layer_2_12_1_out, layer_2_12_1_valid);
// layer_2_12 LAYER_2_12_3 (layer_2_12_clk, ~SSEL_active, layer_1_3_out, layer_2_12_3_out, layer_2_12_3_valid);
// layer_2_12 LAYER_2_12_4 (layer_2_12_clk, ~SSEL_active, layer_1_4_out, layer_2_12_4_out, layer_2_12_4_valid);
// assign layer_2_12_out = layer_2_12_0_out + layer_2_12_1_out + layer_2_12_3_out + layer_2_12_4_out;
// wire pool2_12_clk;
// assign pool2_12_clk = layer_2_12_clk && layer_2_12_0_valid;
// wire signed [8:0] pool2_12_out;
// wire pool2_12_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_12(pool2_12_clk, ~SSEL_active, layer_2_12_out, pool2_12_out, pool2_12_valid);
//
// wire layer_2_13_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_13_out;
// wire signed [8:0] layer_2_13_1_out; wire layer_2_13_1_valid;
// wire signed [8:0] layer_2_13_2_out; wire layer_2_13_2_valid;
// wire signed [8:0] layer_2_13_4_out; wire layer_2_13_4_valid;
// wire signed [8:0] layer_2_13_5_out; wire layer_2_13_5_valid;
// layer_2_13 LAYER_2_13_1 (layer_2_13_clk, ~SSEL_active, layer_1_1_out, layer_2_13_1_out, layer_2_13_1_valid);
// layer_2_13 LAYER_2_13_2 (layer_2_13_clk, ~SSEL_active, layer_1_2_out, layer_2_13_2_out, layer_2_13_2_valid);
// layer_2_13 LAYER_2_13_4 (layer_2_13_clk, ~SSEL_active, layer_1_4_out, layer_2_13_4_out, layer_2_13_4_valid);
// layer_2_13 LAYER_2_13_5 (layer_2_13_clk, ~SSEL_active, layer_1_5_out, layer_2_13_5_out, layer_2_13_5_valid);
// assign layer_2_13_out = layer_2_13_1_out + layer_2_13_2_out + layer_2_13_4_out + layer_2_13_5_out;
// wire pool2_13_clk;
// assign pool2_13_clk = layer_2_13_clk && layer_2_13_1_valid;
// wire signed [8:0] pool2_13_out;
// wire pool2_13_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_13(pool2_13_clk, ~SSEL_active, layer_2_13_out, pool2_13_out, pool2_13_valid);
//
// wire layer_2_14_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_14_out;
// wire signed [8:0] layer_2_14_0_out; wire layer_2_14_0_valid;
// wire signed [8:0] layer_2_14_2_out; wire layer_2_14_2_valid;
// wire signed [8:0] layer_2_14_3_out; wire layer_2_14_3_valid;
// wire signed [8:0] layer_2_14_5_out; wire layer_2_14_5_valid;
// layer_2_14 LAYER_2_14_0 (layer_2_14_clk, ~SSEL_active, layer_1_0_out, layer_2_14_0_out, layer_2_14_0_valid);
// layer_2_14 LAYER_2_14_2 (layer_2_14_clk, ~SSEL_active, layer_1_2_out, layer_2_14_2_out, layer_2_14_2_valid);
// layer_2_14 LAYER_2_14_3 (layer_2_14_clk, ~SSEL_active, layer_1_3_out, layer_2_14_3_out, layer_2_14_3_valid);
// layer_2_14 LAYER_2_14_5 (layer_2_14_clk, ~SSEL_active, layer_1_5_out, layer_2_14_5_out, layer_2_14_5_valid);
// assign layer_2_14_out = layer_2_14_0_out + layer_2_14_2_out + layer_2_14_3_out + layer_2_14_5_out;
// wire pool2_14_clk;
// assign pool2_14_clk = layer_2_14_clk && layer_2_14_0_valid;
// wire signed [8:0] pool2_14_out;
// wire pool2_14_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_14(pool2_14_clk, ~SSEL_active, layer_2_14_out, pool2_14_out, pool2_14_valid);
//
// wire layer_2_15_clk = pixel_clock && layer_1_0_valid;
// wire signed [8:0] layer_2_15_out;
// wire signed [8:0] layer_2_15_0_out; wire layer_2_15_0_valid;
// wire signed [8:0] layer_2_15_1_out; wire layer_2_15_1_valid;
// wire signed [8:0] layer_2_15_2_out; wire layer_2_15_2_valid;
// wire signed [8:0] layer_2_15_3_out; wire layer_2_15_3_valid;
// wire signed [8:0] layer_2_15_4_out; wire layer_2_15_4_valid;
// wire signed [8:0] layer_2_15_5_out; wire layer_2_15_5_valid;
// layer_2_15 LAYER_2_15_0 (layer_2_15_clk, ~SSEL_active, layer_1_0_out, layer_2_15_0_out, layer_2_15_0_valid);
// layer_2_15 LAYER_2_15_1 (layer_2_15_clk, ~SSEL_active, layer_1_1_out, layer_2_15_1_out, layer_2_15_1_valid);
// layer_2_15 LAYER_2_15_2 (layer_2_15_clk, ~SSEL_active, layer_1_2_out, layer_2_15_2_out, layer_2_15_2_valid);
// layer_2_15 LAYER_2_15_3 (layer_2_15_clk, ~SSEL_active, layer_1_3_out, layer_2_15_3_out, layer_2_15_3_valid);
// layer_2_15 LAYER_2_15_4 (layer_2_15_clk, ~SSEL_active, layer_1_4_out, layer_2_15_4_out, layer_2_15_4_valid);
// layer_2_15 LAYER_2_15_5 (layer_2_15_clk, ~SSEL_active, layer_1_5_out, layer_2_15_5_out, layer_2_15_5_valid);
// assign layer_2_15_out = layer_2_15_0_out + layer_2_15_1_out + layer_2_15_2_out + layer_2_15_3_out + layer_2_15_4_out + layer_2_15_5_out;
// wire pool2_15_clk;
// assign pool2_15_clk = layer_2_15_clk && layer_2_15_0_valid;
// wire signed [8:0] pool2_15_out;
// wire pool2_15_valid;
// max_pool #(.DIM(10)) MAX_POOL_2_15(pool2_15_clk, ~SSEL_active, layer_2_15_out, pool2_15_out, pool2_15_valid);


// --------------------- LAYER 3 -------------------------------------

// wire layer_3_0_clk = pixel_clock && pool_2_0_valid;
// wire signed [8:0] layer_2_15_out;
// wire signed [8:0] layer_2_15_0_out; wire layer_2_15_0_valid;
// wire signed [8:0] layer_2_15_1_out; wire layer_2_15_1_valid;
// wire signed [8:0] layer_2_15_2_out; wire layer_2_15_2_valid;
// wire signed [8:0] layer_2_15_3_out; wire layer_2_15_3_valid;
// wire signed [8:0] layer_2_15_4_out; wire layer_2_15_4_valid;
// wire signed [8:0] layer_2_15_5_out; wire layer_2_15_5_valid;
// layer_2_15 LAYER_2_15_0 (layer_2_15_clk, ~SSEL_active, layer_1_0_out, layer_2_15_0_out, layer_2_15_0_valid);
// layer_2_15 LAYER_2_15_1 (layer_2_15_clk, ~SSEL_active, layer_1_1_out, layer_2_15_1_out, layer_2_15_1_valid);
// layer_2_15 LAYER_2_15_2 (layer_2_15_clk, ~SSEL_active, layer_1_2_out, layer_2_15_2_out, layer_2_15_2_valid);
// layer_2_15 LAYER_2_15_3 (layer_2_15_clk, ~SSEL_active, layer_1_3_out, layer_2_15_3_out, layer_2_15_3_valid);
// layer_2_15 LAYER_2_15_4 (layer_2_15_clk, ~SSEL_active, layer_1_4_out, layer_2_15_4_out, layer_2_15_4_valid);
// layer_2_15 LAYER_2_15_5 (layer_2_15_clk, ~SSEL_active, layer_1_5_out, layer_2_15_5_out, layer_2_15_5_valid);
// assign layer_2_15_out = layer_2_15_0_out + layer_2_15_1_out + layer_2_15_2_out + layer_2_15_3_out + layer_2_15_4_out + layer_2_15_5_out;


// assign byte_data_to_send =
// layer_2_0_out +
// layer_2_1_out +
// layer_2_2_out +
// layer_2_3_out +
// layer_2_4_out +
// layer_2_5_out +
// layer_2_6_out +
// layer_2_7_out +
// layer_2_8_out +
// layer_2_9_out +
// layer_2_10_out +
// layer_2_11_out +
// layer_2_12_out +
// layer_2_13_out +
// layer_2_14_out +
// layer_2_15_out;

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
