`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:41 02/10/2016 
// Design Name: 
// Module Name:    CtrlUnit 
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
module CtrlUnit(
    input 	[3:0] Oper,
    output 	[1:0] RegSrc_Op,
    output 	[2:0] ALUOp_Op,
    output 			RegWrite_Op,
    output 			Write7Seg_Op,
    output 			WriteLEDs_Op,
    output 			PCInc_Op,
    output 			Beq_Op,
    output 	[1:0] JiJr_Op
    );

	//Embedded Signals
	 reg 	[1:0] RegSrc_Op;
    reg 	[2:0] ALUOp_Op;
    reg 			RegWrite_Op;
    reg 			Write7Seg_Op;
    reg 			WriteLEDs_Op;
    reg 			PCInc_Op;
    reg 			Beq_Op;
    reg 	[1:0] JiJr_Op;
	 
	
	always@(*)
	begin 
		case(Oper)
		4'h0: //ADD
			begin
			RegSrc_Op    = 2'b10;
			ALUOp_Op     = 3'b000;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
		
		4'h1: //SUBS
			begin 
			RegSrc_Op    = 2'b10;
			ALUOp_Op     = 3'b001;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
			
		4'h2: //AND
			begin
			RegSrc_Op    = 2'b10;
			ALUOp_Op     = 3'b010;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
			
		4'h3: //OR
			begin
			RegSrc_Op    = 2'b10;
			ALUOp_Op     = 3'b011;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
		
		4'h4: //XOR
			begin
			RegSrc_Op    = 2'b10;
			ALUOp_Op     = 3'b100;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end		
		
		4'h5: //NOT
			begin
			RegSrc_Op    = 2'b10;
			ALUOp_Op     = 3'b101;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
			
		4'h6: //Shift Left
			begin
			RegSrc_Op    = 2'b10;
			ALUOp_Op     = 3'b110;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
			
		4'h7: //Shift Right
			begin
			RegSrc_Op    = 2'b10;
			ALUOp_Op     = 3'b111;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end		
			
		4'h8: //Load
			begin
			RegSrc_Op    = 2'b00;
			ALUOp_Op     = 3'bxxx;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
			
		4'h9: //Store contents
			begin
			RegSrc_Op    = 2'b01;
			ALUOp_Op     = 3'bxxx;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
			
		4'hA: //BEQ
			begin
			RegSrc_Op    = 2'bxx;
			//ALUOp_Op     = 3'b010;
			RegWrite_Op  = 1'b0;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'bx;
			Beq_Op		 = 1'b1;
			JiJr_Op		 = 2'b00;
			end
			
		4'hB: //Reset Program Counter i
			begin
			RegSrc_Op    = 2'bxx;
			ALUOp_Op     = 3'bxxx;
			RegWrite_Op  = 1'b0;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'bx;
			Beq_Op		 = 1'bx;
			JiJr_Op		 = 2'b10;
			end
			
		4'hC: //Reset Program Counter to rs
			begin
			RegSrc_Op    = 2'bxx;
			ALUOp_Op     = 3'bxxx;
			RegWrite_Op  = 1'b0;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'bx;
			Beq_Op		 = 1'bx;
			JiJr_Op		 = 2'b01;
			end
			
		4'hD: //Write 7 Segments
			begin
			RegSrc_Op    = 2'bxx;
			ALUOp_Op     = 3'bxxx;
			RegWrite_Op  = 1'b0;
			Write7Seg_Op = 1'b1;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
			
		4'hE: //Write LEDs
			begin
			RegSrc_Op    = 2'bxx;
			ALUOp_Op     = 3'bxxx;
			RegWrite_Op  = 1'b0;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b1;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
			
		4'hF: //Read Switches
			begin
			RegSrc_Op    = 2'b11;
			ALUOp_Op     = 3'bxxx;
			RegWrite_Op  = 1'b1;
			Write7Seg_Op = 1'b0;
			WriteLEDs_Op = 1'b0;
			PCInc_Op     = 1'b0;
			Beq_Op		 = 1'b0;
			JiJr_Op		 = 2'b00;
			end
		endcase
	end
	

endmodule
