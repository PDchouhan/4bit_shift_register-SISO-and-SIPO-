`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2026 16:26:55
// Design Name: 
// Module Name: SISO_pd_tb
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



module SISO_pd_tb;

reg clk;
reg rst;
reg serial_in;
wire serial_out;

SISO_pd uut (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .serial_out(serial_out)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    serial_in = 0;

    #12 rst = 0;

    #3 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;

    #50 $finish;
end

initial
begin
    $monitor("Time=%0t | rst=%b | serial_in=%b | Q=%b | serial_out=%b",
             $time, rst, serial_in, uut.Q, serial_out);
end

endmodule