// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
    input CLK,    // 16MHz clock
    input PIN_1,
    input PIN_2,
    output PIN_3,
    input PIN_4,
    input PIN_6,
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;


    // use pins on the left  side of the board.
    // SPI_SCK = PIN_1
    // SPI_MOSI = PIN_2
    // SPI_MISO = PIN_3
    // SPI_SSEL = PIN_4
    // reset = PIN_6
    SPI_slave my_spi_slave(CLK, PIN_1, PIN_2, PIN_3, PIN_4, PIN_6);
endmodule
