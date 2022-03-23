module decoder(E , In , Out);
input E;                                //致能輸入
input [2:0] In;                         //三位元輸入
output [7:0] Out;                       //八位元輸出
wire [7:0] Out;                         //排線
assign Out = E ? (8'b1 << In) : 8'h0;   //若有致能輸入，將"00000001"依照輸入In之值左移。若無，則輸出"00000000"。
endmodule