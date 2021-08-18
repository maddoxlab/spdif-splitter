#include <SPI.h>

#if defined(__IMXRT1062__)
extern "C" uint32_t set_arm_clock(uint32_t frequency);
#endif

#define SPDIF_PIN_MODE 3

// Set some pin names
#define REG_CLEAR_PIN 8
#define SHIFT_ENABLE_PIN 9
#define LATCH_PIN 10
#define SPI_MOSI_PIN 11
#define SPI_CLK_PIN 13
#define LED_POW_PIN 16
#define LED_SPDIF_PIN 17

byte fifo_left[3];
byte fifo_right[3];
byte fifo_left_last[3];
byte fifo_right_last[3];

void setup() {
  set_arm_clock(500000000); // underclock Teensy to 400 MHz to save a bit of power

  // Initialize the S/PDIF clock ======== This might need to be modified to take the clock from S/PDIF in
  int n1 = 7; //0: divide by 1 (do not use with high input frequencies), 1:/2, 2: /3, 7:/8
  int n2 = 0; //0: divide by 1, 7: divide by 8

  CCM_CCGR5 &= ~CCM_CCGR5_SPDIF(CCM_CCGR_ON); //Clock gate off
  CCM_CDCDR = (CCM_CDCDR & ~(CCM_CDCDR_SPDIF0_CLK_SEL_MASK | CCM_CDCDR_SPDIF0_CLK_PRED_MASK | CCM_CDCDR_SPDIF0_CLK_PODF_MASK))
              | CCM_CDCDR_SPDIF0_CLK_SEL(0) // 0 PLL4, 1 PLL3 PFD2, 2 PLL5, 3 pll3_sw_clk
              | CCM_CDCDR_SPDIF0_CLK_PRED(n1)
              | CCM_CDCDR_SPDIF0_CLK_PODF(n2);
  CCM_CCGR5 |= CCM_CCGR5_SPDIF(CCM_CCGR_ON); //Clock gate on
 
  // Set up S/PDIF registers ========
  SPDIF_SRPC = SPDIF_SRPC_CLKSRC_SEL(1); //if (DPLL Locked) SPDIF_RxClk else tx_clk (SPDIF0_CLK_ROOT)
  // SPDIF_SCR = 0x0000400; // reset SPDIF configuration register with Tx normal (default)
  SPDIF_SCR = 0x0; // reset SPDIF configuration register with Tx send digital zeros
  SPDIF_SCR |= SPDIF_SCR_RXAUTOSYNC; // turn on s/pdif Rx autosync
  SPDIF_SCR &= ~SPDIF_SCR_RXFIFO_OFF_ON; // want it set to 0: Rx FIFO is on
 
  CORE_PIN15_CONFIG = SPDIF_PIN_MODE; // set pin 15 to s/pdif input
  IOMUXC_SPDIF_IN_SELECT_INPUT = 0; // GPIO_AD_B1_03_ALT3 - taken from input_spdif
  // RxFIFOFull_Sel This one has four options. Want it set to 00 - 1 sample in FIFO, the default
  // use SPDIF_SCR_RXFIFOFULL_SEL(0);

  // Enable S/PDIF FIFO full interrupt (bit 0)
  //SPDIF Rx FIFO full, can't be cleared with reg. IntClear. To clear it, read from Rx FIFO.
  SPDIF_SIE = 1;
  //attachInterrupt(IRQ_SPDIF, fifo_isr, HIGH);
 
  // Set up SPI shift registers ========
  pinMode(LATCH_PIN, OUTPUT);
  pinMode(SHIFT_ENABLE_PIN, OUTPUT);
  pinMode(REG_CLEAR_PIN, OUTPUT);
  pinMode(LED_POW_PIN, OUTPUT);
  pinMode(LED_SPDIF_PIN, OUTPUT);

  digitalWrite(SHIFT_ENABLE_PIN, LOW); // enable low
  digitalWrite(REG_CLEAR_PIN, LOW); // clear low
  digitalWrite(REG_CLEAR_PIN, HIGH); // clear low

  digitalWrite(LED_POW_PIN, HIGH);
  SPI.begin();
  //SPI.usingInterrupt(IRQ_SPDIF);
}

byte pwm_thresh = 0;
const byte ZERO_BYTE = 0;
unsigned int pwm_max = 256;
float f0 = 0.25;
float pi = 3.141592654;
const int n_leds = 4;
float x[n_leds];
void loop() {
  // get the audio data from the FIFO buffers
  fifo_left[0] = SPDIF_SRL >> 0;
  fifo_left[1] = SPDIF_SRL >> 8;
  fifo_left[2] = SPDIF_SRL >> 16;
  fifo_right[0] = SPDIF_SRR >> 0;
  fifo_right[1] = SPDIF_SRR >> 8;
  fifo_right[2] = SPDIF_SRR >> 16;
  
  // check to see if the audio data has changed since last loop
  bool fifo_left_change = (fifo_left[0] != fifo_left_last[0]) || (fifo_left[1] != fifo_left_last[1]) || (fifo_left[2] != fifo_left_last[2]);
  bool fifo_right_change = (fifo_right[0] != fifo_right_last[0]) || (fifo_right[1] != fifo_right_last[1]) || (fifo_right[2] != fifo_right_last[2]);
 
  if (SPDIF_SRPC & SPDIF_SRPC_LOCK) == SPDIF_SRPC_LOCK) { // is SPDIF connected?
    if (fifo_left_change || fifo_right_change) { // update the trigger status if there has been a change
      SPI.beginTransaction(SPISettings(100000000, MSBFIRST, SPI_MODE0));
      digitalWriteFast(LATCH_PIN, LOW);

      SPI.transfer(fifo_right[2]);
      SPI.transfer(fifo_right[1]);
      SPI.transfer(fifo_right[0]);
      SPI.transfer(fifo_left[2]);
      SPI.transfer(fifo_left[1]);
      SPI.transfer(fifo_left[0]);

      digitalWriteFast(LATCH_PIN, HIGH);
      SPI.endTransaction();

      fifo_left_last[0] = fifo_left[0];
      fifo_left_last[1] = fifo_left[1];
      fifo_left_last[2] = fifo_left[2];
      fifo_right_last[0] = fifo_right[0];
      fifo_right_last[1] = fifo_right[1];
      fifo_right_last[2] = fifo_right[2];
    }
  } else { // zero everything out if SPDIF is not connected
    SPI.beginTransaction(SPISettings(100000000, MSBFIRST, SPI_MODE0));
    digitalWriteFast(LATCH_PIN, LOW);
    
    SPI.transfer(ZERO_BYTE);
    SPI.transfer(ZERO_BYTE);
    SPI.transfer(ZERO_BYTE);
    SPI.transfer(ZERO_BYTE);
    SPI.transfer(ZERO_BYTE);
    SPI.transfer(ZERO_BYTE);

    digitalWriteFast(LATCH_PIN, HIGH);
    SPI.endTransaction();

    fifo_left_last[0] = fifo_left_last[1] = fifo_left_last[2] = 0;
    fifo_right_last[0] = fifo_right_last[1] = fifo_right_last[2] = 0;
  }
 
  digitalWriteFast(LED_SPDIF_PIN, (SPDIF_SRPC & SPDIF_SRPC_LOCK) == SPDIF_SRPC_LOCK);
}

// https://forum.pjrc.com/threads/66909-Realtime-S-PDIF-decoding-on-Teensy-4-0?p=276632#post276632
// See page 2036 and neighboring in https://www.pjrc.com/teensy/IMXRT1060RM_rev2.pdf

// other relevant projects
// https://forum.pjrc.com/threads/61142-USB-Audio-Frame-Sync-on-Teensy-4-0
// https://forum.pjrc.com/threads/58881-Teensy-4-0-Toslink-optical-output

// relevant registers:
// 4038_0000 SPDIF Configuration Register (SPDIF_SCR) 32 R/W 0000_0400h 40.6.1/2037
// 4038_000C InterruptEn Register (SPDIF_SIE) 32 R/W 0000_0000h 40.6.4/2041
// 4038_0010 InterruptStat Register (SPDIF_SIS) 32 R 0000_0002h 40.6.5/2043
// 4038_0010 InterruptClear Register (SPDIF_SIC) 32 W 0000_0000h 40.6.6/2045
// 4038_0014 SPDIFRxLeft Register (SPDIF_SRL) 32 R 0000_0000h 40.6.7/2046
// 4038_0018 SPDIFRxRight Register (SPDIF_SRR) 32 R 0000_0000h 40.6.8/2047
// see line 8392 here: https://github.com/PaulStoffregen/cores/blob/master/teensy4/imxrt.h
