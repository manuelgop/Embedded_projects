`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:03 02/10/2016 
// Design Name: 
// Module Name:    DispOff 
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
module DispOff(
    output [1:0] Turnoff
    );

//They light up with 0
//With 1 are turned off
assign Turnoff = 2'b11;

endmodule
