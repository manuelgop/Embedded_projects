`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:08 02/10/2016 
// Design Name: 
// Module Name:    Mem 
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
module Mem(
    input [7:0] Addr,
    output [3:0] DataOp,
    output [2:0] Datars,
    output [2:0] Datart,
    output [2:0] Datard,
    output [7:0] Datai
    );

//Program Memory will be implemented as Asynchronous ROM
	 //Define the embedded DATABUS
	  reg [20:0] DataBus; // 4 wide 

	//Define a ROM for Style 2
	//reg [20:0]  rom [0:255]//Primero el ancho y luego el largo, MATRICES
	//Define the content of the programm Memory
	//Style 2
/*	initial begin
		rom[  0] = {1'b1,20'h00000};
		rom[  0] = {1'b1,20'h000101};
		rom[  0] = {1'b1,20'h000201};
		rom[  0] = {1'b1,20'h00};
		rom[  0] = {1'b1,20'h00000};
	end*/
	
	
	
	
	
/*	
  always @* begin // @(a)
    case (Addr)
	 //Mem			 Mem 	
	 //Location		 Contents
     8'h00: 		 DataBus = {1'b1,20'h00000};
     8'h01:  		 DataBus = {1'b1,20'h00101};
	  8'h02:  		 DataBus = {1'b1,20'h00201};
	  8'h03:  		 DataBus = {1'b1,20'hC8000};
    default:       DataBus = {1'b0,20'hC0000};
    endcase
  end*/
  
  
  //Add two 4-bit numbers Switch[7:4] + Switch[3:0]
  always @* begin // @(a)
    case (Addr)
	 //Mem			 Mem 	
	 //Location		 Contents
     8'h00: 		 DataBus = {1'b1,20'hE0000};
     8'h01:  		 DataBus = {1'b0,20'h40100};
	  8'h02:  		 DataBus = {1'b0,20'hE4100};
	  8'h03:  		 DataBus = {1'b0,20'hE4100};
	  8'h04:  		 DataBus = {1'b0,20'hE4100};
	  8'h05:  		 DataBus = {1'b0,20'hE4100};
	  8'h06:  		 DataBus = {1'b0,20'h40200};
	  8'h07:  		 DataBus = {1'b1,20'h0030F};
	  8'h08:  		 DataBus = {1'b0,20'h49A00};
	  8'h09:  		 DataBus = {1'b0,20'h05300};
	  8'h0A:  		 DataBus = {1'b1,20'hAC000};
	  8'h0B:  		 DataBus = {1'b1,20'h00000};
	 default:       DataBus = {1'b0,20'h00000};
    endcase
  end
  
  
  
  //Split-up embedded DataBus
  assign DataOp = DataBus [20:17];
  assign Datars = DataBus [16:14];
  assign Datart = DataBus [13:11];
  assign Datard = DataBus [10:8];
  assign Datai = DataBus  [7:0];

endmodule
