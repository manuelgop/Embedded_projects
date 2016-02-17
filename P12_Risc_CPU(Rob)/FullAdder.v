`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:14 02/10/2016 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(
    input [7:0] InA,
    input [7:0] InB,
    output [7:0] S
    );

	assign S = InA + InB;

	/*
	//Another Implementation
	always@(*) //el asterisco mete mis parametros por default
	begin
		S = InA + InB;
	end
	*/
 
endmodule
