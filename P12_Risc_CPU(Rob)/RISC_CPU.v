`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITESM-CQ
// Engineer: Alan Usiel
// 
// Create Date:    16:34:42 02/10/2016 
// Design Name: 
// Module Name:    RISC_CPU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Implementation of an embedded RISC-CPU seen in class
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RISC_CPU(
    input 		  Clk100MHz,
    input 		  Clr,
    input  [7:0] Switches,
    output [1:0] Turnoff,
    output 		  Anodo_msd,
    output [7:0] Seg,
    output 		  Anodo_lsd,
    output [7:0] LEDs
	 );

	 // Embedded Signals
	 //8-bits
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
	 
	 //4-bits
	 wire [3:0] opcode;
	 wire [3:0] R;
	 
	 //3-bits
	 wire [2:0] rs;
	 wire [2:0] rd;
	 wire [2:0] rt;
	 wire [2:0] ALUOp;
	 
	 //2-bits
	 wire [1:0] RegSrc;
	 wire [1:0] JiJr;
	 
	 //1-bit
	 wire  		ClkEn;
	 wire  		RshClkEn;
	 wire  		BrEqM;
	 wire  		Beq;
	 wire  		PCInc;
	 wire  		RegWrite;
	 wire  		ALUZero;
	 wire  		Write7Seg;
	 wire  		WriteLEDs;
 	 
	 //Instantiate TOP-Level for the RISC-CPU (Alambrar)
	 
	 //Module 1: Program Counter
	 ProgCounter C01 
	 (
		.PCIn (BrJiJrM), //Nombre de Entrada y a que va conectado
		.Clk  (Clk100MHz),
		.Cen  (ClkEn),
		.Rst  (Clr),
		.PCOut(PC)
	 );
	 
	 //Module 2: Memory
	 Mem C02
	 (
		.Addr   (PC),
		.DataOp (opcode),
		.Datars (rs),
		.Datart (rt),
		.Datard (rd),
		.Datai (imm)
	 );
	 
	 //Module 3: Control Unit
	 CtrlUnit C03
	 (
		.Oper         (opcode),
		.RegSrc_Op    (RegSrc),
		.ALUOp_Op     (ALUOp),
		.RegWrite_Op  (RegWrite),
		.Write7Seg_Op (Write7Seg),
		.WriteLEDs_Op (WriteLEDs),
		.PCInc_Op     (PCInc),
		.Beq_Op       (Beq),
		.JiJr_Op      (JiJr)
	 );	
	 
	 //Module 4: Registers
	 Registers C04
	 (
		.SelA  (rs),
		.SelB  (rt),
		.SelWR (rd),
		.Data  (DataM),
		.Clk   (Clk100MHz),
		.Cen   (ClkEn),
		.Rst   (Clr),
		.WE    (RegWrite),
		.OutA  (rsd),
		.OutB  (rtd)
	 );		
	
	//Module 5: ALU
	 ALU C05
	 (
		.InA  (rsd),
		.InB  (rtd),
		.Sel  (ALUOp),
		.Zero (ALUZero),
		.Oper  (ALUOper)
	 );			

	//Module 6: Full Adder
	 FullAdder C06
	 (
		.InA  (PC),
		.InB  (IncremM),
		.S (AdderS)
	 );				

	//Module 7: Increment
	 Increm C07
	 (
		.InA  (8'b00000001),
		.InB  (imm),
		.Sel  (BrEqM),
		.M    (IncremM)
	 );				 
	 
	 //Module 8: Branch Equal
	 BrEq C08
	 (
		.M   (BrEqM),
		.Sel (Beq),
		.InA (PCInc),
		.InB (ALUZero)
	 );		
	
	 //Module 9: Multiplexor 4 to 1
	 Mux4to1 C09
	 (
		.InA (imm),
		.InB (PC),
		.InC (ALUOper),
		.InD (Switches),
		.Sel (RegSrc),
		.M   (DataM)
	 );			
	 
	 //Module 10: Multiplexor 4 to 1
	 Mux4to1 C10	 
	 (
		.InA (AdderS),
		.InB (rsd),
		.InC (imm),
		.InD (8'b00000000),
		.Sel (JiJr),
		.M(BrJiJrM)
	 );		
	 
	 //Module 11: 8-bit Register
	 Reg8 C11	 
	 (
		.Inrs (rsd),
		.En   (Write7Seg),
		.Clk  (Clk100MHz),
		.Cen  (ClkEn),
		.Rst  (Clr),
		.OutD (D)
	 );		

	 //Module 12: 8-bit Register
	 Reg8	 C12	 
	 (
		.Inrs (rsd),
		.En   (WriteLEDs),
		.Clk  (Clk100MHz),
		.Cen  (ClkEn),
		.Rst  (Clr),
		.OutD (LEDs)		
	 );			 
	 
	 //Module 13: Refresh
	 Refresh	 C13
	 (
		.InD    (D),
		.Clk    (Clk100MHz),
		.Cen    (RshClkEn),
		.An_msd (Anodo_msd),
		.OutR   (R),
		.An_lsd  (Anodo_lsd)		
	 );			 
	 
	//Module 14: 7segments Decoder
	 Dec7Seg	 C14
	 (
		.InR (R),
		.Seg(Seg)		
	 );			
	
	 //Module 15: Clock Divider
	 ClkDiv	 #(.DesiredFreq(10))	C15	 
	 (
		.Clkin  (Clk100MHz),
		.Rst    (Clr),
		.Clkout (ClkEn)	
	 );			
	 
	 //Module 16: Clock Divider
	 ClkDiv	 #(.DesiredFreq(200)) C16	  //Same module different frequency
	 (
		.Clkin  (Clk100MHz),
		.Rst    (Clr),
		.Clkout (RshClkEn)	
	 );			
	 
	 //Module 17: Display Off
	 DispOff	 C17	 
	 (
		.Turnoff (Turnoff)	
	 );	

	 
endmodule
