module BoothMultiplier (clk, rst, start, done, inBus, outBus);
input clk;
input rst;
input start;
output done;
input [5:0] inBus;
output [5:0] outBus;

	wire [1:0] Y0YminusOne;
	wire ldX, ldY, ldA, initA, initYminusOne;
	wire aBarS, shRA, shRY, ldYminusOne, selR, selL;

	Controller cu (
		.clk(clk),
		.rst(rst),
		.start(start),
		.done(done),
		.Y0YminusOne(Y0YminusOne),		
		.ldX(ldX),
		.ldY(ldY),
		.ldA(ldA), 
		.initA(initA),
		.initYminusOne(initYminusOne),
		.aBarS(aBarS),
		.shRA(shRA), 
		.shRY(shRY),
		.ldYminusOne(ldYminusOne),
		.selR(selR),
		.selL(selL)
		);

	Datapath dp (
		.clk(clk),
		.rst(rst),
		.inBus(inBus),
		.outBus(outBus),
		.Y0YminusOne(Y0YminusOne),
		.ldX(ldX),
		.ldY(ldY),
		.ldA(ldA), 
		.initA(initA),
		.initYminusOne(initYminusOne),
		.aBarS(aBarS),
		.shRA(shRA), 
		.shRY(shRY),
		.ldYminusOne(ldYminusOne),
		.selR(selR),
		.selL(selL)
		);

endmodule
