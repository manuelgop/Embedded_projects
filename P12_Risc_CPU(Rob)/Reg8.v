`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:02 02/10/2016 
// Design Name: 
// Module Name:    Reg8 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Reg8(
    input [7:0] Inrs,
    input En,
    input Clk,
    input Cen,
    input Rst,
    output [7:0] OutD
    );

	 reg [7:0] OutD; 
	 
	always@(negedge Clk)		
	begin 
		if(Rst)
			OutD = 8'b00000000;
		else 
		  if(Cen && En)
			OutD = Inrs;
	end
	
endmodule
