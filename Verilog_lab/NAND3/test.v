`timescale 1 ns / 1 ps
module testbench;
  reg a = 1'b1;
  reg b = 1'b1;
  reg c = 1'b1;
  wire y;
  
  NAND3 myNAND3 (.A(a),.B(b), .C(c), .Y(y));
  
  always #5 a <= ~a;   
  always #10 b <= ~b;   
  always #20 c <= ~c;   
  initial begin
	 $dumpfile("test.vcd");
	$dumpvars(0, testbench );
    	#80;    	
	$finish;
   end;
endmodule

