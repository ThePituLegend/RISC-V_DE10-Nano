SHELL := /bin/bash

all: copy_rtl

add_config: UABChip.scala
	cp UABChip.scala ../chipyard/generators/chipyard/src/main/scala/config

bootrom_replace: bootrom
	cp -r bootrom ../chipyard/generators/testchipip/src/main/resources/testchipip/bootrom

compile: add_config bootrom_replace
	source ../chipyard/env.sh
	cd ../chipyard/sims/verilator && make verilog CONFIG=UABChip

copy_rtl:
	cp ../chipyard/sims/verilator/generated-src/chipyard.TestHarness.UABChip/chipyard.TestHarness.UABChip.top.mems.v ../quartus/ip/UABChip/chipyard.TestHarness.UABChip.top.mems.v
	cp ../chipyard/sims/verilator/generated-src/chipyard.TestHarness.UABChip/chipyard.TestHarness.UABChip.top.v ../quartus/ip/UABChip/chipyard.TestHarness.UABChip.top.v
	cp ../chipyard/sims/verilator/generated-src/chipyard.TestHarness.UABChip/ClockDividerN.sv ../quartus/ip/UABChip/ClockDividerN.sv
	cp ../chipyard/sims/verilator/generated-src/chipyard.TestHarness.UABChip/EICG_wrapper.v ../quartus/ip/UABChip/EICG_wrapper.v
	cp ../chipyard/sims/verilator/generated-src/chipyard.TestHarness.UABChip/IOCell.v ../quartus/ip/UABChip/IOCell.v
	cp ../chipyard/sims/verilator/generated-src/chipyard.TestHarness.UABChip/plusarg_reader.v ../quartus/ip/UABChip/plusarg_reader.v

gen_fsbl_mif: FSBL/FSBL.S
	cd FSBL && make clean && make && make mif
	cp FSBL/FSBL.mif ../quartus/onchip_memory.mif