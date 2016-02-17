`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:22 09/12/2013
// Design Name:   Counter
// Module Name:   D:/Projects_SisDigAva/P99a_Verilog_Counter/Counter_vtf.v
// Project Name:  P99a_Verilog_Counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Counter_vtf;

	// Inputs
	reg ClkIn;
	reg Rst;

	// Outputs
	wire [3:0] Count;

	// Instantiate the Unit Under Test (UUT)
	Counter uut (
		.ClkIn(ClkIn), 
		.Rst(Rst), 
		.Count(Count)
	);

	// Clock generator
	always
	begin
	  #50 ClkIn = ~ClkIn;
	end

	initial begin
		// Initialize Inputs
		ClkIn = 0;
		Rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		  
		// Add stimulus here
      Rst = 1; #100;
		Rst = 0; #2000;
		

		
	end
      
endmodule

