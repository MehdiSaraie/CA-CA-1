module Controller (clk, rst, start, Y0Yminus1, co, done, ldX, ldY, ldA, initA, initYminusOne,
			 aBarS, shRA, shRY, ldYminusOne, selR, selL);
input clk;
input rst;
input start;
input [1:0] Y0Yminus1;
input co;
output done;
output ldX;
output ldY;
output ldA;
output initA;
output initYminusOne;
output aBarS;
output shRA;
output shRY;
output ldYminusOne;
output selR;
output selL;

	wire initC, icC, co;

	Counter_3bit counter (
		.clk(clk),
		.rst(rst),
		.ldEn(initC),
		.icC(icC),
		.parIn(3'b010),
		.co(co)
		);

	StateMachine sm (
		.clk(clk),
 		.rst(rst),
		.start(start),
		.Y0Yminus1(Y0Yminus1),
		.co(co),
		.done(done),
		.ldX(ldX), 
		.ldY(ldY),
		.ldA(ldA),
		.initA(initA),
		.initC(initC),
		.initYminusOne(initYminusOne),
		.aBarS(aBarS),
		.shRA(shRA),
		.shRY(shRY),
		.icC(icC),
		.ldYminusOne(ldYminusOne), 
		.selR(selR),
 		.selL(selL)
		);

endmodule
