`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:18:16 02/10/2016 
// Design Name: 
// Module Name:    Dec7Seg 
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
module Dec7Seg(
    input [3:0] InR,
    output [7:0] Seg
    );

assign Seg  = ~(  InR == 4'h0 ? 8'b11111100
				        : InR == 4'h1 ? 8'b01100000
				        : InR == 4'h2 ? 8'b11011010
				        : InR == 4'h3 ? 8'b11110010
				        : InR == 4'h4 ? 8'b01100110
				        : InR == 4'h5 ? 8'b10110110
				        : InR == 4'h6 ? 8'b10111110
				        : InR == 4'h7 ? 8'b11100000
				        : InR == 4'h8 ? 8'b11111110
				        : InR == 4'h9 ? 8'b11110110
				        : 8'b00000001 );

endmodule
