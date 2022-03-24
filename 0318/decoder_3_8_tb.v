module decoder_3_8_tb;
    reg E_tb;           //致能輸入暫存
    reg [2:0] In_tb;    //輸入暫存
    wire [7:0] Out_tb;  //輸出
    decoder decoder_1(.E(E_tb), .In(In_tb), .Out(Out_tb));  //將輸入傳入decoder模組並取得輸出
initial begin
    #0 E_tb = 0; In_tb = 3'b000;    //模擬輸入  致能關閉
    #10 E_tb = 1; In_tb = 3'b000;   //模擬輸入  二進位數字000
    #10 E_tb = 1; In_tb = 3'b001;   //模擬輸入  二進位數字001
    #10 E_tb = 1; In_tb = 3'b010;   //模擬輸入  二進位數字010
    #10 E_tb = 1; In_tb = 3'b011;   //模擬輸入  二進位數字011
    #10 E_tb = 1; In_tb = 3'b100;   //模擬輸入  二進位數字100
    #10 E_tb = 1; In_tb = 3'b101;   //模擬輸入  二進位數字101
    #10 E_tb = 1; In_tb = 3'b110;   //模擬輸入  二進位數字110
    #10 E_tb = 1; In_tb = 3'b111;   //模擬輸入  二進位數字111
    #10 $finish;
end
initial begin
    $dumpfile("decoder_3_8.vcd");   //欲存入之檔案
    $dumpvars(0, decoder_1);    //將decoder_1之所有變數存入
end
endmodule