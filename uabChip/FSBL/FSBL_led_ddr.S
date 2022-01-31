#define BRAM_BASE    0x60010000
#define LED_VAL_ADDR 0x60010030
#define LED_BASE     0x70000000
#define DDR_BASE     0x80000000
//#define UART_BASE 0x60000000
//#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  li s1, LED_VAL_ADDR
  li s2, LED_BASE
  
  li t0, 170
  li s3, DDR_BASE

  sw t0, 0(s3)

.LED_LOOP:
  lw s0, 0(s3)     // Read from memory
  sw s0, 0(s2)     // Write to LED
  j .LED_LOOP