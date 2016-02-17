`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:34 02/10/2016 
// Design Name: 
// Module Name:    Refresh 
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
module Refresh(
    input  [7:0]  InD,
    input         Clk,
    input         Cen,
    output        An_msd,
    output [3:0]  OutR,
    output 		   An_lsd
    );

	reg 		 An_msd=1'b0;
	reg 		 An_lsd=1'b1;	
	reg [3:0] OutR;
	
	always@(posedge Clk)
	begin 
		if(Cen) begin
			if (An_msd == 1'b0) begin
				 An_msd = 1'b1;
				 An_lsd = 1'b0;
				 OutR = InD[3 : 0];
			 end							
			else begin
				An_lsd = 1'b1;
				An_msd = 1'b0;
				OutR = InD[7 : 4];
			end
		end
	 end 

endmodule
