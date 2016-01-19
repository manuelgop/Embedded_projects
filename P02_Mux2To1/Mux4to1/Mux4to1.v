`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:37 01/13/2016 
// Design Name: 
// Module Name:    Mux4to1 
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
//New Style
module Mux4to1(
    input [3:0] A,
    input [3:0] B,
    input Sel,
    output [3:0] Y
    );
//Traditional style
module Mux4to1(A, B, Sel, Y);
//input ports
	input [3:0] A,B;
	input  	   Sel;
	//OUTOUT PORTS
	output [3:0] Y;
	

endmodule
