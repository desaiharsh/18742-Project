#ifndef GB_CAM_H
#define GB_CAM_H

#include <stdint.h>

typedef enum mode {
	GBCAM_MODE_STANDARD 	= 0x20, // send one byte per pixel = 128*128 bytes data = [0x01:0xFF]
	GBCAM_MODE_NO_PIC 		= 0x21, // do not send image
	CAM_MODE_ONE_BIT 		= 0x22, // send a b&w image
	CAM_MODE_TWO_PIX 		= 0x23, // one pixel=4 bytes
	CAM_MODE_ONE_OVER_FOUR 	= 0x24, // send one pixel for evey four (64x64)
} gb_cam_mode_t;

void GBCamInit(void);
void GBCamSetReg(uint8_t _reg, uint8_t _data);
void GBCamSetMode(gb_cam_mode_t _mode);
void GBCamSetClock(uint8_t _clock);
void GBCamSetMinPixelValue(uint8_t _min);
void GBCamSetMaxPixelValue(uint8_t _max);
void GBCamUpdateReg(void);
void GBCamGetImage(uint16_t *dest);

#endif