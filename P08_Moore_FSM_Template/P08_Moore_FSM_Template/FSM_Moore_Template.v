`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:42 01/27/2016 
// Design Name: 
// Module Name:    FSM_Moore_Template 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Moore FSM template. This description can 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM_Moore_Template(Clock, Reset, Data_In, Data_Out);
    //Inputs
	 input 			Clock;
	 input 			Reset;
	 input 	[1:0] Data_In;
	 //Outputs
	 output  		Data_Out;
	 //Register Outputs
	 reg				Data_Out;
	 
	 //Define the States for the FSM
	 localparam ST0 = 		3'd0,
					ST1 = 		3'd1,
					ST2 = 		3'd2,
					ST3 =			3'd3,
					ST4 = 		3'd4,
					ST5_na = 	3'd5,
					ST6_na = 	3'd6,
					ST7_na = 	3'd7;
					
	//State Reg Declarations
	reg [2:0] pres_state;
	reg [2:0] next_state;
					
	//Section which describe the "Current State Register" of the FSM
	//Statereg
	always @(posedge Clock)
	begin
		if(Reset)
			pres_state = ST0;
		else
			pres_state = next_state;
		
	end
	 
	 //Section which describe the "Next State Logic" of the FSM
	//fsm
	always @(*)
	begin
		//Assume that states will not change
		next_state = pres_state;
		case (pres_state)
			ST0:
				case (Data_In)
					2'b00 : next_state = ST0;
					2'b01 : next_state = ST4;
					2'b10 : next_state = ST1;
					2'b11 : next_state = ST2;
				endcase
			ST1:
				case(Data_In)
					2'b00 : next_state = ST0;
					2'b10 : next_state = ST2;
					default : next_state = ST1;
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
