`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:44 09/12/2013 
// Design Name: 
// Module Name:    Counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    4-bit binary counter
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Counter(ClkIn, Rst, Count);

    input         ClkIn;
	 input         Rst;
	 	 
    output [3:0]  Count;

	 reg   [3:0]  CountTemp;

	
	always @(posedge ClkIn or posedge Rst)
	begin
	  if (Rst == 1'b1)
	    CountTemp <= 4'b0000;
	  else
       CountTemp <= CountTemp + 1;
   end
			
   assign Count = CountTemp;

endmodule
