// PWM Block
module PWMBlock (input Clock, input LoadDuty,  input [7:0]DutyIn, 
output  PWMo);  
  reg [7:0] counter = 8'h00;
  reg [2:0] prescaler = 3'b000; 
  reg [7:0] duty = 8'h00;
  always @ (posedge Clock) prescaler <= ( prescaler + 3'b001 )%5; 
  always @ (posedge Clock) counter <= counter + (prescaler==3'b000);
  always @ (posedge Clock) if (LoadDuty) duty <= DutyIn;
  assign PWMo = (counter < duty) ? 1'b1 : 1'b0;
endmodule
