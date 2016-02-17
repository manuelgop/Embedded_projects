`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:25 09/12/2013 
// Design Name: 
// Module Name:    Counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    4-Bit binary counter for DigilentInc Nexys-3 board
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Counter(ClkIn,Rst,Seg,Anode);

// Pin definition
    // Input pins
    input        ClkIn;
    input        Rst;
	 
	 // Output pins
    output [6:0] Seg;
    output [3:0] Anode;
	 
	 reg    [6:0] Seg;
	 
	 // Embedded signals used by Frequency divider section
	 parameter Divisor = 100000000; // Board oscillator frequency
    parameter Bits    = 27;        // 27 bits needed for a 100MHz Clock
    reg [Bits - 1 : 0] counter;    // Clk counter
	 reg clk_en;                    // Clk enable 
	 
	 // Embedded signals used by Counter section
	 reg   [3:0]  CountTemp;

// Frequency divider section
  always @(posedge ClkIn or posedge Rst)
  begin
    if (Rst) begin
	   counter <= 0;
		clk_en  <= 1'b0;
	 end
	 else
	   if (counter !== Divisor - 1) begin
		  counter <= counter + 1;
		  clk_en  <= 1'b0;
		end
		else begin
		  counter <= 0;
		  clk_en  <= 1'b1;
		end
  end


// Binary counter section
	always @(posedge ClkIn or posedge Rst)
	begin
	  if (Rst == 1'b1)
	    CountTemp <= 4'b0000;
	  else if (clk_en)
       CountTemp <= CountTemp + 1;
	  else
	    CountTemp <= CountTemp;
   end
			
// Binary to 7-Segment decoder section
  always@(CountTemp)
  begin
    case (CountTemp)
      4'b0000: begin Seg <= 7'b0000001; end
		4'b0001: begin Seg <= 7'b1001111; end
		4'b0010: begin Seg <= 7'b0010010; end
		4'b0011: begin Seg <= 7'b0000110; end
		4'b0100: begin Seg <= 7'b1001100; end
		4'b0101: begin Seg <= 7'b0100100; end
		4'b0110: begin Seg <= 7'b0100000; end
		4'b0111: begin Seg <= 7'b0001111; end
		4'b1000: begin Seg <= 7'b0000000; end
		4'b1001: begin Seg <= 7'b0000100; end
		4'b1010: begin Seg <= 7'b0001000; end
		4'b1011: begin Seg <= 7'b1100000; end
		4'b1100: begin Seg <= 7'b0110001; end
		4'b1101: begin Seg <= 7'b1000010; end
		4'b1110: begin Seg <= 7'b0110000; end
		4'b1111: begin Seg <= 7'b0111000; end
		default: begin Seg <= 7'b1111111; end
    endcase
  end
  
  assign Anode = 4'b1110;

endmodule
