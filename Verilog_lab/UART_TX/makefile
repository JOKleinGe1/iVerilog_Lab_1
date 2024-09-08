all : dump.vcd
model.vvp : test.v UART.V
	iverilog $^ -o $@
dump.vcd : model.vvp
	vvp $^
clean : 
	rm -f *.vcd *.vvp

