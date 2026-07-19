`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2026 08:38:57 PM
// Design Name: 
// Module Name: task3
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

module task3(
input wire clk, rset, B,
output reg Z
    );
    reg [2:0] state, next_state;
    reg x;
    //  	State register
    always@(posedge clk or negedge rset) begin
            if (!rset) state <= 3'b000;
        else state <= next_state;
    end
    // state transition
    always@(*) begin
next_state =3'b000;
        case (state)
            3'b000 :begin
                        if (B) next_state = 3'b001;
                        else   next_state = 3'b100;
                    end
           3'b001 : begin
                if (B) next_state = 3'b010;
                else   next_state = 3'b100;   
            end

            3'b010 : begin
                if (B) next_state = 3'b011;
                else   next_state = 3'b100;   
            end

            3'b011 : begin
                if (B) next_state = 3'b011; 
                else   next_state = 3'b100;   
            end

            3'b100: begin
                if (!B) next_state = 3'b101;
                else    next_state = 3'b001; 
            end

           3'b101: begin
                if (!B) next_state = 3'b110;
                else    next_state = 3'b001;
            end

            3'b110: begin
                if (!B) next_state = 3'b110; 
                else    next_state = 3'b001;   
            end

            default: next_state = 3'b000;
        endcase
    end
//    //output logic
     always@(state) begin
       if (state == 3'b110 || state == 3'b011) Z = 1'b1;
        else Z = 1'b0;
        end 
    
endmodule  