`timescale 1ns/1ns

module TB();

reg clk, rst;
reg start;
reg [5:0] inBus;
wire [5:0] outBus;
wire done;

reg [5:0] X, Y;
reg [11:0] result;

	BoothMultiplier bm (
		.clk(clk),
		.rst(rst),
		.inBus(inBus),
		.outBus(outBus),
		.start(start),
		.done(done)
		);

	initial begin
		clk = 0; rst = 0; 
		repeat (6) #247 clk = ~clk;
		#100 rst = 1;
		#100 rst = 0;
		#100

		/* Test 1: 23 * -11 */

		X = 6'b010111; //23
		Y = 6'b110101; //-11

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result is: %d", result);

		/* Test 2: 9 * 8 */

		X = 6'b001001; //9
		Y = 6'b001000; //8

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result is: %d", result);

		/* Test 3: -10 * -19 */

		X = 6'b110110; //-10
		Y = 6'b101101; //-19

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result is: %d", result);


		/* Test 4: 20 * 0 */

		X = 6'b010100; //20
		Y = 6'b000000; //0

		start = 1;
		#100
		clk = 1;
		#247
		inBus = X;
		clk = 0;
		#247
		start = 0;
		clk = 1;
		#247
		inBus = Y;
		clk = 0;
		#247
		clk = 1;
		
		while(done != 1'b1) #247 clk = ~clk;
		
		#247 clk = 0;
		result[11:6] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		result[5:0] = outBus;
		#247 clk = 1;
		#247 clk = 0;
		$display("result is: %d", result);

		$stop;
	end

endmodule
