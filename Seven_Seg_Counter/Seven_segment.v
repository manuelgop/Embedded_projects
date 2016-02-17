`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:43 01/23/2016 
// Design Name: 
// Module Name:    Seven_segment 
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
module Seven_segment(Clr, Clk, Seg, an);
	input Clk;
	input Clr;
	output [6:0] Seg;
	output [3:0] an;
	//Registers
	reg [3:0] Qtemp;
	//Constants
	parameter BoardFreq = 100_000_000;//For my Basys2 board, the Clk is 50MHz
	//Number of bits 2^Bits = BoardFreq
	parameter Bits      = 27;//2^27>100000000
	//Constantes del 7 segmentos
	parameter zero = 7'b1000000;
	parameter one = 7'b1111001;
	parameter two = 7'b0100100; 
	parameter three = 7'b0110000;
	parameter four = 7'b0011001;
	parameter five =  7'b0010010;
	parameter six =  7'b0000010;
	parameter seven = 7'b1111000;
	parameter eigth = 7'b0000000; 
	parameter nine =  7'b0010000;
	//Embedded Signal
	reg [Bits-1 : 0 ] count;
	reg 					En1Hz;
	reg [6:0]         Seg;
	
	
	//Freq Division section
	always @(posedge Clk or posedge Clr)
	begin
		if (Clr)
			begin
				count = 0;
				En1Hz = 1'b0;
			end
		else 
			if (count !== BoardFreq - 1)
				begin
				count = count + 1'b1;
				En1Hz = 1'b0;
				end
			else 
				begin
				count = 0;
				En1Hz = 1'b1;
				end
	end
	
		
	//7 Segment counter
	always @(posedge Clk or posedge Clr)
	begin
		if(Clr)
			Qtemp = 4'b0000;
		else if (En1Hz)
				if( Qtemp == 4'b1001)
					Qtemp = 4'b0000;
				else
					Qtemp = Qtemp + 1'b1;
	end
		assign an = 4'b1011;
		//assign Q = Qtemp;
		
	///7 segment display
	always@(Qtemp)
	  case (Qtemp)
      4'b0000: begin
                  Seg = zero; //0
               end
      4'b0001: begin
                  Seg = one; //1
               end
      4'b0010: begin
                  Seg  = two; //2
               end
      4'b0011: begin
                  Seg = three; //3
               end
      4'b0100: begin
                  Seg = four; //4
               end
      4'b0101: begin
                  Seg = five; //5
               end
      4'b0110: begin
                  Seg = six; //6
               end
      4'b0111: begin
                  Seg = seven; //7
               end
      4'b1000: begin
                  Seg = eigth; //8
               end
      4'b1001: begin
                  Seg = nine; //9
               end
      default: begin
                  Seg = zero; //0
               end
   endcase
	
		

	


endmodule
