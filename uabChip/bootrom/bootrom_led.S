#define DDR_BASE  0x80000000
#define BRAM_BASE 0x60010000
#define LED_BASE  0x70000000
//#define UART_BASE 0x60000000
//#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  csrwi 0x7c1, 0 // disable chicken bits
  li s0, DDR_BASE
  csrr a0, mhartid
  jr s0

.section .text.hang, "ax", @progbits
.globl _hang
_hang:
  csrwi 0x7c1, 0 // disable chicken bits
  csrr a0, mhartid

  li s0, 0xAA       // 0xAA = 10101010
  li s1, BRAM_BASE  // 0x60010000
  li s2, LED_BASE   // 0x70000000 
  sw s0, 0(s1)      // *(0x60010000) = 0xAA

.LED_LOOP:
  lb s0, 0(s1)      // s0 = *(0x60010000)
  sw s0, 0(s2)      // *(0x60010000) = s0
  j .LED_LOOP

# after poweron, the PC will be set to .text.hang(@0x10040) instead of _start