`timescale 1ns/100ps
module TB_TITANIC ; 
	reg clock = 1'b0; 
	wire led;
	TITANIC myboat (clock,led); 
	always #5 clock <= ! clock ; 
	initial 
      begin
    	$dumpfile("dump.vcd");
	$dumpvars(0, TB_TITANIC );
    	#1000
    	$display("Fin de simulation");
    	$finish; 
      end
endmodule
