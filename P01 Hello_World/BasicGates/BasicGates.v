`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESM
// Engineer: Manuel Gopar
// 
// Create Date:    17:52:33 01/13/2016 
// Design Name: 
// Module Name:    BasicGates 
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
//OLD STYLE:
module BasicGates(A, B, Y);
	input A;
	input B;
	output Y;
	reg Y;

//Latest Style	
/*module BasicGates(
    input A,
    input B,
    output Y
    );
*/

// Concurrent Gate Description
//assign Y = A & B; //AND GATE
//assign Y = A | B;//OR gate
//assign Y = ~A; //NOT A
//assign Y = ~(A & B); //Nand 
//assign Y = ~(A | B); //Nor 
//assign Y = A ^ B;//xor
//assign Y = ~(A ^ B);//xor 
//assign Y = A;

///////
//////
///Sequential declaration OLD STYLE
//always @(A or B)
//begin 
//	Y = A ^ B; //XOR
//end
///////////
///Sequential declaration 	NEW STYLE
always 
begin 
	Y = A & B; //AND
end

endmodule
