`timescale 1 ns / 1 ps
module testbench;
  reg clk = 1'b0;
  reg d;
  wire q;
  DFF myDFF(.clk(clk),.D(d), .Q(q));
  always #5 clk <= ~clk;   
  initial begin
  $dumpfile("test.vcd");
  $dumpvars(0, testbench );
    d <= 1'b0; 
    	#20;
    d <= 1'b1; 
    	#20;
    d <= 1'b0; 
    	#20;    	
   $finish;
   end;
endmodule
