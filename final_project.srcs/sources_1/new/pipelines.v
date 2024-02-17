`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2023 03:13:38 PM
// Design Name: 
// Module Name: pipelines
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


module IF_ID_buffer(clock, instructionInput, instructionOutput, programCounterInput, programCounterOutput);
input clock;
input [31:0] instructionInput;
input [7:0] programCounterInput;
output reg [31:0] instructionOutput;
output reg [7:0]programCounterOutput;

always @(negedge clock)
        begin 
            instructionOutput = instructionInput;
            programCounterOutput = programCounterInput;
        end
endmodule

module ID_EX_buffer(clock, programCounterInput, programCounterOutput, regWriteInput, memtoRegInput, pctoALUInput, immtoALUInput, jumpMemInput, memReadInput, memWriteInput
, regWriteOutput, memtoRegOutput, pctoALUOutput, immtoALUOutput,jumpMemOutput, memReadOutput, memWriteOutput,
rsInput, rsOutput, rtInput, rtOutput, rdInput, rdOutput, immGenInput, immGenOutput, aluOpIn, aluOpOut
);
    input clock;
    input [7:0] programCounterInput;
    output reg [7:0] programCounterOutput;
    
    input [31:0] rsInput;
    input [31:0] rtInput;
    
    output reg [31:0] rsOutput;
    output reg [31:0] rtOutput;
    
    input [5:0] rdInput;
    output reg [5:0] rdOutput;
    
    input [31:0] immGenInput;
    output reg [31:0] immGenOutput; 
    
    input [3:0] aluOpIn;
    output reg [3:0] aluOpOut;
    
    input regWriteInput, memtoRegInput, pctoALUInput, immtoALUInput, jumpMemInput, memReadInput, memWriteInput;
    output reg regWriteOutput;
    output reg memtoRegOutput;
    output reg pctoALUOutput;
    output reg immtoALUOutput;
    output reg jumpMemOutput;
    output reg memReadOutput;
    output reg memWriteOutput;
    always @(negedge clock)
            begin 
               programCounterOutput = programCounterInput;
               rsOutput = rsInput;
               rtOutput = rtInput;
               immGenOutput = immGenInput;
               rdOutput = rdInput;
               regWriteOutput = regWriteInput;
               aluOpOut = aluOpIn;
               memtoRegOutput = memtoRegInput;
               pctoALUOutput = pctoALUInput;
               immtoALUOutput = immtoALUInput;
               jumpMemOutput = jumpMemInput;
               memReadOutput = memReadInput;
               memWriteOutput = memWriteInput;
            end
endmodule

module EX_WB_buffer(clock, regWriteInput, memtoRegInput,aluResultInput, rdInput, readDataInput, rdOutput, regWriteOutput, memtoRegOutput, aluResultOutput, readDataOutput);
input clock, regWriteInput, memtoRegInput;
input [31:0] aluResultInput;
input [5:0] rdInput;
input [31:0] readDataInput;

output reg regWriteOutput, memtoRegOutput;
output reg [31:0] aluResultOutput;
output reg [5:0] rdOutput;
output reg [31:0] readDataOutput;

always @(negedge clock)
    begin
        regWriteOutput = regWriteInput;
        memtoRegOutput = memtoRegInput;
        aluResultOutput = aluResultInput;
        rdOutput = rdInput;
        readDataOutput = readDataInput;
    end
endmodule