`timescale 1ns/1ps
module Testbench;
reg Clk = 1'b0;
reg D = 1'b0;
wire [3:0] Q1;
wire [3:0] Q2;
parameter PERIOD = 200;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;
initial // Clock process for Clk
begin
    #OFFSET;
    forever
    begin
        Clk = 1'b0;
        #(PERIOD-(PERIOD*DUTY_CYCLE)) 
        Clk = 1'b1;
        #(PERIOD*DUTY_CYCLE);
    end
end
shift_reg_b BLOCK ( .Clk(Clk), .D(D), .Q1(Q1) );
shift_reg_nb NBLOCK ( .Clk(Clk), .D(D), .Q2(Q2) );
initial begin
    #85 D = 1'b1; // Current Time: 85ns
    #200 D = 1'b0; // Current Time: 285ns
    #200 D = 1'b1; // Current Time: 485ns
    #200 D = 1'b0; // Current Time: 685ns
    #200 D = 1'b1; // Current Time: 885ns
    #400 D = 1'b0; // Current Time: 1285ns
    #400 D = 1'b1; // Current Time: 1685ns
    #100 $finish;
    end
initial
begin
    $dumpfile("shift_reg.vcd");
    $dumpvars(0, BLOCK);
    $dumpvars(0, NBLOCK);
end
endmodule
