`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:17 01/27/2016 
// Design Name: 
// Module Name:    Mustang 
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
module Mustang(Left, Right, Hazard, Clk, L, R);
    input Left;
    input Right;
    input Hazard;
    input Clk;
    output [2:0] L;
    output [0:2] R;
	 
	 //REG OUTPUTS
	 reg [2:0] L;
	 reg [0:2] R;
	 
	 //Define the States for the FSM
	 localparam Left0 = 		3'b001,
					Left1 = 		3'b011,
					Left2 = 		3'b111,
					ON =			3'b111,
					OFF = 		3'b000,
					Right0 = 	3'b100,
					Right1 = 	3'b110,
					Right2 = 	3'b111;
					

					
	//State Reg Declarations
	//L
	reg [2:0] pres_state;
	reg [2:0] next_state;

	
						
	//Section which describe the "Current State Register" of the FSM
	//Statereg
	
	always @(posedge Clock)
	begin
		if(Reset)
			begin
			pres_state = OFF;
			end
		else
			begin
			pres_state = next_state;
			end
		
	end
	
	 //Section which describe the "Next State Logic" of the FSM
	//fsm
		assign LRH = {Left, Right, Hazard};
	always @(*)
	begin
		//Assume that states will not change
		next_state = pres_state;

		case (pres_state)
			ON:
				case (LRH)
					ON = OFF;		
				endcase
			OFF:
				case(LRH)
					3'b000 : next_state = OFF;
					3'b110 : next_state = OFF;
					3'b100 : next_state = Left0;
					3'b010 : next_state = Right0;
				endcase
			ST2:
				if (Data_In[1] ==  1'b0)
					next_state = ST1;
				else
					next_state = ST3;
			ST3:
				case (Data_In)
					2'b01 | 2'b11 : next_state= ST4;
					default : next_state = ST3;
				endcase
			ST4:
				if (Data_In == 2'b11)
					next_state = ST4;
				else
					next_state = ST0;
			ST5_na | ST6_na | ST7_na:
				next_state = ST0;
		endcase
		
	end

	 //Section which describe the "Output Logic" of the FSM
	//outputs
	always @(pres_state)
	begin
		case (pres_state)
			ST0: Data_Out = 1'b1;
			ST1: Data_Out = 1'b0;
			ST2: Data_Out = 1'b1;
			ST3: Data_Out = 1'b0;
			ST4: Data_Out = 1'b1;
			ST5_na: Data_Out = 1'b0;
			ST6_na: Data_Out = 1'b0;
			ST7_na: Data_Out = 1'b0;
		endcase
	end



endmodule
