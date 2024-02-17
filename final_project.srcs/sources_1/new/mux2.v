`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2023 04:56:05 PM
// Design Name: 
// Module Name: mux2
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


module mux2(in0, in1, sel, out);
    input [31:0] in0;
    input [31:0] in1;
    input sel;
    output reg [31:0] out;
    
    always @(in0, in1, sel)
        begin
            if (sel == 0)
                out = in0;
                
            else 
                out = in1;
        end
endmodule
