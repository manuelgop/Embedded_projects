`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2016 04:34:39 PM
// Design Name: 
// Module Name: Moore_FSM_Template
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_Stoplight(
    //input
    input Reset,
    input Clock,
    // output
    output [2:0] RGB,
    output [4:0] count_led
    );
    
    //registered outputs
    reg [2:0] Data_out_reg;  
    
    //Define States for FSM
    localparam 
        GREEN   = 2'd0,
        YELLOW  = 2'd1, 
        RED     = 2'd2, 
        OFF     = 2'd3;
     
     reg [4:0]counter ; 
    //State register declaration        
    reg [1:0] pres_state;
    reg [1:0] next_state;



//Nexys board freq
    parameter BoardFreq = 100_000_000;
//Number of bits 2^Bits = BoardFreq
    parameter Bits      = 27;
//Embedded Signals
    reg [Bits-1:0] count;
    reg            En1Hz;
//Frecuency division seccion
    assign Disp = 8'b11111110;
    always @(posedge Clock)
    begin
        if (Reset) 
        begin
            count   =   0;
            En1Hz   =   1'b0;
        end
        else
            if(count != BoardFreq-1)
                begin
                  count = count + 1;
                  En1Hz = 1'b0;
                end
            else
                begin
                   count = 0;
                   En1Hz = 1'b1; 
                end
    end





    //Section that describes the "current state register"
    //statereg  
    always @(posedge Clock)
    begin
        if ( Reset )
            begin
            pres_state = OFF;
            end
        else if ( En1Hz )
            begin
            if(pres_state!=next_state)
                begin
                    pres_state = next_state;   
                   counter = 0;
                end
             else 
                counter = counter + 1;
            end  
    end
        
    //Section that describes the "next state register"
    //Bubble diagram implementation
    //fsm  
    always @(*)
    begin
       //Assume that states will not change
       next_state = pres_state;
       case (pres_state)
       
            GREEN:
                if(counter == 30)
                begin
                    next_state = YELLOW;
                   // counter = 0; 
                end
               // else if(En1Hz)
                 //   begin
                 //   next_state = GREEN;
                  //  counter = counter + 1;
                  //  end
    
            YELLOW:
                if(counter == 3)
                    begin
                    next_state = RED;
                    //counter = 0; 
                    end
              //  else if(En1Hz)
                  //  begin
                  //  next_state = YELLOW;
                  //  counter = counter + 1;
                  //  end
            RED:
                if(counter == 20)
                    begin
                    next_state = GREEN;
                    //counter = 0; 
                    end
                //else if(En1Hz)
                  //  begin
                  //  next_state = RED;
                  //  counter = counter + 1;
                  //  end
                    
            OFF: next_state = RED;
    
            default: next_state = RED;
        
       endcase     
    end        

    //Section that describes the "output logic"
    //outputs  
    always @(*)
    begin
       case (pres_state)
            GREEN: Data_out_reg = 3'b010;          
            YELLOW: Data_out_reg = 3'b110;  
            RED: Data_out_reg = 3'b100;  
            OFF: Data_out_reg = 3'b000;  
            default: Data_out_reg = 3'b000;  
           endcase     
    end 
    assign RGB = Data_out_reg;
    assign count_led = counter;

endmodule

