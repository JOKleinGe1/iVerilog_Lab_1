module DFF (input clk, input D, output reg Q);
 always @(posedge clk)
     Q <= D;
endmodule

