`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2026 01:59:38 PM
// Design Name: 
// Module Name: task1_tb
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


module task1_tb( );
reg clk, rset,co5,co10;
wire can_dispense;


//dut
task1 dut(
 clk, rset,co5,co10,
 can_dispense
    );
//clk
initial begin
clk=0;
forever #10 clk=~clk;
end

initial begin
rset=0; co10=0; co5=0; #10;
rset=1;  #10;
co5=1; co10=0; #10;  //5
co5=1; co10=0; #10;      //5
rset=0;  #10;           //rset
rset=1; co5=0; co10=1; #10;    ///  10
co10=0; co5=1; #10;       // 5 == total 15
co5=1; co10=0; #10;     //5
co5=1; co10=0; #10;    // 5
co5=0; co10=1; #30;   // 10  == total 20  'disperse 2 cans '
co10=0; co5=0; #40;
$finish;
end


endmodule
