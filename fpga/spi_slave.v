// `include "conv_gen.v"
// `include "conv.v"
// source:
// https://www.fpga4fun.com/SPI2.html
module SPI_slave(CLK, SCK, MOSI, MISO, SSEL, RESET);
input CLK;

input SCK, SSEL, MOSI;
output MISO;

input RESET;

// SCKr is a register holding the last 3 values of the SCK.
// this assumes we're super sampling the clock I guess?
// sync SCK to the FPGA clock using a 3-bits shift register
reg [2:0] SCKr;  always @(posedge CLK) SCKr <= {SCKr[1:0], SCK};
wire SCK_risingedge = (SCKr[2:1] == 2'b01);  // now we can detect SCK rising edges
wire SCK_fallingedge = (SCKr[2:1] == 2'b10);  // and falling edges

// same thing for SSEL
reg [2:0] SSELr;  always @(posedge CLK) SSELr <= {SSELr[1:0], SSEL};
wire SSEL_active = ~SSELr[1];  // SSEL is active low
wire SSEL_startmessage = (SSELr[2:1]==2'b10);  // message starts at falling edge
wire SSEL_endmessage = (SSELr[2:1]==2'b01);  // message stops at rising edge

// and for MOSI
reg [1:0] MOSIr;  always @(posedge CLK) MOSIr <= {MOSIr[0], MOSI};
wire MOSI_data = MOSIr[1];

reg [2:0] reset_reg; always @(posedge CLK) reset_reg <= {reset_reg[1:0], RESET};
wire RESET_risingedge = (reset_reg[2:1] == 2'b10);
wire RESET_fallingedge = (reset_reg[2:1] == 2'b01);

// we handle SPI in 8-bits format,
//  so we need a 3 bits counter to count the bits as they come in
reg [2:0] bitcnt;

reg byte_received;  // high when a byte has been received
reg [7:0] byte_data_received;
wire [7:0] byte_data_to_send;

// wire reset;
// assign reset = 0;
// wire valid;


conv CONV0(byte_received, RESET_risingedge, byte_data_received, byte_data_to_send);

always @(posedge CLK)
begin
  if(~SSEL_active)
    bitcnt <= 3'b000;
  else
  if(SCK_risingedge)
  begin
    bitcnt <= bitcnt + 3'b001;
    // implement a shift-left register (since we receive the data MSB first)
    byte_data_received <= {byte_data_received[6:0], MOSI_data};
  end
end

always @(posedge CLK) byte_received <= SSEL_active && SCK_risingedge && (bitcnt==3'b111);

reg [7:0] byte_data_sent;

always @(posedge CLK)
if(SSEL_active)
begin
  if (SCK_fallingedge)
  begin
    if(bitcnt==3'b000)
    // byte_data_sent <= 8'h00;  // after that, we send 0s
    byte_data_sent <= byte_data_to_send;  // after that, we send conv results
      // byte_data_sent <= byte_data_received;  // after that, we send conv results
    else
      byte_data_sent <= {byte_data_sent[6:0], 1'b0};
  end
end

assign MISO = byte_data_sent[7];  // send MSB first
// assign MISO = 0;  // send MSB first
// we assume that there is only one slave on the SPI bus
// so we don't bother with a tri-state buffer for MISO
// otherwise we would need to tri-state MISO when SSEL is inactive

endmodule
