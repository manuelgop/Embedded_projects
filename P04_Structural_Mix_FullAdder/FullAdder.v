`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:58 01/19/2016 
// Design Name: 
// Module Name:    FullAdder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Structural (Hirarchical) Full Adder 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//


module Adder(
	input A,
	input B,
	input C,
	output S0,
	output S1
);
	//Declaration of embedded signals for Adder module
	wire S_emb;
	//Define Operation for module Adder
	assign S_emb = A ^ B;
	assign S1 = S_emb ^ C;
	assign S0 = S_emb;
endmodule

/*module Carry(
	input A,
	input B,
	input C,
	input D,
	output C0
);
	//Declaration of embedded
	wire AB_emb, CD_emb;
//Define Operation for module Carry
	assign AB_emb = A & B;
	assign CD_emb = C & D;
	assign C0 = AB_emb | CD_emb;
	
endmodule*/

//Connect mdoules together
//////////////////////////////////////////////////////////////////////////////////
module FullAdder(
    input A,
    input B,
    input Cin,
    output Sout,
    output Cout
    );

	//Declaration of embedded signals fot TOP module(Full Adder)
	wire C_emb;
	//Connect things together (Instantianting)
	Adder U1 (A, B, Cin, C_emb, Sout);
	Carry U2 (C_emb, Cin, A, B, Cout);
	

endmodule
