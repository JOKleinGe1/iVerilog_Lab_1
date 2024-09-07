all : dump.vcd
model.vvp : test.v TIMER.V
	iverilog $^ -o $@
dump.vcd : model.vvp
	vvp $^
clean : 
	rm -f *.vcd *.vvp

