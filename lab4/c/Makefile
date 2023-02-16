SIM_TIME = 7us
GHDLFLAGS = --std=08
GHDLRUNFLAGS = --stop-time=$(SIM_TIME) --vcd=wave.vcd
UNIT_FILES = src/dff.vhd src/shiftn.vhd
TB_ENTITY = tb_shiftn
TB_FILE = src/$(TB_ENTITY).vhd

vhdl:
	if pgrep gtkwave; then pkill gtkwave; fi
	ghdl -a $(GHDLFLAGS) $(UNIT_FILES)
	ghdl -a $(GHDLFLAGS) $(TB_FILE)
	ghdl -e $(GHDLFLAGS) $(TB_ENTITY)
	ghdl -r $(GHDLFLAGS) $(TB_ENTITY) $(GHDLRUNFLAGS)
	gtkwave --rcfile .gtkwaverc wave.vcd & # the & makes the terminal continue after opening gtkwave

clean:
	rm -f *.{vcd,cf}
