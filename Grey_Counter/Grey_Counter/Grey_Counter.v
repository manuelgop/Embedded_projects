

module Counters_grey(Clr, Clk, Q);
//Clr for Async 
//Rst for Sync
	input Clr;
	input Clk;
	output [3:0] Q;
	//Register
	//reg [3:0] Q;
	reg [3:0] Qtemp;
	reg q0, q1, q2; 
 
	//Constants
	parameter BoardFreq = 100_000_000;//For my Basys2 board, the Clk is 50MHz
	//Number of bits 2^Bits = BoardFreq
	parameter Bits      = 27;//2^27>100000000
	//Embedded Signal
	reg [Bits-1 : 0 ] count;
	reg 					En1Hz;
	
	
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
	
	/*
	//4-Bit binary Assending binary counter
	always @(posedge Clk or posedge Clr)
	begin
		if(Clr)
			Qtemp = 4'b0000;
		else if (En1Hz)
			Qtemp = Qtemp + 1'b1;
	end
	
		assign Q = Qtemp;
*/	


 //4 bit Gray counter
    wire [3:0] Qgray;
   always @(posedge Clk or posedge Clr)
   begin
       if(Clr)
           Qtemp = 4'b0000;
       else if (En1Hz)
           Qtemp = Qtemp + 1'b1;     
   end
   assign Qgray[3] = Qtemp[3];
   assign Qgray[2] = Qtemp[3] ^ Qtemp[2];
   assign Qgray[1] = Qtemp[2] ^ Qtemp[1];
   assign Qgray[0] = Qtemp[1] ^ Qtemp[0];

   assign Q = Qgray; 




endmodule


