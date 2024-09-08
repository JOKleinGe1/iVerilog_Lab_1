`timescale 1ns/100ps
module test; 
  reg clk = 1'b0; 
  reg [7:0] txd = 8'd0;
  reg  write = 1'b0;
  reg  [7:0] cr ;   
  wire  [7:0] sr ; 
  wire tx;
  
 uart myuart (.clock(clk), .tx(tx), .tx_data(txd), .write_new_tx_data(write), .control_register(cr),
.status_register(sr));   

  always #10 clk <= ! clk; 
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,test);
    cr <= 8'b00000000; // start with tx disable...
    #200
    cr <= 8'b00000001; // ...then enable tx
    #100
    txd <= 8'h48; // set tx data to 48h, is Ascii for 'H'
    #40 write <= 1'b1; // write the byte to data register (and send it to tx)
    #40 write <= 1'b0;
  @ (negedge sr[0]) ; // then wait for end of the byte transmission

    txd <= 8'h65; // set tx data to 65h, is Ascii for 'e'
    #40 write <= 1'b1; // write the byte to data register (and send it to tx)
    #40 write <= 1'b0;
  @ (negedge sr[0]) ; // then wait for end of the byte transmission

    txd <= 8'h6C; // set tx data to 6Ch, is Ascii for 'l'
    #40 write <= 1'b1; // write the byte to data register (and send it to tx)
    #40 write <= 1'b0;
  @ (negedge sr[0]) ; // then wait for end of the byte transmission

    txd <= 8'h6C; // set tx data to 46C, is Ascii for 'l'
    #40 write <= 1'b1; // write the byte to data register (and send it to tx)
    #40 write <= 1'b0;
  @ (negedge sr[0]) ; // then wait for end of the byte transmission

    txd <= 8'h6F; // set tx data to 6Fh, is Ascii for 'o'
    #40 write <= 1'b1; // write the byte to data register (and send it to tx)
    #40 write <= 1'b0;
  @ (negedge sr[0]) ; // then wait for end of the byte transmission

    txd <= 8'h21; // set tx data to 21h, is Ascii for '!'
    #40 write <= 1'b1; // write the byte to data register (and send it to tx)
    #40 write <= 1'b0;
  @ (negedge sr[0]) ; // then wait for end of the byte transmission

    txd <= 8'h20; // set tx data to 20h, is Ascii for ' '
    #40 write <= 1'b1; // write the byte to data register (and send it to tx)
    #40 write <= 1'b0;
 @ (negedge sr[0]) ; // then wait for end of the byte transmission
    cr <= 8'b00000000; // Finaly disable tx
    #200
    $finish;
  end
 endmodule
    
