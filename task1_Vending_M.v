`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2026 01:59:06 PM
// Design Name: 
// Module Name: task1
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


module task1(
input clk, rset,co5,co10,
output reg can_dispense
    );
    reg [1:0] state, next_state;
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
    case (state)
     2'b00 : begin
     can_dispense=1'b0;
     if(co10) next_state=2'b10;
     else if(co5) next_state=2'b01;
     else next_state=2'b00;
     end
    
    2'b01 :  begin
       can_dispense=1'b0;
    if(co10) next_state=2'b11;
    else if(co5) next_state=2'b10;
    else next_state=2'b01;      
         
         end
    
    2'b10 : begin
        can_dispense=1'b0;
 if(co5 | co10) next_state=2'b11;
 else next_state=2'b10;               
         end

    2'b11 :   begin
    can_dispense=1'b1;
        if(co10) next_state=2'b10;
        else if(co5) next_state=2'b01;
        else next_state=2'b00;
     end
    endcase
    end  
endmodule
