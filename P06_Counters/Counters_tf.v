`timescale 1ns / 1ps


////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:05:09 01/20/2016
// Design Name:   Counters
// Module Name:   C:/Embedded Projects/P06_Counters/Counters_tf.v
// Project Name:  P06_Counters
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counters
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Counters_tf;

	// Inputs
	reg Clr;
	reg Clk;

	// Outputs
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	Counters uut (
		.Clr(Clr), 
		.Clk(Clk), 
		.Q(Q)
	);

//Define a Clock with a 100ns period
	always 
		begin
			#50 Clk = ~Clk;
		end

	initial begin
		// Initialize Inputs
		Clr = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Clr = 1'b1; #300;
		Clr = 1'b0;

	end
      
endmodule

