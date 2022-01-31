#define BRAM_BASE 0x60010000
#define LED_VAL_ADDR 0x60010020
#define LED_BASE  0x70000000
//#define UART_BASE 0x60000000
//#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  li s1, LED_VAL_ADDR
  li s2, LED_BASE

.LED_LOOP:
  lb s0, 0(s1) // Read from memory
  sb s0, 0(s2) // Write to LED
  j .LED_LOOP