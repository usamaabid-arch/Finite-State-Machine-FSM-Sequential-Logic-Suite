`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2026 08:39:44 PM
// Design Name: 
// Module Name: task3_tb
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


module task3_tb();
reg clk, rset, in_stream;
wire Z;


task3 DUT(
 .clk(clk), .rset(rset), .B(in_stream),
 .Z(Z)
    );
 //clk
    initial begin
    clk=0;
    forever #5 clk=~clk;
    end
    
    initial begin
        // Initialize
        rset = 0;
        in_stream = 0;
    
        // Hold reset for two clock cycles
        #12;
        rset = 1;
    
        // Wait for a negative edge
        @(negedge clk);
    
    in_stream = 1;
     @(negedge clk);
     in_stream = 0;
      @(negedge clk);
        // First sequence : 111
       
        in_stream = 1;
        @(negedge clk);
    
        in_stream = 1;
        @(negedge clk);
        
        in_stream = 1;
        @(negedge clk);
    
        in_stream = 1;  // seq_detect should become 1 at next posedge
        @(negedge clk);
    
        in_stream = 0;
        @(negedge clk);   
    
    
        in_stream = 0;
        @(negedge clk);
    
     
       
        in_stream = 1;
        @(negedge clk);
       // Second sequence : 111
        in_stream = 0;
        @(negedge clk);
    
        in_stream = 0;
        @(negedge clk);
    
        in_stream = 0;
        @(negedge clk);   // seq_detect should become 1 again
    
    
        // Finish
    
        in_stream = 1;
        #20;
        $finish;
    end
    
    endmodule