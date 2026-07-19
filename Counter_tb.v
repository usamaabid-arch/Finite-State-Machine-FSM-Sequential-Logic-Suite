`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2026 03:17:36 AM
// Design Name: 
// Module Name: Counter_tb
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


module Counter_tb( );

reg  clk, rset_n; 
wire [3:0] count;
 counter dut(
  clk, rset_n, count
   );

 initial begin
    clk=0;
    forever #5 clk=~clk;
    end
    
     initial begin
           rset_n = 0;
        #12;
        rset_n = 1;
         #200;
        $finish;
    end
        


endmodule
