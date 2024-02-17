`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2023 02:59:08 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(instr, out);
    input [31:0] instr;
    output reg [31:0] out;
    
    always@(instr) begin
        if (instr[31:28] == 4'b0101) //increment 
        begin
            // sign extend the result 
            if (instr[15] == 0)
                out = {16'b0000000000000000, instr[15:0]};
            else
                out = {16'b1111111111111111, instr[15:0]};
        end
        
        if (instr[31:28] == 4'b1111) //save pc 
        begin
            // sign extend the result 
            if (instr[21] == 0)
                out = {10'b0000000000, instr[21:0]};
            else
                out = {10'b1111111111, instr[21:0]};
        end
    end
endmodule
