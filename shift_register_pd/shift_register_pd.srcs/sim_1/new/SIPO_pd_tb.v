`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2026 16:41:24
// Design Name: 
// Module Name: SIPO_pd_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SIPO_pd_tb;

reg clk, rst, serial_in;
wire [3:0] parallel_out;

SIPO_pd uut (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    serial_in = 0;

    #12 rst = 0;

    @(negedge clk) serial_in = 1;
    @(negedge clk) serial_in = 0;
    @(negedge clk) serial_in = 1;
    @(negedge clk) serial_in = 1;

    #20 $finish;
end

initial begin
    $monitor("Time=%0t | Reset=%b | Serial_In=%b | Parallel_Out=%b",
             $time, rst, serial_in, parallel_out);
end

endmodule
