#define LED_VAL_ADDR 0x80000030
#define LED_BASE     0x70000000
//#define UART_BASE 0x60000000
//#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  li s1, LED_VAL_ADDR   // 0x80000030
  li s2, LED_BASE       // 0x70000000

  li t0, 0xAA           // 0xAA = 10101010
  sw t0, 0(s1)          // *(0x80000030) = 0xAA

.loop:
  lb	s0,0(s1)        // s0 = *(0x80000030) 
  sb	s0,0(s2)        // *(0x70000000) = s0
  j	.loop