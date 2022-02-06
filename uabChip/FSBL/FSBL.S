#define BRAM_BASE         0x60010000
#define BRAM_LED_VAL_ADDR 0x60010020
#define LED_BASE          0x70000000
#define DDR_BASE          0x80000000
//#define UART_BASE 0x60000000
//#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  li s0, DDR_BASE   // 0x80000000

  li s1, 0x0AA00293 // li t0,170
  sw s1, 0x00(s0)   // 0x80000000
  li s1, 0x0010049B // addiw s1,zero,1
  sw s1, 0x04(s0)   // 0x80000004
  li s1, 0x01F49493 // slli s1,s1,0x1f
  sw s1, 0x08(s0)   // 0x80000008
  li s1, 0x03048493 // addi s1,s1,48
  sw s1, 0x0c(s0)   // 0x8000000c
  li s1, 0x70000937 // lui s2,0x70000
  sw s1, 0x10(s0)   // 0x80000010
  li s1, 0x00548023 // sb t0,0(s1)
  sw s1, 0x14(s0)   // 0x80000014  
  li s1, 0x00048403 // lb s0,0(s1)
  sw s1, 0x18(s0)   // 0x80000018
  li s1, 0x00890023 // sb s0,0(s2)
  sw s1, 0x1c(s0)   // 0x8000001c
  li s1, 0xFF9FF06F // j 0x80000018
  sw s1, 0x20(s0)   // 0x80000020

  jr s0             // Salt a la SDRAM
  