#include <msp430.h>
#include <libio/console.h>
#include <libmspbuiltins/builtins.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>

#include <libmspware/eusci_b_spi.h>
#include <libmspware/cs.h>

#include "mem.h"
#include "gbcam.h"

EUSCI_B_SPI_initMasterParam initB;

#define SPI_CLK 2000000;

uint16_t base = 0x0680;

void spi_init();

static void init_hw() {
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();

	P7DIR |= BIT0;
	
	P7OUT |= BIT0;
	spi_init();
//	P7OUT &= ~BIT0;
}

__fram uint16_t dest[0x4000];
//__fram uint8_t recd[0x5000];
int main() {
    init_hw();
   
	 	P5DIR |= BIT3;
		P5OUT |= BIT3;
 		
		P5SEL0 |= BIT0 + BIT1 + BIT2;
		P5SEL1 &= ~(BIT0 + BIT1 + BIT2);

		P5DIR |= BIT0 + BIT2;
		P5DIR &= ~BIT1;

		P7OUT &= ~BIT0;
		__delay_cycles(1000);
		P7OUT |= BIT0;
	
	//	INIT_CONSOLE();
	 	
	//	GBCamInit();
    __enable_interrupt();
		P7OUT &= ~BIT0;
		__delay_cycles(1000);
		P7OUT |= BIT0;
    
	//	PRINTF("\r\n=====================");
    
	//	GBCamUpdateReg();
    P7OUT &= ~BIT0;
		__delay_cycles(1000);
		P7OUT |= BIT0;
	//	GBCamGetImage(dest);
    
	//	PRINTF("\r\n");
		
		P7OUT &= ~BIT0;
		while(EUSCI_B_SPI_isBusy(base) != EUSCI_B_SPI_NOT_BUSY){
			//PRINTF("Waiting for line to be free\n");
			}

		int stride = 1;

		P5OUT &= ~BIT3;
		
		unsigned char t = 0;

    for(uint8_t i = 0; i < 32; i+=stride){
	    for(uint8_t j = 48; j < 48+32; j+=stride){
	    	uint16_t addr = i * 0x80 + j;
	    	// if((dest[addr] >> 4) > 170) {
	    	// 	PRINTF(" ");
	    	// } else if((dest	[addr] >> 4) > 160) {
	    	// 	PRINTF("+");
	    	// } else {
	    	// 	PRINTF("#");
	    	// }
	    	
		//		PRINTF("%u ", (uint8_t)(dest[addr] & 0xFF));
				//EUSCI_B_SPI_transmitData(base, (uint8_t)(dest[addr] & 0xFF));
				EUSCI_B_SPI_transmitData(base, (uint8_t)(t & 0xFF));
				while(!EUSCI_B_SPI_getInterruptStatus(base, EUSCI_B_SPI_TRANSMIT_INTERRUPT)){}
				t++;
	    }
	  //  PRINTF("\r\n ");
    }
		P5OUT |= BIT3;
  //  PRINTF("\r\n=====================");

}

void spi_init(){
	initB.selectClockSource = EUSCI_B_SPI_CLOCKSOURCE_SMCLK;
	initB.clockSourceFrequency = CS_getSMCLK();
	//	PRINTF("Clock Freq: %l\n", (initB.clockSourceFrequency));
	initB.desiredSpiClock =	SPI_CLK;
	initB.msbFirst = EUSCI_B_SPI_MSB_FIRST;
	initB.clockPhase = EUSCI_B_SPI_PHASE_DATA_CAPTURED_ONFIRST_CHANGED_ON_NEXT;
	initB.clockPolarity = EUSCI_B_SPI_CLOCKPOLARITY_INACTIVITY_LOW;
	initB.spiMode = EUSCI_B_SPI_3PIN;
  EUSCI_B_SPI_initMaster(base, &initB);
	EUSCI_B_SPI_clearInterrupt(base, EUSCI_B_SPI_TRANSMIT_INTERRUPT + 	EUSCI_B_SPI_RECEIVE_INTERRUPT);
	EUSCI_B_SPI_enable(base);
	}
