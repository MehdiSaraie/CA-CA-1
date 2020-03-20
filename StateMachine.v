module StateMachine (clk, rst, start, Y0Yminus1, co, done, ldX, ldY, ldA, initA, initC, initYminusOne,
			 aBarS, shRA, shRY, icC, ldYminusOne, selR, selL);
input clk;
input rst;
input start;
input [1:0] Y0Yminus1;
input co;
output reg done;
output reg ldX;
output reg ldY;
output reg ldA;
output reg initA;
output reg initC;
output reg initYminusOne;
output reg aBarS;
output reg shRA;
output reg shRY;
output reg icC;
output reg ldYminusOne;
output reg selR;
output reg selL;

	parameter Idle = 4'b0000, Init1 = 4'b0001, Init2 = 4'b0010, Check = 4'b0011, Add = 4'b0100,
		Sub = 4'b0101, Shift = 4'b0110, Exp1 = 4'b0111, Exp2 = 4'b1000;
	reg [3:0] ns, ps; 

	always @(ps or start or co) begin
		ns = 4'b0000;
		case (ps)
		Idle: ns = start? Init1: Idle;
		Init1: ns = Init2;
		Init2: ns = Check;
		Check: ns = (Y0Yminus1 == 2'b01)? Add:
			    (Y0Yminus1 == 2'b10)? Sub: Shift;
		Add: ns = Shift;
		Sub: ns = Shift;
		Shift: ns = co? Exp1: Check;
		Exp1: ns = Exp2;
		Exp2: ns = Idle;
		default: ns = Idle;
		endcase
	end

	always @(ps) begin
		{done, ldX, ldY, ldA, initA, initC, initYminusOne,
			aBarS, shRA, shRY, icC, ldYminusOne, selR, selL} = 13'b0;
		case (ps)
		Init1: {ldX, initA, initC, initYminusOne} = 4'b1111;
		Init2: ldY = 1'b1;
		Add: {aBarS, ldA} = 2'b01;
		Sub: {aBarS, ldA} = 2'b11;
		Shift: {shRA, icC, shRY, ldYminusOne} = 4'b1111;
		Exp1: {done, selL} = 2'b11;
		Exp2:{done, selR} = 2'b11;
		endcase
	end

	always @(posedge clk or posedge rst) begin
		if (rst) ps <= 4'b0000;
		else ps <= ns;
	end

endmodule 