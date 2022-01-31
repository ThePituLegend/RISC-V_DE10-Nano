FSBL_img = FSBL.rv64.img FSBL.rv32.img
FSBL_dump = FSBL.rv64.dump FSBL.rv32.dump

GCC=riscv64-unknown-elf-gcc
CFLAGS_RV64=-mabi=lp64 -march=rv64ima
CFLAGS_RV32=-mabi=ilp32 -march=rv32ima
OBJCOPY=riscv64-unknown-elf-objcopy
OBJDUMP=riscv64-unknown-elf-objdump

default: img dump

img: $(FSBL_img)

dump: $(FSBL_dump)

mif: FSBL.rv64.img
	srec_cat FSBL.rv64.img -binary -byte-swap 8 -o FSBL.mif -mif 64

%.img: %.elf
	$(OBJCOPY) -O binary --change-addresses=-0x60010000 $< $@
	

%.rv32.elf: %.S linker.ld
	$(GCC) $(CFLAGS_RV32) -Tlinker.ld $< -nostdlib -static -o $@

%.rv64.elf: %.S linker.ld
	$(GCC) $(CFLAGS_RV64) -Tlinker.ld $< -nostdlib -static -o $@

%.dump: %.elf
	$(OBJDUMP) -d $< > $@

clean:
	rm -f *.elf *.dump *.img *.mif
