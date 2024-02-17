`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2023 02:52:20 PM
// Design Name: 
// Module Name: datapath_testbench
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


module datapath_testbench();
    reg temp;

    reg clk;
    wire pcAdderCout;
    wire [0:7] pcOut;
    wire [0:7] pcAdderSum;
    wire [31:0] instructionIf;
    
    wire [31:0] instructionId;
    wire [7:0] pcId;
    wire [7:0] nextPc;
    
    //IF stage
    adder_32 pcAdder(.A(pcOut), .B(1), .cout(pcAdderCout), .sum(pcAdderSum));
    program_counter pc(.PCin(nextPc), .PCout(pcOut), .clock(clk));
    instruction instMem(.clock(clk), .address(pcOut), .instruction_out(instructionIf));
    
    IF_ID_buffer ifIdBuffer(.clock(clk), .instructionInput(instructionIf), .instructionOutput(instructionId), .programCounterInput(pcOut), .programCounterOutput(pcId));
    
    // ID stage
    wire [3:0] aluOpId;
    wire regWriteId, memtoRegId, PCtoAluId, immToAluId, branchNId, branchZId, jumpId, jumpMemId, memReadId, memWriteId;
     
    control_unit control(.opcode(instructionId[31:28]), .regWrite(regWriteId), .memtoReg(memtoRegId), .pctoALU(PCtoAluId), .immtoALU(immToAluId),.branchN(branchNId), .branchZ(branchZId), .jump(jumpId), .jumpMem(jumpMemId), .memRead(memReadId), .memWrite(memWriteId), .aluOp(aluOpId));
    
    wire [31:0] rsId;
    wire [31:0] rtId;
    wire [31:0] immId;
    
    wire [31:0] writeDataWb; //wb from mux
    wire [5:0] rdWb;
    wire regWriteWb;
    
    register registerFile(.clock(clk), .regWrite(regWriteWb), .rs(instructionId[21:16]), .rt(instructionId[15:10]), .rd(rdWb), .datain(writeDataWb), .rs_out(rsId), .rt_out(rtId));
    imm_gen immediate(.instr(instructionId), .out(immId));
    
    wire [7:0] pcEx;
    wire regWriteEx, memtoRegEx,PCtoAluEx, immToAluEx, jumpMemEx, memReadEx, memWriteEx;
    wire [31:0] rsEx;
    wire [31:0] rtEx;
    wire [5:0] rdEx;
    wire [31:0] immEx;
    wire [3:0] aluOpEx;
    
    ID_EX_buffer idExBuffer(.clock(clk), .programCounterInput(pcId), .programCounterOutput(pcEx), .regWriteInput(regWriteId),
        .memtoRegInput(memtoRegId), .pctoALUInput(PCtoAluId), .immtoALUInput(immToAluId), .jumpMemInput(jumpMemId),
        .memReadInput(memReadId), .memWriteInput(memWriteId), .regWriteOutput(regWriteEx), .memtoRegOutput(memtoRegEx),
        .pctoALUOutput(PCtoAluEx), .immtoALUOutput(immToAluEx), .jumpMemOutput(jumpMemEx),
        .memReadOutput(memReadEx), .memWriteOutput(memWriteEx), .rsInput(rsId), .rsOutput(rsEx), .rtInput(rtId), .rtOutput(rtEx),
        .rdInput(instructionId[27:22]), .rdOutput(rdEx), .immGenInput(immId), .immGenOutput(immEx), .aluOpIn(aluOpId),
        .aluOpOut(aluOpEx)
);
    
    //EX stage 
    wire [31:0] readDataEx;
    data dataMem(.clock(clk), .write(memWriteEx), .read(memReadEx), .address(rsEx), .datain(rtEx), .dataout(readDataEx));
    
    wire [31:0] aluIn0;
    wire [31:0] aluIn1;
    wire Nflag, Zflag;
    wire [31:0] aluResultEx;
    wire [31:0] pcExExtended;
    
    sign_extend extendPc(.signIn(pcEx), .signOut(pcExExtended));
    mux2 aluTopMux(.in0(rsEx), .in1(pcExExtended), .sel(PCtoAluEx), .out(aluIn0));
    mux2 aluBottomMux(.in0(rtEx), .in1(immEx), .sel(immToAluEx), .out(aluIn1));
    
    alu aluInstance(.A(aluIn0), .B(aluIn1), .aluOp(aluOpEx), .out(aluResultEx), .N(Nflag), .Z(Zflag));
    
    wire memtoRegWb;
    wire [31:0] aluResultWb;
    wire [31:0] readDataWb;
    wire [31:0] readDataEx;
    
    EX_WB_buffer exWbBuffer(.clock(clk), .regWriteInput(regWriteEx), .memtoRegInput(memtoRegEx), .aluResultInput(aluResultEx), .rdInput(rdEx), .rdOutput(rdWb), .regWriteOutput(regWriteWb), .memtoRegOutput(memtoRegWb), .aluResultOutput(aluResultWb), .readDataInput(readDataEx), .readDataOutput(readDataWb));
    
    //WB stage
    
    mux2 muxWb(.in0(aluResultWb), .in1(readDataWb), .sel(memtoRegWb), .out(writeDataWb));
    
    //branch 
    wire orIn0, orIn1;
    wire branchSel;
    wire [7:0] branchAddress;
    
    and_gate andZ(.A(Zflag), .B(branchZId), .out(orIn0));
    and_gate andN(.A(Nflag), .B(branchNId), .out(orIn1));
    or_gate orBranch(.A(orIn0), .B(orIn1), .C(jumpId), .out(branchSel));
    
    mux2 branchMux(.in0(pcAdderSum), .in1(rsId), .sel(branchSel), .out(branchAddress));
    mux2 jumpMemMux(.in0(branchAddress), .in1(readDataEx), .sel(jumpMemEx), .out(nextPc));
    
    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end
    
    initial begin
        #800;
        $finish;
    end
endmodule
