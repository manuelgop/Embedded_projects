`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:13:48 02/10/2016 
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
module Mux4to1(
    input [7:0] InA,
    input [7:0] InB,
    input [7:0] InC,
    input [7:0] InD,
    input [1:0] Sel,
    output [7:0] M
    );
	 
	//Register Output for always*
	reg [7:0] M;
	
	//Constant Declarations
	 parameter S0 = 2'b00;
	 parameter S1 = 2'b01;
	 parameter S2 = 2'b10;
	 parameter S3 = 2'b11;
	 
	 
//Sequential Implementation version 4 Using Constants
	always @(Sel or InA or InB or InC or InD)
	begin
		case (Sel)
			S0  : M = InA;
			S1  : M = InB;
			S2  : M = InC;
			S3  : M = InD;
			//default is optional but highly recomendable
			/*default: Y = A;
			*/
		endcase
	end
	
endmodule
