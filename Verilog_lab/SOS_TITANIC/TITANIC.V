module TITANIC (input clock200MHz , output LED); 
  reg [4:0] counter = 3'd0;
  reg [0:31]lookUpTable  = 32'h0A8EEE2A; 
    always @(posedge clock200MHz) counter <= counter + 5'd1;
	assign LED = lookUpTable[counter]; 
endmodule
