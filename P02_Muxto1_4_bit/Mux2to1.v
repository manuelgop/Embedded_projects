`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:39 01/15/2016 
// Design Name: 
// Module Name:    Mux2to1 
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
//NEW STYLE
//module Mux2to1(
//    input [3:0] A,
//    input [3:0] B,
//    output [3:0] Y,
//    input Sel
//    );
////////
///TRADICIONAL STYLE
/////////
module Mux4to1(A, B, C, D, Sel, Y);
	//inputs
	input [3:0] A;
	input [3:0] B;
	input [3:0] C;
	input [3:0] D;
	input [1:0] Sel;
	//Outputs	 
	output [3:0] Y;
	//Register the outputs
	reg [3:0] Y;
	//Constant declaration
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	parameter S3 = 2'b11;


/*	//Sequential implementation v1
	always @(Sel or A or B or C or D)
	begin
				  if (Sel == 2'b00) begin
						Y = A;
			end
			else if (Sel == 2'b01) begin
						Y = B;
			end
			else if (Sel == 2'b10) begin
						Y = C;
			end
			else begin
						Y=D;
			end
				
	end*/
		//Sequential implementation v2
	/*always @(Sel or A or B or C or D)
	begin
				  if (Sel == 2'b00)
						Y = A;
			else if (Sel == 2'b01) 
						Y = B;
			else if (Sel == 2'b10) 
						Y = C;
			else 
						Y=D;			
	end*/
			/*//Sequential implementation v3 with CASE
	always @(Sel or A or B or C or D)
	begin
				 
   case (Sel)
      2'b00  : begin
                 Y=A;
               end
      2'b01  : begin
                  Y=B;
               end
      2'b10  : begin
                  Y=C;
               end
      2'b11  : begin
                  Y=D;
               end
      default: begin
                  Y=A;
               end
   endcase
	end*/
	
	//Sequential implementation v4 with CASE
	always @(Sel or A or B or C or D)
	begin
				 
   case (Sel)
      S0  : Y=A;         
      S1  : Y=B;
      S2  : Y=C;
      S3  : Y=D;        
     /* default: Y = A;*/
		endcase
	end
endmodule
