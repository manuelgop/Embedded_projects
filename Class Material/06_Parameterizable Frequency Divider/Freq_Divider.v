`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       RickWare
// 
// Create Date:    16:31:45 09/12/2013 
// Design Name: 
// Module Name:    Freq_Divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Parameterizable Frequency Divider
//                 Tested on a DigilentInc Nexys-3 board
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Freq_Divider(clk,rst,clk_out);

  input  clk;
  input  rst;
  output clk_out;
  reg    clk_out;
  
 parameter Divisor = 100000000; // Board oscillator frequency
 parameter Bits    = 27;        // 27 bits needed for a 100MHz Clock
 
 reg [Bits - 1 : 0] counter;

  always @(posedge clk or posedge rst)
  begin
    if (rst) begin
	   counter <= 0;
		clk_out <= 1'b0;
	 end
	 else
	   if (counter !== Divisor - 1) begin
		  counter <= counter + 1;
		  clk_out <= 1'b0;
		end
		else begin
		  counter <= 0;
		  clk_out <= 1'b1;
		end
  end
  
endmodule
