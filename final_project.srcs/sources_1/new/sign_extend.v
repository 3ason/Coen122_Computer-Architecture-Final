`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2023 01:39:07 AM
// Design Name: 
// Module Name: sign_extend
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
module sign_extend(signIn, signOut);
    input [7:0] signIn;
    output reg [31:0] signOut;
    
    always@ (signIn, signOut)
            signOut = {24'b0000_0000_0000_0000_0000_0000,signIn};
endmodule
