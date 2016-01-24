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
	//Constants
	parameter BoardFreq = 50_000_000;//For my Basys2 board, the Clk is 50MHz
	//Number of bits 2^Bits = BoardFreq
	parameter Bits      = 27;//2^27>100000000
	//Embedded Signal
	reg [Bits-1 : 0 ] count;
	reg 					En1Hz;
	
	
	//Freq Division section
	always @(posedge Clk or posedge Clr)
	begin
		if (Clr)
			begin
				count = 0;
				En1Hz = 1'b0;
			end
		else 
			if (count !== BoardFreq - 1)
				begin
				count = count + 1'b1;
				En1Hz = 1'b0;
				end
			else 
				begin
				count = 0;
				En1Hz = 1'b1;
				end
	end
	
	
	//4-Bit binary Assending binary counter
	always @(posedge Clk or posedge Clr)
	begin
		if(Clr)
			Qtemp = 4'b0000;
		else if (En1Hz)
			Qtemp = Qtemp + 1'b1;
	end
	
		assign Q = Qtemp;
	





endmodule
