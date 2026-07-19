`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2026 03:16:53 AM
// Design Name: 
// Module Name: counter
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


module counter(
input  clk, rset_n, 
output reg [3:0]count
    );
        reg  [3:0] next_state;

 always@(posedge clk) begin
  if (!rset_n) count <= 4'b0000;
   else count <= next_state;
       
    end
    // state transition
    always@(*) begin
            case (count)
            4'b0000 : next_state = 4'b0001; 
            4'b0001 : next_state = 4'b0010; 
            4'b0010 : next_state = 4'b0011; 
            4'b0011 : next_state = 4'b0100; 
            4'b0100 : next_state = 4'b0101; 
            4'b0101 : next_state = 4'b0110; 
            4'b0110 : next_state = 4'b0111; 
            4'b0111 : next_state = 4'b1000; 
            4'b1000 : next_state = 4'b1001; 
            4'b1001 : next_state = 4'b0000;
            default : next_state = 4'b0000;
        endcase
    end
endmodule