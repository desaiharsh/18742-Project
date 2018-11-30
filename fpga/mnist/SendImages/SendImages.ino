

// inslude the SPI library:
#include <SPI.h>
#include "image_0.h"

// set pin 10 as the slave select for the digital pot:
const int slaveSelectPin = 10;
const int resetPin = 6;

#define DIM 28
#define K 5

int i = 0;
byte recv = 0;
byte to_send = 0;
//byte buff[DIM*DIM+2];
unsigned long st, nd;

void setup() {
  Serial.begin(9600);
  // set the slaveSelectPin as an output:
  pinMode(slaveSelectPin, OUTPUT);
  // initialize SPI:
  SPI.begin();
//  SPI.beginTransaction(SPISettings(1, MSBFIRST, SPI_MODE0));
//  digitalWrite(slaveSelectPin, LOW);
  SPI.setClockDivider(SPI_CLOCK_DIV8);
//  SPI.setClockDivider(SPI_CLOCK_DIV32);
//  SPI.setClockDivider(SPI_CLOCK_DIV64);
//  SPI.setClockDivider(SPI_CLOCK_DIV128);
//  digitalWrite(resetPin, HIGH);
//  delay(100);
//  digitalWrite(resetPin, LOW);

  digitalWrite(slaveSelectPin, HIGH);
  delay(100);
  digitalWrite(slaveSelectPin, LOW);


  // DEBUG: ascending numbers
//  for (int i = 0; i < DIM*DIM+1; i++) {
//    buff[i] = i + 7; // to send
//  }

  // print input
//  for (int i = 0; i < DIM; i++) {
//    for (int j = 0; j < DIM; j++) {
//      Serial.print(buff[i*DIM + j]);
//      if (buff[i*DIM + j] < 10) Serial.print(" ");
//      if (buff[i*DIM + j] < 100) Serial.print(" ");
//      Serial.print(" ");
//    }
//    Serial.println();
//  }
 
  st = micros();
  // NOTE: send 1 more pixel than we expect so we can properly account
  // for the 1 message delay from input to output.
  SPI.transfer(buff, DIM*DIM+1);
  nd = micros();

//  for (int i = 0; i < DIM*DIM; i++) {
//    buff[i] = buff[i+1];
//  }

  // timing
  Serial.println("time:");
  Serial.println(nd - st);

  // print received pixels
  for (int j = 0; j <= DIM*DIM; j++) {
    if (j >= (DIM*(K-1) + K)) {
      if ((j - 1 + DIM) % DIM >= (K-1)) {
        Serial.print(buff[j]);             
        if (buff[j] < 10) Serial.print(" ");
        if (buff[j] < 100) Serial.print(" ");
        Serial.print(" ");
      }
      if (((j-1 + DIM) % DIM) == DIM-1) {
        Serial.println();
      }
    }
  }

  digitalWrite(slaveSelectPin, HIGH);
  SPI.endTransaction();

  
//  digitalWrite(resetPin, HIGH);
//  delay(100);
//  digitalWrite(resetPin, LOW);
  
}

void loop() {}
