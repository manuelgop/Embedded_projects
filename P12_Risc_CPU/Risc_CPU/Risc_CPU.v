`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:08 02/10/2016 
// Design Name: 
// Module Name:    Risc_CPU 
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
module Risc_CPU(
    input Clk100_Mhz,
    input Clr,
    input [7:0] Switches,
    output [1:0] Turnoff,
    output Anodo_msd,
    output [7:0] Seg,
    output  Anodo_lsd,
    output [7:0] LEDs
    );
	 
	 //Embedded signals
	 //8-bit
	 wire [7:0] PC;
	 wire [7:0] imm;
	 wire [7:0] BrJiJrM;
	 wire [7:0] IncremM;
	 wire [7:0] DataM;
	 wire [7:0] AdderS;
	 wire [7:0] rsd;
	 wire [7:0] rtd;
	 wire [7:0] ALUOper;
	 wire [7:0] D;
	 //Embedded signals
	 //4-bit
	 wire [3:0] opcode;
	 wire [3:0] R;
	 //Embedded signals
	 //3-bit
	 wire [3:0] rs;
	 wire [3:0] rd;
	 wire [3:0] rt;
	 wire [3:0] AlUOp;
	 //2-bits
	 wire [1:0] RegSrc;
	 wire [1:0] JrJr;
	 //1-bit
	 wire ClkEn;
	 wire RshClkEn;
	 wire BrEqM;
	 wire Beq;
	 wire PCInc;
	 wire RegWrite;
	 wire ALUZero;
	 wire Write7Seg;
	 wire WriteLEDs;
	 //Instantiate TOP-LEVEL for the RISC-CPU
	 //Module 1: Program Counter
	 ProgCounter C01 (
			.PCIn (BrJiJrM),
			.Clk  (Clk100Mhz),
			.Cen  (ClkEn),
			.Rst  (Clr),
			.PCOut(PC)
		);

		
	 //Module 02: Mem
	 Mem C02 (
		.Addr(PC),
		.DataOp(opcode),
		.Datars(rs),
		.Datart(rt),
		.Datard(rd),
		.Datai(imm)
		);
		
	//Module 03: CtrlUnit
	CtrlUnit C03(
		.Oper(opcode),
		.RegSrc_Op(RegSrc),
		.ALUOp_Op(ALUOp),
		.RegWrite_Op(RegWrite),
		.Write7Seg_Op(Write7Seg),
		.WriteLEDs_Op(WriteLEDs),
		.PCInc_Op(PCInc),
		.Beq_Op(Beq),
		.JiJr_Op(JiJr)
		);
		
		//Mocule 04: Registers
		Registers C04(
			.SelA(rs),
			.SelB(rt),
			.SelWR(rd),
			.Data(DataM),
			.Clk(Clk100Mhz),
			.Cen(ClkEn),
			.Rst(Clr),
			.WE(RegWrite),
			.OutA(rsd),
			.OutB(rtd)
			);
			//Mocule 05: ALU
			ALU C05(
			.InA(rsd),
			.InB(rtd),
			.Sel(ALUOp),
			.Zero(ALUZero),
			.Oper(ALUOper)
			);
			//Module 06: FullAdder
			FullAdder C06(
				.InA(PC),
				.InB(IncremM),
				.S(AdderS)
				);
				
			//Module C07: Increm
			Increm C07(
			
				.InA(8'b00000001),
				.InB(imm),
				.Sel(BrEqM),
				.M(IncremM)
				
				);
				
			//Mocule C08: BrEq
			BrEq CO8 (
				.M(BrEqM),
				.Sel(Beq),
				.InA(PCInc),
				.InB(ALUZero)
				);
			//Module C09: Mux4to1
			Mux4to1 C09(
				.InA(imm),
				.InB(PC),
				.InC(ALUOper),
				.InD(Switches),
				.Sel(RegSrc),
				.M(DataM)
				);
				//Mocule C10: Mux4to1
			Mux4to1 C10(
			.InA(AdderS),
			.InB(rsd),
			.InC(imm),
			.InD(8'b00000000),
			.Sel(JiJr),
			.M(BrJiJrM)
			);
			//Module C11: Reg8
			Reg8 C11(
				.Inrs(rsd),
				.En(Write7Seg),
				.Clk(Clk100Mhz),
				.Cen(ClkEn),
				.Rst(Clr),
				.OutD(D)
				);
			//Module C12: Reg8
			Reg8 C12(
				.Inrs(rsd),
				.En(WriteLEDs),
				.Clk(Clk100Mhz),
				.Cen(ClkEn),
				.Rst(Clr),
				.OutD(LEDs)
				);
			//Module C13: Refresh
			Refresh C13(
				.InD(D),
				.Clk(Clk100Mhz),
				.Cen(RshClkEn),
				.An_msd(Anodo_msd),
				.OutR(R),
				.An_lsd(Anodo_lsd)
				);
			//Module C14: Dec7Seg
			Dec7Seg C14 (
				.InR(R),
				.Seg(Seg)
				);
			//Module C15: ClkDiv
			ClkDiv #(.DesireFreq(10)) C15(
				.Clkin(Clk100Mhz),
				.Rst(Clr),
				.Clkout(ClkEn)
				);
				
			//Module C16: CLKDIV
			ClkDiv #(.DesireFreq(200)) C16(
				.Clkin(Clk100Mhz),
				.Rst(Clr),
				.Clkout(RshClkEn)
				);
			//Module C17: DispOff
			DispOff C17 (
				.TurnOff(TurnOff)
				);
				
	 
	 
	 
endmodule
	 

	 
	 
	 
	 

	 



