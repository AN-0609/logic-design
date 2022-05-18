// `include "blocking.v"
`timescale 1ns/1ps
module LFSR_tb;
    reg clk;
    reg rst_n;
    wire [3:1] q;
parameter PERIOD = 10;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;
// clock process
LFSR LFSR_tb(clk,rst_n,q);
initial
begin
    #OFFSET;
    forever
    begin
        clk = 1'b0;
        #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
        #(PERIOD*DUTY_CYCLE);
    end
end
initial begin
    rst_n = 1'b1;
    #10 rst_n = 1'b0;
    #150 rst_n = 1'b1;
    #5 rst_n = 1'b0;
    #200 $finish;
end

initial begin
    $dumpfile("LFSR.vcd");
    $dumpvars(0, LFSR_tb);
end


endmodule