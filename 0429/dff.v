 // 1-bit Synchronous Load
module dff (Clk, D, Din, Load, Q4);
input Clk,Load;
input [3:0] D;
input [3:0] Din;
output [3:0] Q4;
reg [3:0] Q4;
always@ (posedge clk)
if (Load) Q4 = Din;
else Q4 = D;

endmodule