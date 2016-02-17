`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:47:42 02/10/2016
// Design Name:   FullAdder
// Module Name:   C:/Embedded Projects/P12_Risc_CPU/Risc_CPU/FullAdder_vtf.v
// Project Name:  Risc_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FullAdder_vtf;

	// Inputs
	reg [7:0] InA;
	reg [7:0] InB;

	// Outputs
	wire [7:0] S;

	// Instantiate the Unit Under Test (UUT)
	FullAdder uut (
		.InA(InA), 
		.InB(InB), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		InA = 0;
		InB = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

