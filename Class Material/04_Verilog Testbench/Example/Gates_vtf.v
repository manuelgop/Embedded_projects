`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:11:59 09/05/2013
// Design Name:   Gates
// Module Name:   D:/Projects_SisDigAva/P20_Verilog_Gates/Gates_vtf.v
// Project Name:  P20_Verilog_Gates
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Gates
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Gates_vtf;

	// Inputs
	reg A;
	reg B;

	// Outputs
	wire Y;

	// Instantiate the Unit Under Test (UUT)
	Gates uut (
		.A(A), 
		.B(B), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 0; B = 0;
		#100;
		
		A = 0; B = 1;
		#100;
		
		A = 1; B = 0;
		#100;
		
		A = 1; B = 1;
		#100;

	end
      
endmodule

