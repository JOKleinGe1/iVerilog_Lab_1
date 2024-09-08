`timescale 1ns/100ps
module test; 
  reg clk = 1'b0; 
  reg [7:0] cr;
  wire  [31:0] ms_cnt; 
  
  timer dut_timer( .clock(clk), 
    .control_register(cr),
    .millisec_counter(ms_cnt));

  always #10 clk <= ! clk; 
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,test);
    cr <= 8'b00000000; 
    #200
    cr <= 8'b00000010; 
    #1000
    cr <= 8'b00000001; 
    #2000
    cr <= 8'b00000000; 
    #10000
    cr <= 8'b00000001; 
    #10000
    cr <= 8'b00000010;
    #100
    cr <= 8'b00000000;
    #10000
    $finish;
  end
 endmodule
    
