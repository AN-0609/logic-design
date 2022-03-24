module decoder(E , In , Out);
    input E;                                        //致能輸入
    input [2:0] In;                                 //三位元輸入
    output [7:0] Out;                               //八位元輸出
    wire E1 , G1 , G2;                              //內部線路
not u1(E1 , In[2]);                                 //將In[2]之值not傳入E1
and a1(G1 , E , In[2]);                             //將E以及In[2] AND 傳入G1
and a2(G2 , E , E1);                                //將E以及E1 AND 傳入G2
decoder_2_4 block1(G1 , In[1 : 0] , Out[7 : 4]);    //將In傳入decoder_2_4模組並取得Out輸出
decoder_2_4 block2(G2 , In[1 : 0] , Out[3 : 0]);    //將In傳入decoder_2_4模組並取得Out輸出
endmodule

module decoder_2_4(E , In , Out);
    input E;                        //致能輸入
    input [1:0] In;                 //三位元輸入
    output [3:0] Out;               //八位元輸出
    wire [3:0] Out;                 //內部線路
assign Out = E ? 4'b1 << In : 4'h0; //若有致能輸入，將"0001"依照輸入In之值左移。若無，則輸出"0000"。
endmodule

// module decoder(E , In , Out);
// input E;                                //致能輸入
// input [2:0] In;                         //三位元輸入
// output [7:0] Out;                       //八位元輸出
// wire [7:0] Out;                         //排線
// assign Out = E ? (8'b1 << In) : 8'h0;   //若有致能輸入，將"00000001"依照輸入In之值左移。若無，則輸出"00000000"。
// endmodule