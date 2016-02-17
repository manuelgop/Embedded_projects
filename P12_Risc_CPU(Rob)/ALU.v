`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:25 02/10/2016 
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
	
	reg [7:0] Compute;
	reg 		 Flag;
	
	//INA rsd
	//INB rtd
	always@(*)
	begin
		case(Sel)
		3'b000:
			Compute = InA + InB;     //Adittion
		3'b001:
			Compute = InA - InB;     //Substraction
		3'b010:
			Compute = InA & InB;     //AND
		3'b011:
			Compute = InA | InB;     //OR
		3'b100:
			Compute = InA ^ InB;     //XOR
		3'b101:
			Compute = InA;			 	 //NOT rs
		3'b110:
			Compute = InA << 1'b0;	 //Shift Left
		3'b111:
			Compute = 1'b0 >> InA;	 //Shift Right
		endcase								 
				if (Compute == 8'b00000000 )
						Flag = 1'b1;
				else 
						Flag = 1'b0; 
		end 
	
	assign Oper = Compute; 
	assign Zero = Flag;
	
endmodule
