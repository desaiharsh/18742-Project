#include <msp430.h>
#include <stdbool.h>

#include <libmspbuiltins/builtins.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libio/console.h>

#include "gbcam.h"

#define ADC BIT0
#define START BIT1
#define SIN BIT2
#define LOAD BIT3
#define RESET BIT4
#define XCK BIT5
#define READ BIT6

#define cbi(v, b) (v & (~(0x1 << b)))
#define sbi(v, b) (v | (0x1 << b))

static void start(void);
static bool waitRead(void);
static void stepDelay(void);
static void clockL(void);
static void clockH(void);
static void reset(void);
static void updateReg(uint8_t addr, uint8_t val);
static uint16_t readADC(void);

// Zero Point Calibration
// Analog Output Gain
// Exposure time 16us step
// Exposure time 4.096ms step
// 1-D filtering kernel
// 1-D filtering kernel
// 1-D filtering kernel
// Edge Enhancement, Inversion
static uint8_t reg[8] = {0x80, 0x03, 0x00, 0x20, 0x01, 0x00, 0x01, 0x21};
static gb_cam_mode_t mode = GBCAM_MODE_STANDARD;
static uint8_t clock = 0x0A;
static uint8_t pixelMin = 0;
static uint8_t pixelMax = 0;

void GBCamInit(void) {
	// ADC
	P3SEL0 |= ADC;
	P3SEL1 |= ADC;
	// Read Input
	P3SEL0 &= ~READ;
	P3SEL1 &= ~READ;
	P3DIR &= ~READ;
	// Outputs
	P3DIR |= (XCK | RESET | LOAD | START | SIN);
	P3OUT &= ~(XCK | RESET | LOAD | START | SIN);
}

void GBCamSetReg(uint8_t _reg, uint8_t _data) {
	reg[_reg] = _data;
}

void GBCamSetMode(gb_cam_mode_t _mode) {
	mode = _mode;
}

void GBCamSetClock(uint8_t _clock) {
	clock = _clock;
}

void GBCamSetMinPixelValue(uint8_t _min) {
	pixelMin = _min;
}

void GBCamSetMaxPixelValue(uint8_t _max) {
	pixelMax = _max;
}

void GBCamUpdateReg(void) {
	reset();
	for(uint8_t i = 0; i < 8; i++) updateReg(i, reg[i]);
}

void GBCamGetImage(uint16_t *dest) {
	start();
	while(!waitRead());

	clockL();
	stepDelay();
	stepDelay();

	clockH();
	stepDelay();
	uint16_t idx = 0;
	while(P3IN & READ) {
		switch(mode) {
			case GBCAM_MODE_STANDARD:
				*dest++ = readADC();
			case GBCAM_MODE_NO_PIC:
				break;
			default: break;
		}
		stepDelay();
		clockL();
		stepDelay();
		stepDelay();

		clockH();
		stepDelay();
	}
	stepDelay();
	reset();
}

// Private helper functions
inline void stepDelay(void) {
	unsigned char u = clock;
	while(u--) {__asm__ __volatile__ ("nop");}
}

inline void clockL(void) {
	P3OUT &= ~XCK;
}

inline void clockH(void) {
	P3OUT |= XCK;
}

void reset(void) {
	clockL();
	P3OUT &= ~RESET;
	stepDelay();
	stepDelay();

	clockH();
	stepDelay();
	stepDelay();
	P3OUT |= RESET;
}

void updateReg(uint8_t addr, uint8_t val) {
	for(uint8_t mask = 4; mask >= 1; mask >>= 1) {
		clockL();
		stepDelay();
		P3OUT &= ~LOAD;
		if(addr & mask) P3OUT |= SIN;
		else P3OUT &= ~SIN;
		stepDelay();

		clockH();
		stepDelay();
		P3OUT &= ~SIN;
		stepDelay();
	}
	for(uint8_t mask = 0x80; mask >= 2; mask >>= 1) {
		clockL();
		stepDelay();
		if(val & mask) P3OUT |= SIN;
		else P3OUT &= ~SIN;
		stepDelay();

		clockH();
		stepDelay();
		P3OUT &= ~SIN;
		stepDelay();
	}
	clockL();
	stepDelay();
	if(val & 1) P3OUT |= SIN;
	else P3OUT &= ~SIN;
	stepDelay();

	clockH();
	stepDelay();
	P3OUT |= LOAD;
	stepDelay();
}

void start(void) {
	clockL();
	stepDelay();
	P3OUT &= ~(SIN | LOAD);
	P3OUT |= START;
	stepDelay();

	clockH();
	stepDelay();
	P3OUT &= ~START;
	stepDelay();
}

bool waitRead(void) {
	clockL();
	stepDelay();
	stepDelay();

	clockH();
	stepDelay();
	if(P3IN & READ) {
		stepDelay();
		return true;
	}
	stepDelay();
	return false;
}

uint16_t readADC(void) {
	__delay_cycles(1000);
	ADC12CTL0 &= ~ADC12ENC;           			// Disable conversions
	ADC12CTL1 = ADC12SHP;
	ADC12MCTL0 = ADC12VRSEL_1 | ADC12INCH_12; 	// ADC Channel
	ADC12CTL0 |= ADC12SHT03 | ADC12ON;

	while(REFCTL0 & REFGENBUSY);
	REFCTL0 = REFVSEL_0 | REFON;            	//Set reference voltage to 2.5

	__delay_cycles(1000);                   	// Delay for Ref to settle

	ADC12CTL0 |= ADC12ENC;                  	// Enable conversions
	ADC12CTL0 |= ADC12SC;                   	// Start conversion
	while (ADC12CTL1 & ADC12BUSY) ;

	uint16_t output = ADC12MEM0 & 0x0FFF;

	ADC12CTL0 &= ~ADC12ENC;                 	// Disable conversions
	ADC12CTL0 &= ~(ADC12ON);                	// Shutdown ADC12
	REFCTL0 &= ~REFON;
	return output;
}