`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:22 01/24/2016 
// Design Name: 
// Module Name:    Mayority_detector 
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
module Mayority_detector(A, B, C, Y);
    input A;
    input B;
    input C;
    output Y;
	 
	 reg Y;
	 

	 
// The forllowing operators can be used on two single bits to produce a single bit 
// output or two equivalent sized bused signals where the operations are performed 
// on each bit of the bus. In the case of the Invert, only one signal or bus is 
// provided and the operation occurs on each bit of the signal.
// 
//    ~ .... Invert a single-bit signal or each bit in a bus
//    & .... AND two single bits or each bit between two buses
//    | .... OR two single bits or each bit between two buses
//    ^ .... XOR two single bits or each bit between two buses
//    ~^ ... XNOR two single bits or each bit between two buses
	 //Mayority detector
	 //Y = (AB) + (AC) + (BC);

	always @(*)
	begin
		Y = (A&B) | (A&C) | (B&C);
	end
	 
	 


endmodule
