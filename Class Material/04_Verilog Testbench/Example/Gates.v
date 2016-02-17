`timescale 1ns / 1ps
// Gates examples

module Gates(A,B,Y);

//Input Pins
input  A;
input  B;

//Output Pins
output Y;

//Data types
wire A;
wire B;
//wire Y; //For concurrent
reg  Y; //For always

//Code begins here

//Alternative 1
//assign y = a & b; //AND Gate
//assign y = a | b; //OR Gate
//assign y = ~a; //NOT
//assign y = ~(a & b); //NAND Gate
//assign y = ~(a | b); //NOR Gate
//assign y = a ^ b; //XOR Gate
//assign y = ~(a ^ b); //XNOR

//Alternative 2
always @(A or B)
begin
  //y <= a & b;
  //y <= a | b; //OR Gate
  //y <= ~a; //NOT
  //y <= ~(a & b); //NAND Gate
  //y <= ~(a | b); //NOR Gate
  Y <= A ^ B; //XOR Gate
  //y <= ~(a ^ b); //XNOR
end

endmodule

