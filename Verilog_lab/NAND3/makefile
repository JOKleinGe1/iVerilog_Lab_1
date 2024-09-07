#makefile
all: test.vcd
test.vvp  :  test.v  NAND3.V
	iverilog  -o $@  $^
test.vcd :test.vvp
	vvp   $^
clean :
	rm -f *.vcd *.vvp
