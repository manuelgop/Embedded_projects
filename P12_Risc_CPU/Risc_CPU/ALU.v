`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:15 02/10/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [7:0] InA,
    input [7:0] InB,
    input [2:0] Sel,
    output Zero,
    output [7:0] Oper
    );
	 
	 reg [7:0] Oper;
	 reg Zero;
	 
always @(*)
begin
	 case (Sel)
      3'b000 : begin
                  Oper = InA + InB; 
               end
      3'b001 : begin
                  Oper = InA - InB;
               end
      3'b010 : begin
                  Oper = InA & InB;
               end
      3'b011 : begin
                  Oper = InA | InB;
               end
      3'b100 : begin
                  Oper = InA ^ InB;
               end
      3'b101 : begin
                  Oper = ~InA;
               end
      3'b110 : begin
                  Oper = InA << 1'b0;
               end
      3'b111 : begin
                  Oper = InA >> 1'b0;
						end
						
   endcase
		if(Oper == 8'b00000000)
			Zero = 1'b1;
			else
			Zero =1'b0;

end
endmodule
