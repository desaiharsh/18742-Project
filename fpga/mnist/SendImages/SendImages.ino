

// inslude the SPI library:
#include <SPI.h>
#include "image_0.h"

// set pin 10 as the slave select for the digital pot:
const int slaveSelectPin = 10;

int i = 0;
int dim = 28;
void setup() {
  Serial.begin(9600);
  // set the slaveSelectPin as an output:
  pinMode(slaveSelectPin, OUTPUT);
  // initialize SPI:
  SPI.begin();
//  SPI.beginTransaction(SPISettings(1, MSBFIRST, SPI_MODE0));
//  digitalWrite(slaveSelectPin, LOW);
//  SPI.setClockDivider(SPI_CLOCK_DIV8);
//  SPI.setClockDivider(SPI_CLOCK_DIV64);
  SPI.setClockDivider(SPI_CLOCK_DIV128);
}

void loop() {
  // NOTE: send 1 more pixel than we expect so we can properly account
  // for the 1 message delay from input to output.
  if (i <= dim*dim) {
//    Serial.print(SPI.transfer(image[i]), HEX);
    Serial.print(SPI.transfer(image[i]));
//    Serial.print(SPI.transfer(i), HEX);
    if (i % dim == 0) {
      Serial.println();
    } else {
      Serial.print("\t");      
    }
    i += 1;
//    delay(1000);
  } else if (i == dim*dim + 1) {
    Serial.println();
    i += 1;
//    digitalWrite(slaveSelectPin, HIGH);
//    SPI.endTransaction();
  }
}
