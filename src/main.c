#include <msp430.h>
#include <libio/console.h>
#include <libmspbuiltins/builtins.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>

#include "mem.h"
#include "gbcam.h"

static void init_hw() {
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

__fram uint16_t dest[0x4000];
int main() {
    init_hw();
    INIT_CONSOLE();
    GBCamInit();
    __enable_interrupt();

    PRINTF("\r\n=====================");
    GBCamUpdateReg();
    GBCamGetImage(dest);
    PRINTF("\r\n");
    for(uint8_t i = 0; i < 0x80; i++){
	    for(uint8_t j = 0; j < 0x80; j++){
	    	uint16_t addr = i * 0x80 + j;
	    	// if((dest[addr] >> 4) > 170) {
	    	// 	PRINTF(" ");
	    	// } else if((dest	[addr] >> 4) > 160) {
	    	// 	PRINTF("+");
	    	// } else {
	    	// 	PRINTF("#");
	    	// }
	    	PRINTF("%u ", dest[addr]);
	    }
	    PRINTF("\r\n ");
    }
    PRINTF("\r\n=====================");
}