module counter (input clock, input enable , output reg [31:0] count = 32'd0);
	always @(posedge clock) count <= count + enable ;
endmodule
