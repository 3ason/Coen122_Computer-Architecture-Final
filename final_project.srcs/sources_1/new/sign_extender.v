`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 02:54:09 PM
// Design Name: 
// Module Name: sign_extender
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


module sign_extender(signIn, signOut);
    input [21:0] signIn;
    output reg [31:0] signOut;
    
    always@ (signIn, signOut)
        
        if (signIn[21] == 1)
            signOut = {10'b1111111111,signIn};
        else if (signIn[21] == 0)
            signOut = {10'b0000000000,signIn};
endmodule
