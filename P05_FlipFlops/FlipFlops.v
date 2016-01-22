`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  ITESM	
// Engineer: Manuel Gopar
// 
// Create Date:    16:24:44 01/20/2016 
// Design Name: 
// Module Name:    FlipFlops 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//					Several implementation of flip flops
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FlipFlops(D, Clk, En, Set, Q);
	//Inputs
	input D;
	input Clk;
	input En;
	input Set;
	//outpus
	output Q;
	//Register Q
	reg Q;
	
/*	//A: Basic D-Type FlipFlip, with rinsing edge
	always @(posedge Clk)
	begin
		Q = D;
	end*/
	
/*	
	//B: Basic D-Type FlipFlip, with Falling edge
	always @(negedge Clk)
	begin
		Q = D;
	end
	*/
/*	
	//C: D-Type FlipFlip, with rising edge
	//	And asynchronous Reset on logic 1
	always @(posedge Clk or posedge Clr)
	begin
		//if(Clr == 1'b1)
			if(Clr)
				Q = 1'b0;
			else	
				Q = D;
	end
	*/
/*	
		//D: D-Type FlipFlip, with rising edge
		//	And asynchronous Reset on logic 0
	always @(posedge Clk or negedge Clr)
	begin
		//if(Clr == 1'b0)
			if(!Clr)
				Q = 1'b0;
			else	
				Q = D;
	end
	*/
/*			//D: D-Type FlipFlip, with rising edge
		//	And Synchronous Reset on logic 1
		//IF something depends on the clock you dont have to put in the sensitivity list
	always @(posedge Clk)
	begin
		//if(Clr == 1'b0)
			if(Rst)
				Q = 1'b0;
			else	
				Q = D;
	end
	*/
/*		//E: D-Type FlipFlip, with rising edge
		//	And Synchronous Reset on logic 0
		//IF something depends on the clock you dont have to put in the sensitivity list
	always @(posedge Clk)
	begin
		//if(Clr == 1'b0)
			if(!Rst)
				Q = 1'b0;
			else	
				Q = D;
	end*/
	
	/*		//G: D-Type FlipFlip, with rising edge
		//	And Asynchronous Reset on logic 1
		//With Clk enable
		//IF something depends on the clock you dont have to put in the sensitivity list
	always @(posedge Clk or posedge Clr)
	begin
		//if(Clr == 1'b0)
			if(Clr)
				Q = 1'b0;
			else if (En)	
				Q = D;
	end*/
	
/*			//H: D-Type FlipFlip, with rising edge
		//	And Asynchronous Reset on logic 0
		//With Clk enable with a neg
		//IF something depends on the clock you dont have to put in the sensitivity list
	always @(negedge Clk or negedge Clr)
	begin
		//if(Clr == 1'b0)
			if(!Clr)
				Q = 1'b0;
			else if (!En)	
				Q = D;
	end
*/

			//H: D-Type FlipFlip, with rising edge
		//	And Asynchronous Reset on logic 0
		//With Clk enable with a neg
		//IF something depends on the clock you dont have to put in the sensitivity list
	always @(posedge Clk)
	begin
		//if(Clr == 1'b0)
			if(Set)
				Q = 1'b1;
			else if (En)	
				Q = D;
	end

endmodule
