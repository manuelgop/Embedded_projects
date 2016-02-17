`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:29 02/10/2016 
// Design Name: 
// Module Name:    ClkDiv 
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
module ClkDiv(
    input Clkin,
    input Rst,
    output Clkout
    );

	//Parameterized desired output frequency
	parameter DesiredFreq = 1; //this will be overwritten by the number I declared previously
	//Board Frequency
	parameter BoardFreq = 100_000_000;
	// Number of bits 2^Bits = BoardFreq
	parameter Bits   = 27;	 
	 parameter MaxCount = BoardFreq / DesiredFreq;
	 //Embedded Signals
	 reg [Bits-1 : 0] count;
	 reg					En1Hz;
	 
	 // Frequency division section
	 always @(posedge Clkin)
	 begin
		if (Rst)
			begin
			count = 0;
			En1Hz = 1'b0;
			end
		else
			if(count !== MaxCount -1) begin
				count = count + 1'b1;
				En1Hz = 1'b0;
			end
			else begin
				count = 0;
				En1Hz = 1'b1;
			end
	 end
	 
	 assign Clkout = En1Hz;

endmodule
