module Counter_3bit (clk, rst, ldEn, icC, parIn, count, co);
input clk;
input rst;
input ldEn;
input icC;
input [2:0] parIn;
output reg [2:0] count;
output co;

	always @(posedge clk or posedge rst) begin
		if (rst) count <= 3'b000;
		else if (ldEn) count <= parIn;
		else if (icC) count <= count + 1;
	end
	
	assign co = &count;

endmodule 
