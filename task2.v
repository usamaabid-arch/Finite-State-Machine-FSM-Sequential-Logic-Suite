`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2026 05:03:07 PM
// Design Name: 
// Module Name: task2
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


module task2(
input clk, rset,in_steam,
output reg Z
    );
    reg [2:0] state, next_state;
    //  	State register
    always@(posedge clk or negedge rset) begin
    if (!rset)
    state<=0;
    else  
    state<=next_state;
    end
    // state transition
    always@(*) begin
    next_state = state;
    Z = 1'b0;
    case (state)
     3'b000 : begin 
    // seq_detect=1'b0;
     if(in_steam) next_state=3'b001;
     else next_state=3'b000;
     end
    
    3'b001 :  begin
      // seq_detect=1'b0; 
    if(!in_steam) next_state=3'b010;
    else next_state=3'b001;       
         end
    
    3'b010 : begin
     //   seq_detect=1'b0;
 if(in_steam) next_state=3'b011;
 else next_state=3'b00;               
         end

    3'b011 :   begin
    
        if(in_steam) next_state=3'b100;
        else next_state=3'b000;
     end
     
     3'b100: begin
         next_state=3'b000;
         Z = 1'b1;
          end
     
     
     
    endcase
    end  
endmodule
