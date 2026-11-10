`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2026 16:24:41
// Design Name: 
// Module Name: SISO_pd
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



module SISO_pd (
    input clk,
    input rst,
    input serial_in,
    output serial_out
);

reg [3:0] Q;

always @(posedge clk or posedge rst)
begin
    if (rst)
        Q <= 4'b0000;
    else
        Q <= {Q[2:0], serial_in};
end

assign serial_out = Q[3];

endmodule