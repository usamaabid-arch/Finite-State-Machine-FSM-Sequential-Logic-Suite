`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2026 10:22:53 PM
// Design Name: 
// Module Name: comparator_fsm
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

module comparator_fsm(input logic clk, rst, data_in,
output logic indicator);

    logic [1:0] state, next_state;
    logic new_value, new_new_value, new_new_new_value;
    
    always_ff@(posedge clk or posedge rst) begin
        if(rst) begin
            state <= 0;
        end
        else begin
            state <= next_state;
        end
    end

    always_comb begin        
        if(!rst) begin
            case(state)
                0: begin
                    indicator = 0;
                    new_value = data_in;
                    next_state = 1;
                end
                1: begin
                    indicator = 0;
                    new_new_value = data_in;
                    if(new_value == new_new_value) begin
                        next_state = 2;
                    end
                    else begin
                        next_state = 1;
                        new_value = data_in;
                    end
                end
                2: begin
                    new_new_new_value = data_in;
                    if(new_value == new_new_value == new_new_new_value) begin
                        indicator = 1;
                        next_state = 0;
                    end
                    else begin
                        next_state = 1;
                        new_value = data_in;
                    end
                end
                default: begin
                    next_state = 0;
                end
            endcase
        end
        else begin
            indicator = 0;
        end
    end
    
endmodule
