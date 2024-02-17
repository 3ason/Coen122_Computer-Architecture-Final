`timescale 1ns / 1ps

module alu(A,B,aluOp,out,N,Z);
    input [31:0] A, B;
    input [3:0] aluOp;
    output reg [31:0] out;
    output reg N;
    output reg Z;
    
    always@(A, B, aluOp)
        begin
        if (aluOp == 4'b0000) //add
            out = A + B;
        if (aluOp == 4'b0001) //increment
            out = A + B;
        if (aluOp == 4'b0010) //negate
            out = -A;
        if (aluOp == 4'b0011) //subtract 
            out = A - B;
        if (aluOp == 4'b0100) //pass value 
            out = A;
            
        if (out == 0)
            Z = 1;
        else 
            Z = 0;
            
        if (out[31] == 1)
            N = 1;
        else
            N = 0;
        
        end
endmodule

module twoToOne(B,sel,out);
    input [31:0] B;
    input sel;
    output [31:0] out;
    wire notSel;
    
    not(notSel, sel);
    and(out[0], B[0], notSel);
    and(out[1], B[1], notSel);
    and(out[2], B[2], notSel);
    and(out[3], B[3], notSel);
    and(out[4], B[4], notSel);
    and(out[5], B[5], notSel);
    and(out[6], B[6], notSel);
    and(out[7], B[7], notSel);
    and(out[8], B[8], notSel);
    and(out[9], B[9], notSel);
    and(out[10], B[10], notSel);
    and(out[11], B[11], notSel);
    and(out[12], B[12], notSel);
    and(out[13], B[13], notSel);
    and(out[14], B[14], notSel);
    and(out[15], B[15], notSel);
    and(out[16], B[16], notSel);
    and(out[17], B[17], notSel);
    and(out[18], B[18], notSel);
    and(out[19], B[19], notSel);
    and(out[20], B[20], notSel);
    and(out[21], B[21], notSel);
    and(out[22], B[22], notSel);
    and(out[23], B[23], notSel);
    and(out[24], B[24], notSel);
    and(out[25], B[25], notSel);
    and(out[26], B[26], notSel);
    and(out[27], B[27], notSel);
    and(out[28], B[28], notSel);
    and(out[29], B[29], notSel);
    and(out[30], B[30], notSel);
    and(out[31], B[31], notSel);
endmodule

module adder(A, B, cin, out, cout);
    input A,B,cin;
    output out, cout;
    wire xor_out, andAB_out, cin_and_out;
    
    xor(xor_out, A, B);
    xor(out, xor_out, cin);
    and(cin_and_out, cin, xor_out);
    and(andAB_out, A, B);
    or(cout, andAB_out, cin_and_out);
endmodule

module adder_32(A,B,cout,sum);
    input [31:0] A;
    input [31:0] B;
    output [31:0] sum;
    output cout;
    wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30;
    
    adder adder_1(A[0], B[0], 1'b0, sum[0], c0);
    adder adder_2(A[1], B[1], c0, sum[1], c1);
    adder adder_3(A[2], B[2], c1, sum[2], c2);
    adder adder_4(A[3], B[3], c2, sum[3], c3);
    adder adder_5(A[4], B[4], c3, sum[4], c4);
    adder adder_6(A[5], B[5], c4, sum[5], c5);
    adder adder_7(A[6], B[6], c5, sum[6], c6);
    adder adder_8(A[7], B[7], c6, sum[7], c7);
    adder adder_9(A[8], B[8], c7, sum[8], c8);
    adder adder_10(A[9], B[9], c8, sum[9], c9);
    adder adder_11(A[10], B[10], c9, sum[10], c10);
    adder adder_12(A[11], B[11], c10, sum[11], c11);
    adder adder_13(A[12], B[12], c11, sum[12], c12);
    adder adder_14(A[13], B[13], c12, sum[13], c13);
    adder adder_15(A[14], B[14], c13, sum[14], c14);
    adder adder_16(A[15], B[15], c14, sum[15], c15);
    adder adder_17(A[16], B[16], c15, sum[16], c16);
    adder adder_18(A[17], B[17], c16, sum[17], c17);
    adder adder_19(A[18], B[18], c17, sum[18], c18);
    adder adder_20(A[19], B[19], c18, sum[19], c19);
    adder adder_21(A[20], B[20], c19, sum[20], c20);
    adder adder_22(A[21], B[21], c20, sum[21], c21);
    adder adder_23(A[22], B[22], c21, sum[22], c22);
    adder adder_24(A[23], B[23], c22, sum[23], c23);
    adder adder_25(A[24], B[24], c23, sum[24], c24);
    adder adder_26(A[25], B[25], c24, sum[25], c25);
    adder adder_27(A[26], B[26], c25, sum[26], c26);
    adder adder_28(A[27], B[27], c26, sum[27], c27);
    adder adder_29(A[28], B[28], c27, sum[28], c28);
    adder adder_30(A[29], B[29], c28, sum[29], c29);
    adder adder_31(A[30], B[30], c29, sum[30], c30);
    adder adder_32(A[31], B[31], c30, sum[31], cout);
endmodule

module negate(A, out);
    input [31:0] A;
    output [31:0] out;
    wire [31:0] negA;
    wire cout;
    
    not(negA[0], A[0]);
    not(negA[1], A[1]);
    not(negA[2], A[2]);
    not(negA[3], A[3]);
    not(negA[4], A[4]);
    not(negA[5], A[5]);
    not(negA[6], A[6]);
    not(negA[7], A[7]);
    not(negA[8], A[8]);
    not(negA[9], A[9]);
    not(negA[10], A[10]);
    not(negA[11], A[11]);
    not(negA[12], A[12]);
    not(negA[13], A[13]);
    not(negA[14], A[14]);
    not(negA[15], A[15]);
    not(negA[16], A[16]);
    not(negA[17], A[17]);
    not(negA[18], A[18]);
    not(negA[19], A[19]);
    not(negA[20], A[20]);
    not(negA[21], A[21]);
    not(negA[22], A[22]);
    not(negA[23], A[23]);
    not(negA[24], A[24]);
    not(negA[25], A[25]);
    not(negA[26], A[26]);
    not(negA[27], A[27]);
    not(negA[28], A[28]);
    not(negA[29], A[29]);
    not(negA[30], A[30]);
    not(negA[31], A[31]);
    
    adder_32 add_32(.A(negA), .B(1), .cout(cout), .sum(out));
endmodule

module threeToOne(A, negA, sel, out);
    input [31:0] A;
    input [31:0] negA;
    input [1:0] sel;
    output [31:0] out;
    
    wire [31:0] out1;
    wire [31:0] out2;
    wire [31:0] out3;
    wire notSel0, notSel1;
    
    not(notSel0, sel[0]);
    not(notSel1, sel[1]);
    
    //selecting A
    and(out1[0], A[0], notSel0, notSel1);
    and(out1[1], A[1], notSel0, notSel1);
    and(out1[2], A[2], notSel0, notSel1);
    and(out1[3], A[3], notSel0, notSel1);
    and(out1[4], A[4], notSel0, notSel1);
    and(out1[5], A[5], notSel0, notSel1);
    and(out1[6], A[6], notSel0, notSel1);
    and(out1[7], A[7], notSel0, notSel1);
    and(out1[8], A[8], notSel0, notSel1);
    and(out1[9], A[9], notSel0, notSel1);
    and(out1[10], A[10], notSel0, notSel1);
    and(out1[11], A[11], notSel0, notSel1);
    and(out1[12], A[12], notSel0, notSel1);
    and(out1[13], A[13], notSel0, notSel1);
    and(out1[14], A[14], notSel0, notSel1);
    and(out1[15], A[15], notSel0, notSel1);
    and(out1[16], A[16], notSel0, notSel1);
    and(out1[17], A[17], notSel0, notSel1);
    and(out1[18], A[18], notSel0, notSel1);
    and(out1[19], A[19], notSel0, notSel1);
    and(out1[20], A[20], notSel0, notSel1);
    and(out1[21], A[21], notSel0, notSel1);
    and(out1[22], A[22], notSel0, notSel1);
    and(out1[23], A[23], notSel0, notSel1);
    and(out1[24], A[24], notSel0, notSel1);
    and(out1[25], A[25], notSel0, notSel1);
    and(out1[26], A[26], notSel0, notSel1);
    and(out1[27], A[27], notSel0, notSel1);
    and(out1[28], A[28], notSel0, notSel1);
    and(out1[29], A[29], notSel0, notSel1);
    and(out1[30], A[30], notSel0, notSel1);
    and(out1[31], A[31], notSel0, notSel1);
    
    //selecting module adder
    and(out2[0], negA[0], notSel0, sel[1]);
    and(out2[1], negA[1], notSel0, sel[1]);
    and(out2[2], negA[2], notSel0, sel[1]);
    and(out2[3], negA[3], notSel0, sel[1]);
    and(out2[4], negA[4], notSel0, sel[1]);
    and(out2[5], negA[5], notSel0, sel[1]);
    and(out2[6], negA[6], notSel0, sel[1]);
    and(out2[7], negA[7], notSel0, sel[1]);
    and(out2[8], negA[8], notSel0, sel[1]);
    and(out2[9], negA[9], notSel0, sel[1]);
    and(out2[10], negA[10], notSel0, sel[1]);
    and(out2[11], negA[11], notSel0, sel[1]);
    and(out2[12], negA[12], notSel0, sel[1]);
    and(out2[13], negA[13], notSel0, sel[1]);
    and(out2[14], negA[14], notSel0, sel[1]);
    and(out2[15], negA[15], notSel0, sel[1]);
    and(out2[16], negA[16], notSel0, sel[1]);
    and(out2[17], negA[17], notSel0, sel[1]);
    and(out2[18], negA[18], notSel0, sel[1]);
    and(out2[19], negA[19], notSel0, sel[1]);
    and(out2[20], negA[20], notSel0, sel[1]);
    and(out2[21], negA[21], notSel0, sel[1]);
    and(out2[22], negA[22], notSel0, sel[1]);
    and(out2[23], negA[23], notSel0, sel[1]);
    and(out2[24], negA[24], notSel0, sel[1]);
    and(out2[25], negA[25], notSel0, sel[1]);
    and(out2[26], negA[26], notSel0, sel[1]);
    and(out2[27], negA[27], notSel0, sel[1]);
    and(out2[28], negA[28], notSel0, sel[1]);
    and(out2[29], negA[29], notSel0, sel[1]);
    and(out2[30], negA[30], notSel0, sel[1]);
    and(out2[31], negA[31], notSel0, sel[1]);
    
    and(out3[0], 1, sel[0], notSel1);
    and(out3[1], 0, sel[0], notSel1);
    and(out3[2], 0, sel[0], notSel1);
    and(out3[3], 0, sel[0], notSel1);
    and(out3[4], 0, sel[0], notSel1);
    and(out3[5], 0, sel[0], notSel1);
    and(out3[6], 0, sel[0], notSel1);
    and(out3[7], 0, sel[0], notSel1);
    and(out3[8], 0, sel[0], notSel1);
    and(out3[9], 0, sel[0], notSel1);
    and(out3[10], 0, sel[0], notSel1);
    and(out3[11], 0, sel[0], notSel1);
    and(out3[12], 0, sel[0], notSel1);
    and(out3[13], 0, sel[0], notSel1);
    and(out3[14], 0, sel[0], notSel1);
    and(out3[15], 0, sel[0], notSel1);
    and(out3[16], 0, sel[0], notSel1);
    and(out3[17], 0, sel[0], notSel1);
    and(out3[18], 0, sel[0], notSel1);
    and(out3[19], 0, sel[0], notSel1);
    and(out3[20], 0, sel[0], notSel1);
    and(out3[21], 0, sel[0], notSel1);
    and(out3[22], 0, sel[0], notSel1);
    and(out3[23], 0, sel[0], notSel1);
    and(out3[24], 0, sel[0], notSel1);
    and(out3[25], 0, sel[0], notSel1);
    and(out3[26], 0, sel[0], notSel1);
    and(out3[27], 0, sel[0], notSel1);
    and(out3[28], 0, sel[0], notSel1);
    and(out3[29], 0, sel[0], notSel1);
    and(out3[30], 0, sel[0], notSel1);
    and(out3[31], 0, sel[0], notSel1);
    
    or(out[0], out1[0], out2[0], out3[0]);
    or(out[1], out1[1], out2[1], out3[1]);
    or(out[2], out1[2], out2[2], out3[2]);
    or(out[3], out1[3], out2[3], out3[3]);
    or(out[4], out1[4], out2[4], out3[4]);
    or(out[5], out1[5], out2[5], out3[5]);
    or(out[6], out1[6], out2[6], out3[6]);
    or(out[7], out1[7], out2[7], out3[7]);
    or(out[8], out1[8], out2[8], out3[8]);
    or(out[9], out1[9], out2[9], out3[9]);
    or(out[10], out1[10], out2[10], out3[10]);
    or(out[11], out1[11], out2[11], out3[11]);
    or(out[12], out1[12], out2[12], out3[12]);
    or(out[13], out1[13], out2[13], out3[13]);
    or(out[14], out1[14], out2[14], out3[14]);
    or(out[15], out1[15], out2[15], out3[15]);
    or(out[16], out1[16], out2[16], out3[16]);
    or(out[17], out1[17], out2[17], out3[17]);
    or(out[18], out1[18], out2[18], out3[18]);
    or(out[19], out1[19], out2[19], out3[19]);
    or(out[20], out1[20], out2[20], out3[20]);
    or(out[21], out1[21], out2[21], out3[21]);
    or(out[22], out1[22], out2[22], out3[22]);
    or(out[23], out1[23], out2[23], out3[23]);
    or(out[24], out1[24], out2[24], out3[24]);
    or(out[25], out1[25], out2[25], out3[25]);
    or(out[26], out1[26], out2[26], out3[26]);
    or(out[27], out1[27], out2[27], out3[27]);
    or(out[28], out1[28], out2[28], out3[28]);
    or(out[29], out1[29], out2[29], out3[29]);
    or(out[30], out1[30], out2[30], out3[30]);
    or(out[31], out1[31], out2[31], out3[31]);
endmodule