`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 03:52:43 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk;
    wire [31:0] out;
    reg [3:0] aluOp;
    reg [31:0] A;
    reg [31:0] B;
    wire N;
    wire Z;
    
    alu testAlu(A, B, aluOp, out, N, Z);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
       A = 10;
       B = 2;
       aluOp = 4'b0000;
        
       #50;
       
       A = 10;
       B = 10;
       aluOp = 4'b0011;
       
       #50;
       
       A = 10;
       B = 12;
       
       #50;
       
       A = 1;
       B = 2;
       aluOp = 4'b0001;
       #50;
       
       A = 2;
       aluOp = 4'b0100;
       #50;
       
       A = 11;
       aluOp = 4'b0010;
       #50;
       
       $finish;
    end

endmodule
