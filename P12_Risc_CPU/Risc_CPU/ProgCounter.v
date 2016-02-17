`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:42 02/10/2016 
// Design Name: 
// Module Name:    ProgCounter 
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
module ProgCounter(
    input [7:0] PCIn,
    input Clk,
    input Cen,
    input Rst,
    output [7:0] PCOut
    );
	//Registras la salida si la usas en tu always 
	 reg [7:0] PCOut;
	 
	 always @(posedge Clk) begin//clear syncrono
	 if(Rst)
		PCOut = 8'b00000000;
		else
			if(Cen)
			PCOut = PCIn;
	 end
	 


endmodule
