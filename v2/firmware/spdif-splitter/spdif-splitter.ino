#include <SPI.h>
#include <EEPROM.h>

#if defined(__IMXRT1062__)
extern "C" uint32_t set_arm_clock(uint32_t frequency);
#endif

#define SPDIF_PIN_MODE 3

// Set some pin names
#define CONFIG_PIN 5
#define REG_CLEAR_PIN 8
#define SHIFT_ENABLE_PIN 9
#define LATCH_PIN 10
#define SPI_MOSI_PIN 11
#define SPI_CLK_PIN 13
#define LED_POW_PIN 16
#define LED_SPDIF_PIN 17

// adresses in which the pinout bytes are stored -- 4 bytes needed for 25 pins
// each bit of pinout corresponds to a pin and the value stored says which bit to write
#define ADDR_CHANNEL 0
#define ADDR_PINOUT_0 1

const byte PINOUT_BP[] = {255, 0, 1, 2, 3, 4, 5, 6, 7, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255};
const byte PINOUT_RAW[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 255};
  
const unsigned int n_pins = 25;
byte pinout[n_pins];
uint32_t pinout_ground_mask = 0;
volatile uint32_t *spdif_fifo; // read from left or right SPDIF channel
volatile uint32_t spdif_fifo_current = 0;
volatile uint32_t spdif_fifo_prior = 0;
volatile uint32_t out_bits = 0;

void config();

void setup() {
  Serial.begin(9600);
  while (!Serial & (millis() < 3000));
  //set_arm_clock(500000000); // underclock Teensy to 400 MHz to save a bit of power

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
  SPDIF_SCR = 0x0; // reset SPDIF configuration register with Tx send digital zeros
  SPDIF_SCR |= SPDIF_SCR_RXAUTOSYNC; // turn on s/pdif Rx autosync
  SPDIF_SCR &= ~SPDIF_SCR_RXFIFO_OFF_ON; // want it set to 0: Rx FIFO is on

  CORE_PIN15_CONFIG = SPDIF_PIN_MODE; // set pin 15 to s/pdif input
  IOMUXC_SPDIF_IN_SELECT_INPUT = 0; // GPIO_AD_B1_03_ALT3 - taken from input_spdif

  // Set up SPI shift registers ========
  pinMode(CONFIG_PIN, INPUT_PULLUP);
  pinMode(LATCH_PIN, OUTPUT);
  pinMode(SHIFT_ENABLE_PIN, OUTPUT);
  pinMode(REG_CLEAR_PIN, OUTPUT);
  pinMode(LED_POW_PIN, OUTPUT);
  pinMode(LED_SPDIF_PIN, OUTPUT);

  // Interactively set the pinout if the config pin was held down at boot ========
  if (digitalReadFast(CONFIG_PIN) == LOW) {
    config();
  }

  digitalWriteFast(SHIFT_ENABLE_PIN, LOW); // enable low
  digitalWriteFast(REG_CLEAR_PIN, LOW); // clear low
  digitalWriteFast(REG_CLEAR_PIN, HIGH); // clear low
  digitalWriteFast(LED_POW_PIN, HIGH);
  SPI.begin();

  // Read in all the pinout information ========
  for (unsigned int i = 0; i < n_pins; i++) { // read the pinout into RAM and setup the ground mask
    pinout[i] = EEPROM.read(ADDR_PINOUT_0 + i);
    if (pinout[i] != 255) {
      pinout_ground_mask |= 1 << i;
    }
  }

  Serial.println("Your pinout is (255 means ground):");
  char str_pinout[20];
  char str_pinout_format[] = "%d: %d; ";
  for (unsigned int i = 0; i < n_pins; i++) { // read the pinout into RAM and setup the ground mask
    sprintf(str_pinout, str_pinout_format, i + 1, pinout[i]);
    Serial.print(str_pinout);
  }
  Serial.print('\n');

  Serial.print("Your input audio channel is ");
  if (EEPROM.read(ADDR_CHANNEL) == 0) {
    Serial.println("LEFT");
  } else {
    Serial.println("RIGHT");
  }
}

byte channel = EEPROM.read(ADDR_CHANNEL);
uint32_t get_fifo() {
  uint32_t fifo_read, fifo_ignore;
  if (channel) {
    fifo_ignore = SPDIF_SRL;
    fifo_read = SPDIF_SRR;
  } else {
    fifo_read = SPDIF_SRL;
    fifo_ignore = SPDIF_SRR;
  }
  return fifo_read;
}

const byte ZERO_BYTE = 0;
const int n_leds = 4;
void loop() {
  bool spdif_locked = (SPDIF_SRPC & SPDIF_SRPC_LOCK) == SPDIF_SRPC_LOCK;
  // get the audio data from the FIFO buffers
  if (spdif_locked) { // is SPDIF connected?
    spdif_fifo_current = get_fifo(); // store the current fifo value
    if (spdif_fifo_current != spdif_fifo_prior) { // update the trigger status if there has been a change
      out_bits = 0;
      // move the spdif bits to the right place for setting the pins according to the pinout
      for (unsigned int i = 0; i < n_pins; i++) {
        if (pinout[i] != 255) {
          // mask the bit at pinout[i]
          // move that bit to 0
          // move the bit at 0 to i
          // union with out_bits
          out_bits |= (((spdif_fifo_current) & (1 << pinout[i])) >> pinout[i]) << i;
        } else {
          ; // do nothing because it starts out 0
        }
      }

      // The LED indicators are taken from the four bits in the shift register following the initial 25
      out_bits |= (spdif_fifo_current & 0b1111) << (n_pins); // LED indicators show first four bits

      SPI.beginTransaction(SPISettings(100000000, MSBFIRST, SPI_MODE0));
      digitalWriteFast(LATCH_PIN, LOW);
      SPI.transfer(byte(out_bits >> 24));
      SPI.transfer(byte(out_bits >> 16));
      SPI.transfer(byte(out_bits >> 8));
      SPI.transfer(byte(out_bits >> 0));
      digitalWriteFast(LATCH_PIN, HIGH);
      SPI.endTransaction();

      spdif_fifo_prior = spdif_fifo_current;
    }
  } else { // zero everything out if SPDIF is not connected
    SPI.beginTransaction(SPISettings(100000000, MSBFIRST, SPI_MODE0));
    digitalWriteFast(LATCH_PIN, LOW);

    SPI.transfer(0); // this should really just use a clear instead
    SPI.transfer(0);
    SPI.transfer(0);
    SPI.transfer(0);

    digitalWriteFast(LATCH_PIN, HIGH);
    SPI.endTransaction();

    spdif_fifo_prior = 0;
  }

  digitalWriteFast(LED_SPDIF_PIN, spdif_locked);
}

void config() {
  bool valid_choice;
  char choice;
  const byte *pinout_choice ;
  
  digitalWriteFast(LED_POW_PIN, LOW);
  digitalWriteFast(LED_SPDIF_PIN, HIGH);

  // Set the input audio channel
  Serial.println("Your pinout options are: ");
  Serial.println("  [0] Passthrough (first 24 pins, ground on 25)");
  Serial.println("  [1] BrainProducts Actichamp DB25->DB9");
  valid_choice = false;
  while (!valid_choice) {
    Serial.print("Choose a pinout... ");
    while (!Serial.available());
    choice = Serial.read();
    switch (choice) {
      case '0':
        pinout_choice = PINOUT_RAW;
        valid_choice = true;
        break;
      case '1':
        pinout_choice = PINOUT_BP;
        valid_choice = true;
        break;
      default:
        Serial.println("\n  Invalid choice.");
    }
  }
  for (unsigned int i = 0; i < n_pins; i++) { // read the pinout into RAM and setup the ground mask
    EEPROM.write(ADDR_PINOUT_0 + i, pinout_choice[i]);
  }

  // Set the input audio channel
  Serial.println("Your S/PDIF audio channel options are:");
  Serial.println("  [0] Left");
  Serial.println("  [1] Right");
  valid_choice = false;
  while (!valid_choice) {
    Serial.print("Choose a channel... ");
    while (!Serial.available());
    choice = Serial.read();
    switch (choice) {
      case '0':
      case '1':
        EEPROM.write(ADDR_CHANNEL, choice - '0');
        valid_choice = true;
        break;
      default:
        Serial.println("\n  Invalid choice.");
    }
  }

  for (unsigned int i = 0; i < 10; i++) { // Flash the lights to know that config was successful
    delay(100);
    digitalWriteFast(LED_POW_PIN, HIGH);
    digitalWriteFast(LED_SPDIF_PIN, LOW);
    delay(100);
    digitalWriteFast(LED_POW_PIN, LOW);
    digitalWriteFast(LED_SPDIF_PIN, HIGH);
  }
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
