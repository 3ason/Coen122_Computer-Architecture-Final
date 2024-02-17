`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 02:51:22 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(PCin, PCout, clock);
    input [7:0] PCin;
    input clock;
    output reg [7:0] PCout;
    
    initial
    begin
        PCout = 0;
    end
    
    always@ (negedge clock)
    begin
        if (PCin)
            PCout  = PCin;
        
        if (PCin == 0) //allow jumps back to 0
            PCout = PCin;
    end
endmodule
