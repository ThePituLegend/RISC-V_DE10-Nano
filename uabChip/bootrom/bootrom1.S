#define DDR_BASE  0x80000000
#define LED_BASE  0x70000000

.section .text.start, "ax", @progbits
.globl _start
_start:
  csrwi 0x7c1, 0
  li s0, DDR_BASE
  csrr a0, mhartid
  jr s0

.section .text.hang, "ax", @progbits
.globl _hang
_hang: // Per defecte, el processador arrenca aquí

  // Setup necessari
  csrwi 0x7c1, 0
  csrr a0, mhartid

  li s0, 0xAA     // 0xAA = 10101010
  li s1, LED_BASE // 0x70000000 
  sw s0, 0(s1)    // *(0x70000000) = 0xAA

// Es deixa el procesador en bucle
.L1:
  j .L1