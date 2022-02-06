#define BRAM_BASE    0x60010000
#define LED_BASE     0x70000000
#define DDR_BASE     0x80000000
//#define UART_BASE 0x60000000
//#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  li s1, LED_BASE // 0x70000000
  li s2, DDR_BASE // 0x80000000

  li t0, 0xAA     // 0xAA = 10101010
  sw t0, 0(s2)    // *(0x80000000) = 0xAA

.LED_LOOP:
  lw s0, 0(s2)    // s0 = *(0x80000000)
  sw s0, 0(s1)    // *(0x70000000) = s0
  
.L1
  j .L1