module spi_tb;
  parameter MULT = 1;
  parameter CYCLES = 10000;

  reg clk;
  reg [2:0] clk_div;
  reg sck;


  reg [2:0] bitcnt;

  reg mosi;
  reg [7:0] to_send;

  reg [7:0] counter;

  wire miso;
  reg [7:0] received;

  reg ssel;
  reg reset;

  initial begin
    clk = 0;
    clk_div = 3'b000;
    sck = 0;

    bitcnt = 3'b000;

    mosi = 0;
    to_send = 42;
    counter = 42;

    ssel = 0; // active low?
    reset = 0;

    $display("start...");
    $monitor("%d",received);
    $dumpfile ("spi_tb.vcd");
    $dumpvars;
    #(MULT * CYCLES * 8) $finish;
  end

always
  #(MULT) clk = !clk;

always @ (posedge clk) begin
  clk_div <= clk_div + 1;
  sck <= (clk_div == 3'b000);
end

  SPI_slave my_spi(clk, sck, mosi, miso, ssel, reset);

always @ (posedge sck) begin
  to_send <= {to_send[6:0], 1'b0};
  received <= {received[6:0], miso};
  bitcnt <= bitcnt + 1;
end

always @ (negedge sck) begin
  mosi <= to_send[7];
end


always @ (posedge sck) begin
  if (bitcnt == 3'b111) begin
    $write("\n%d \n", received);
    to_send <= counter;
    counter <= counter + 1;
  end
end

endmodule
