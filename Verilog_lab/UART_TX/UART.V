// file:  uart.v - author: jok date 25-feb-2024

module uart (input clock, output  tx, input  [7:0] tx_data, input write_new_tx_data, input  [7:0] control_register ,
 output  [7:0] status_register);

// Note: signal "write_new_tx_data" must to be set during write cyle to tx_data register and reset otherwise 

localparam CLOCK_FREQUENCY =  50000000 ;
//localparam BAUDRATE  = 9600 ;   // for production
localparam BAUDRATE  = 5000000 ;  // for  simulation
localparam  BAUDRATEDIVIDER = ( CLOCK_FREQUENCY /  BAUDRATE ) ;

	reg [9:0]  tx_shift_register = 10'h3FF; 
	reg [15:0] baudrate_prescaler = 16'd0; 
	reg [3:0] tx_bitcount = 4'd0; 
	wire tbit_clock_enable; 
	wire tx_enable ; 
	reg tx_busy = 1'b0; 

	assign tbit_clock_enable  = ( baudrate_prescaler == ( BAUDRATEDIVIDER  - 1 )) ?  1'b1 : 1'b0; 
	assign tx =  tx_shift_register[0] ; 
	assign tx_enable = control_register[0]; 
	assign  status_register = { 7'b0000000, tx_busy}; 
	
	always @ (posedge clock)  
	begin 	
		baudrate_prescaler <= ( baudrate_prescaler +  tx_enable ) % BAUDRATEDIVIDER  ; 
		if (  write_new_tx_data &  ( !  tx_busy ) ) 
			begin
				 tx_bitcount  <= 4'd0;  
				tx_shift_register <= {1'b1,tx_data,1'b0}; 
				tx_busy  <= 1'b1; 
				baudrate_prescaler <= 16'd0; 
			end
		else if   ( (tbit_clock_enable &  tx_enable) && ( tx_bitcount < 9 ) ) 
			begin
				 tx_bitcount  <=   tx_bitcount  + 1;
				tx_shift_register <=  {1'b1,  tx_shift_register [9:1]};
			end
		else if ( (  tx_bitcount  >=  9 ) && (tbit_clock_enable) )  tx_busy  <= 1'b0; 
	end
endmodule
