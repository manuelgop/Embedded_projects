`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:04 01/20/2016 
// Design Name: 
// Module Name:    Counters 
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
module Counters(Clr, Clk, Q);
//Clr for Async 
//Rst for Sync
	input Clr;
	input Clk;
	output [3:0] Q;
	//Register
	//reg [3:0] Q;
	reg [3:0] Qtemp;
	//Embedded Signal
	
	
	//4-Bit binary Assending binary counter
/*	always @(posedge Clk or posedge Clr)
	begin
		if(Clr)
			Qtemp = 4'b0000;
		else
			Qtemp = Qtemp + 1'b1;
	end
	
	assign Q = Qtemp;*/
	
		//4-Bit binary Assending BCD counter
/*	always @(posedge Clk or posedge Clr)
	begin
		if(Clr)
			Qtemp = 4'b0000;
		else if(Qtemp == 4'b1001)
			Qtemp = 4'b0000;
		else
			Qtemp = Qtemp + 1'b1;
	end
	
	assign Q = Qtemp;*/

	//4-Bit binary Desending Binary counter
	always @(posedge Clk or posedge Clr)
	begin
		if(Clr)
			Qtemp = 4'b1111;
		else
			Qtemp = Qtemp - 1'b1;
	end
	
	assign Q = Qtemp;


endmodule
