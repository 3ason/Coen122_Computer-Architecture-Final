`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2023 03:11:17 PM
// Design Name: 
// Module Name: imm_testbench
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


module imm_testbench();
    reg clk;
    wire [31:0] out;
    reg [31:0] instr;
    
    imm_gen testImm(instr, out);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
       instr = 32'b11110001011100010001011000000000;
       
       #50;
       
       instr = 32'b01011000100101011100001000100101;
       #50;
       $finish;
    end

endmodule
