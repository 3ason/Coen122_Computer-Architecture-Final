`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 01:54:35 PM
// Design Name: 
// Module Name: memory
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


module data(clock, write, read, address, datain, dataout);
    input clock, write, read;
    input [31:0] address;
    input [31:0] datain;
    reg [31:0] data[65535:0];
    output reg [31:0] dataout;
    
    initial begin
        data[5] = 2;
        data[6] = 5;
        data[7] = 3;
        data[8] = 20;
        data[9] = 10;
        data[10] = 33;
        data[11] = 10;
    end
    
    always@(posedge clock)
    begin
        if (read == 1)
            dataout = data[address[15:0]];
        if (write == 1)
            data[address[15:0]] = datain;
    end
endmodule

module instruction(clock, address, instruction_out);
    input clock;
    input [7:0] address;
    wire [31:0] instructions [255:0];
    output reg [31:0] instruction_out;
    
    
    
//individual instructions
   /*
   
 
    assign instructions[0] = 32'b00000000000000000000000000000000; //nop
    assign instructions[1] = 32'b0100_0001010000100000110000000000; // add x5, x2, x3 
    assign instructions[2] = 32'b01110000000000010000100000000000; //subtract
    assign instructions[3] = 32'b0101000000000001_0000000000000011; //Increment
    assign instructions[4] = 32'b11100000010010100000000000000000; //load  x1,  x10
    assign instructions[5] = 32'b00000000000000000000000000000000; //nop

    assign instructions[6] = 32'b00110000000010100000000000000000; //store  x0,  x10
    assign instructions[7] = 32'b00000000000000000000000000000000; //nop

    assign instructions[8] = 32'b0110_000000_000001_000010_0000000000; //Negate
    assign instructions[9] = 32'b00000000000000000000000000000000; //nop

    assign instructions[10] = 32'b11110000110000000000000000000001; //savepc x3, 1
    assign instructions[11] = 32'b00000000000000000000000000000000; //nop
    assign instructions[12] = 32'b10000000000000110000000000000000; //jump x
    assign instructions[13] = 32'b00000000000000000000000000000000; //nop
    assign instructions[14] = 32'b10100000000000110000000000000000; // jump memory
    assign instructions[15] = 32'b00000000000000000000000000000000; //nop
    assign instructions[16] = 32'b00000000000000000000000000000000; //nop
    assign instructions[17] = 32'b10010000000010010000000000000000; // branch if zero
    assign instructions[18] = 32'b10110000000101000000000000000000; //branchn x20
 */
    //finished store and sum negate
      /*
     assign instructions[0] = 32'b00000000000000000000000000000000; //nop
     assign instructions[1] = 32'b01010000010000100000000000000011;//x1, x2, 3 increment
      
     assign instructions[3] = 32'b1000_0000000011100000000000000000; // jump  rs = 14 
     assign instructions[4] = 32'b00000000000000000000000000000000; //nop
     assign instructions[5] = 32'b10100000000101000000000000000000; // jump memory rs = 20
     assign instructions[6] = 32'b00000000000000000000000000000000; //nop
     assign instructions[7] = 32'b00000000000000000000000000000000; //nop

     
     */


     assign instructions[0] = 32'b00000000000000000000000000000000; //nop
     assign instructions[1] = 32'b01010000010000100000000000000011;//x1, x2, 3 increment
     assign instructions[2] = 32'b00000000000000000000000000000000; //nop 
     assign instructions[3] = 32'b01100000100010110000000000000000;//negate //rd: 2, rs: 11, rt: 0



    
    
    
   // assign instructions[0] = 32'b00000000000000000000000000000000; //nop
   // assign instructions[2] = 32'b00000000000000000000000000000000; //nop
   // assign instructions[3] = 32'b00110000000010100000000000000000; //store  x0,  x10
   // assign instructions[4] = 32'b00000000000000000000000000000000; //nop
   // assign instructions[5] = 32'b0110_000000_000001_000010_0000000000; //Negate
   // assign instructions[6] = 32'b00000000000000000000000000000000; //nop

 
    
    
    
   //instructinos for lab report
    //    assign instructions[0] = 32'b0100_0001010000100000110000000000; // add x5, x2, x3 
      //  assign instructions[1] = 32'b1111_0010010000000000000000000001; // svpc x9, 1



   //THIS IS THE SUM CALCULATION
    assign instructions[0] = 32'b0000_0000000000000000000000000000; // nop
    assign instructions[1] = 32'b0111_0001000001000001000000000000; // sub x4, x4, x4
    assign instructions[2] = 32'b0100_0001010000100000110000000000; // add x5, x2, x3 
    assign instructions[3] = 32'b1111_0010010000000000000000000001; // svpc x9, 1
    assign instructions[4] = 32'b1110_000110_000010_000000_0000000000; // ld x6, x2
    assign instructions[5] = 32'b0000_0000000000000000000000000000; // nop
    assign instructions[6] = 32'b0100_000100_000100_000110_0000000000; // add x4, x4, x6
    assign instructions[7] = 32'b0101_0000100000100000000000000001; // inc x2, x2, 1
    assign instructions[8] = 32'b0000_0000000000000000000000000000; // nop
    assign instructions[9] = 32'b0111_0010000000100001010000000000; // sub x8, x2. x5
    assign instructions[10] = 32'b1011_000000_001001_0000000000000000; // brn x9
    assign instructions[11] = 32'b0000_0000000000000000000000000000; // nop



    always@ (posedge clock)
    begin
        instruction_out = instructions[address];
    end
endmodule

module register(clock, regWrite, rs, rt, rd, datain, rs_out, rt_out);
input clock, regWrite;
input [5:0] rs;
input [5:0] rt;
input [5:0] rd;
input [31:0] datain;
reg[31:0] registers[63:0];
output reg[31:0] rs_out;
output reg[31:0] rt_out;

initial begin
/*
registers[10] = 11;
registers[11] = 12;
registers[12] = 13;
registers[13] = 14;
registers[14] = 15;
registers[15] = 16;
registers[16] = 17;
registers[17] = 18;
registers[18] = 19;
registers[19] = 20;
registers[20] = 28;
registers[21] = 22;
registers[22] = 23;
registers[23] = 24;
registers[24] = 25;
registers[25] = 26;
registers[26] = 27;
registers[27] = 28;
registers[28] = 29;
registers[29] = 30;
*/
/*
registers[30] = 31;
registers[31] = 32;
registers[32] = 33;
registers[33] = 34;
registers[34] = 35;
registers[35] = 36;
registers[36] = 37;
registers[37] = 38;
registers[38] = 39;
registers[39] = 40;
registers[40] = 41;
registers[41] = 42;
registers[42] = 43;
registers[43] = 44;
registers[44] = 45;
registers[45] = 46;
registers[46] = 47;
registers[47] = 48;
registers[48] = 49;
registers[49] = 50;
registers[50] = 51;
registers[51] = 52;
registers[52] = 53;
registers[53] = 54;
registers[54] = 55;
registers[55] = 56;
registers[56] = 57;
registers[57] = 58;
registers[58] = 59;
registers[59] = 60;
registers[60] = 61;
registers[61] = 62;
registers[62] = 63;
registers[63] = 40;
*/
//these below are conditions for sum calculations
    registers[4] = 0;
    registers[0] = 0; //c0 = 0 
       
    registers[2] = 5; //base of a
    registers[3] = 7; //n
end

always@ (posedge clock)
    begin
        if (regWrite == 1)
            registers[rd] = datain;
            
        rs_out = registers[rs];
        rt_out = registers[rt]; // question about conditional
    end
endmodule