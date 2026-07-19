`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2026 05:19:46 PM
// Design Name: 
// Module Name: task2_tb
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


module task2_tb();
reg clk, rset,in_steam;
wire Z;


//dut
task2 dut(
 clk, rset,in_steam,
 Z
    );
//clk
initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
    // Initialize
    rset = 0;
    in_steam = 0;

    // Hold reset for two clock cycles
    #12;
    rset = 1;

    // Wait for a negative edge
    @(negedge clk);


    // First sequence : 1011
   
    in_steam = 1;
    @(negedge clk);

    in_steam = 0;
    @(negedge clk);

    in_steam = 1;
    @(negedge clk);

    in_steam = 1;
    @(negedge clk);   // seq_detect should become 1 at next posedge


    in_steam = 0;
    @(negedge clk);

    // Second sequence : 1011
   
    in_steam = 1;
    @(negedge clk);

    in_steam = 0;
    @(negedge clk);

    in_steam = 1;
    @(negedge clk);

    in_steam = 1;
    @(negedge clk);   // seq_detect should become 1 again


    // Finish

    in_steam = 0;
    #20;
    $finish;
end

endmodule
