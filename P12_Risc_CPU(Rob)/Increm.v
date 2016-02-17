`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:37 02/10/2016 
// Design Name: 
// Module Name:    Increm 
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
module Increm(
    input [7:0] InA,
    input [7:0] InB,
    input Sel,
    output [7:0] M
    );

	reg [7:0] M;
	
	always@(*)
	begin 
		if (Sel)
			M = InB;
		else 
			M = InA;
	end

endmodule
