#define BRAM_BASE         0x60010000
#define BRAM_LED_VAL_ADDR 0x60010020
#define LED_BASE          0x70000000
#define DDR_BASE          0x80000000
//#define UART_BASE 0x60000000
//#define SPI_BASE  0x60020000

.section .text.start, "ax", @progbits
.globl _start
_start:
  li s0, DDR_BASE

  li s1, 0x0AA00293
  sw s1, 0x00(s0)

  li s1, 0x0010049B
  sw s1, 0x04(s0)
  
  li s1, 0x01F49493
  sw s1, 0x08(s0)
  
  li s1, 0x03048493
  sw s1, 0x0c(s0)
  
  li s1, 0x70000937
  sw s1, 0x10(s0)
  
  li s1, 0x00548023
  sw s1, 0x14(s0)  
  
  li s1, 0x00048403
  sw s1, 0x18(s0)

  li s1, 0x00890023
  sw s1, 0x1c(s0)

  li s1, 0xFF9FF06F
  sw s1, 0x20(s0)

// ------------------- //
loop:
  jr s0 // Jump to DDR