`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2026 10:40:59 PM
// Design Name: 
// Module Name: comparator_fsm_tb
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


module comparator_fsm_tb();
    logic clk, reset, in_stream, seq_detect;
 
    comparator_fsm DUT(.clk(clk), .rst(reset), .data_in(in_stream), .indicator(seq_detect));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
    // Initialize
    reset = 1;
    in_stream = 0;
    
    // Hold reset for two clock cycles
    #10;
    reset = 0;
    
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
