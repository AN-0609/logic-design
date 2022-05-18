module LFSR(clk,clr,q);
input clk,clr;
output [3:1] q;
reg [3:1] q;

always@(posedge clk) begin
    if (clr==1'b1)
        q=3'b110;
    else begin
        q[1]<=q[1]^q[3];
        q[2]<=q[1];
        q[3]<=q[2];
    end
end

endmodule
