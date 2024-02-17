module control_unit(opcode, regWrite, memtoReg, pctoALU, immtoALU, branchN, branchZ, jump, jumpMem, memRead, memWrite, aluOp);
input [3:0] opcode;
output reg [3:0] aluOp;
output reg regWrite, memtoReg, pctoALU, immtoALU, branchN, branchZ, jump, jumpMem, memRead, memWrite;
always@(opcode)
    begin
	if (opcode == 4'b0011) //Store
	begin
		regWrite = 0;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 1;
		aluOp = 4'b0100;
	end
	
	if (opcode == 4'b0000) //NOP
	begin
		regWrite = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0100;
	end
	
	if (opcode == 4'b1111) //Save PC
	begin
		regWrite = 1;
		memtoReg = 0;
		pctoALU= 1;
		immtoALU = 1;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0001;
	end
	
	if (opcode == 4'b1110) //Load
	begin
		regWrite = 1;
		memtoReg = 1;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 1;
		memWrite = 0;
		aluOp = 4'b0100;
	end
	
	if (opcode == 4'b0100) //Add
	begin
		regWrite = 1;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0000;
	end
	
	if (opcode == 4'b0101) //Increment
	begin
		regWrite = 1;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 1;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0001;
	end
	
	if (opcode == 4'b0110) //Negate
	begin
		regWrite = 1;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0010;
	end
	
	if (opcode == 4'b0111) //Subtract
	begin
		regWrite = 1;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0011;
	end
	
	if (opcode == 4'b1000) //Jump
	begin
		regWrite = 0;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 0;
		jump = 1;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0100;
	end
	
	if (opcode == 4'b1001) //Branch if Z
	begin
		regWrite = 0;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 1;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0100;
	end
	
	if (opcode == 4'b1010) //Jump Mem
	begin
		regWrite = 0;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 0;
		branchZ = 0;
		jump = 0;
		jumpMem=1;
		memRead = 1;
		memWrite = 0;
		aluOp = 4'b0100;
	end
	
	if (opcode == 4'b1011) //Branch if N
	begin
		regWrite = 0;
		memtoReg = 0;
		pctoALU= 0;
		immtoALU = 0;
		branchN = 1;
		branchZ = 0;
		jump = 0;
		jumpMem=0;
		memRead = 0;
		memWrite = 0;
		aluOp = 4'b0100;
	end
	
    end
endmodule