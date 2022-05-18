module LFSR(clk,clr,q);
input clk,clr;
output [3:1] q;
reg [3:1] q;
// wire [3:1] q;
// wire din,q1,q2,q3;
// xor xor1(din,q[1],q[3]);

always@(posedge clk) begin
    if (clr==1'b1)
        q=3'b110;
    else begin
        q[1]<=q[1]^q[3];
        q[2]<=q[1];
        q[3]<=q[2];
    end
    //{q3,q2,q1}<=q[3:1];
    // q3<=q[3];
    // q2<=q[2];
    // q1<=q[1];
end

endmodule
// //`include "dff.v"
// module LFSR(clk,clr,q);
// input clk,clr;
// output [3:1] q;
// wire din,q1,q2,q3;
// xor xor1(din,q1,q3);



// always@(posedge clk) begin
    
// end
// dff block1(clk,din,q1);
// dff block2(clk,q1,q2);
// dff block3(clk,q2,q3);
// endmodule

// module dff(clk,d,q);
// output q;
// input d,clk;
// reg q;
// always @(posedge clk)
//     q <= d;
// endmodule
