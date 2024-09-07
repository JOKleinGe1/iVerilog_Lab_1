// testbench

module tb_PWMBlock; 
  reg Clock, LoadDuty;
  reg [7:0] DutyIn;
  wire PWMo; 
  
  PWMBlock dut_pwm  ( Clock, LoadDuty,DutyIn, PWMo);
  
  always #5 Clock <= ! Clock; 
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_PWMBlock);
    Clock <= 1'b0; 
    LoadDuty  <= 1'b0; 
  	DutyIn <= 8'hC0;  
    #10
    LoadDuty  <= 1'b1;
    #20
    LoadDuty  <= 1'b0; 
    #50000
  	DutyIn <= 8'h0f;  
    LoadDuty  <= 1'b1;
    #10 
    LoadDuty  <= 1'b0; 
    #50000
    $finish;
  end
 endmodule

