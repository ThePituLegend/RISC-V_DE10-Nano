SECTIONS
{
    BRAM_BASE = 0x60010000;

    . = BRAM_BASE;
    .text.start : { *(.text.start) }
}
