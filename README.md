#COEN 122L: Project, Version with SUM


Design a Structural Model of a Pipelined CPU
The project is to design a structural model of a pipelined CPU with 13 instructions using Verilog HDL. 
Description:
In this project, you will design a 32-bit pipelined CPU for the given SCU Instruction Set Architecture (SCU ISA). The SCU ISA is described below.

•	Register file size: 64 registers, each register has 32 bits.
•	PC: 32 bits
•	Instruction format: Each instruction is 32-bit wide, and consists of five fields: opcode, rd, rs, rt, and unused. The format is as follows.

Opcode (4 bits)	rd (6 bits)	rs (6 bits)	rt (6 bits)	unused(10 bits)
The 13 instructions are defined in following table. 
Instruction	Symbol	Opcode	rd	rs	rt	Function
No operation	NOP	0000	  
 
 
No operation
Save PC	SVPC rd, y	1111	rd	   y	xrd  PC+y
Load	LD rd, rs	1110	rd	rs	 
xrd  M[xrs]
Store	ST rt, rs	0011	 
rs	rt	M[xrs]  xrt
Add	ADD rd, rs, rt	0100	rd	rs	rt	xrd  x rs + x rt 
Increment	INC rd, rs, y	0101	rd	rs	 y	x rd  x rs + y
Negate	NEG rd, rs	0110	rd	rs	 
x rd  - x rs
Subtract	SUB rd, rs, rt	0111	rd	rs	rt	x rd  x rs – x rt
Jump	J rs	1000	 
rs	 
PC  x rs
Branch if zero	BRZ rs	1001	 
rs	 
PC  x rs, if Z = 1
Jump memory	JM rs	1010	 
rs	 
PC  M[x rs]
Branch if negative	BRN rs	1011	 
rs	 
PC  x rs, if N = 1 
SUM	SUM, rd, rs, rt	0001	rd	rs	rt	See *

*x rd  memory[xrs+1]+ ... +memory [xrs+xrt-1]
 : don't care
Also, use the instructions in the SCU ISA to write two versions of assembly program of the benchmark below. 
(1)	A  					
The first version does not use the SUM instruction and the second one uses the SUM instruction. 
You can create any new instructions to make the above coding easier. This benchmark will be used to test your CPU. You may not need five stages in your pipeline.
When you analyze the cycle time, you can use the following delay data: delay of memory (I and D memory): 2 ns., delay of register file: 1.5 ns., delay of ALU (adders): 2 ns. Ignore the delays of all other components.
Use the ALU attached in the last page.
The last instruction SUM is optional. However, two extra points will be added to both coen 122 and 122L if the SUM instruction is implemented correctly in your CPU.

Submission:  
1.	The two versions of code for (1)  to Dr. Shang on the Friday of week 3 (10%). Please upload your solution to Camino COEN 122 lecture. One submission per team.
2.	Your datapath and control (30%) on the Friday of week 8 to Dr. Shang. Upload your datapath to Camino COEN 122 lecture. One submission per team.
3.	Report (30%)  Please submit a written report to the TA On the last Friday, including the following

•	abstract (short description or outline of the project), 
•	detailed description of the CPU design including the datapath and the truth table of your control.
•	test benchmarks/waveforms verifying the functions, 
•	assembly code for the benchmark in (1). 
•	estimate the execution time of your code for (1) based on your CPU design, and verify your estimate with simulation/waveform. 

4.	Demo (30%): You will demo your working programs to our TA. During the demo, the TA will provide you n random numbers and you will show the TA the result after running your program on your pipeline.  You will also be asked to perform random but related tasks (for instance, change the address of data and demo the modified program), and be prepared to answer related project questions. The purpose of these questions is to make sure that you understand the project thoroughly. 
 






	



	











ALU Truth Table

ADD	NEG	SUB	OUT	Operation
1	0	0	B+A	add
0	1	0	-B	2's complement
0	0	1	B-A	subtract
0	0	0	don't care	no operation
1	1	1	A	Pass A

Z=1 if and only if OUT=0
N=1 if and only if OUT is negative. 

