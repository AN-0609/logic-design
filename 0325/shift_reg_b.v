module shift_reg_b (Clk, D, Q1);
input Clk, D;
output [3:0] Q1;
reg [3:0] Q1;
integer i;
// blocking 
always@ (posedge Clk)
begin
    for (i = 3; i > 0; i = i-1)
        Q1[i] = Q1[i-1];
    Q1[0] = D;
end
endmodule