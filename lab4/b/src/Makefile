# Makefile
SIM ?= ghdl
TOPLEVEL_LANG ?= vhdl
# VHDL 2008
EXTRA_ARGS +=--std=08
# TOPLEVEL is the name of the toplevel module in your VHDL file
TOPLEVEL = variables_vs_signals
VHDL_SOURCES += $(PWD)/$(TOPLEVEL).vhd #VHDL_SOURCES += $(PWD)/../../hdl/*.vhdl
SIM_ARGS +=--wave=$(TOPLEVEL).ghw
# MODULE is the basename of the Python test file 
MODULE = tb_$(TOPLEVEL)

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

# removing generated binary of top entity and .o-file on make clean
clean::
	-@rm -f $(TOPLEVEL)
	-@rm -f e~$(TOPLEVEL).o

# for vhdl tb: (not python tb)
GHDLFLAGS= --std=08
GHDLRUNFLAGS= --stop-time=$(sim_time) --vcd=wave.vcd
# How to example:
	# make unit_file=first.vhd tb_file=tb_first.vhd tb_entity=tb_first sim_time=1us

vhdl:
	if pgrep gtkwave; then pkill gtkwave; fi
	ghdl -a $(GHDLFLAGS) $(unit_file_1)
	ghdl -a $(GHDLFLAGS) $(unit_file_2)
	ghdl -a $(GHDLFLAGS) $(tb_file)
	ghdl -e $(GHDLFLAGS) $(tb_entity)
	ghdl -r $(GHDLFLAGS) $(tb_entity) $(GHDLRUNFLAGS)
	gtkwave --rcfile .gtkwaverc wave.vcd &

