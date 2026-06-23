`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 12:49:41 AM
// Design Name: 
// Module Name: counter
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


module counter#(parameter N=10)(
input logic clk,
input logic rst,
input logic en,
output logic [$clog2(N)-1:0]count
);
always_ff@(posedge clk)begin
if(rst)
count<=0;
else if(en) begin
if(count==N-1)
count<=0;
else
count<=count+1'b1;
end
end
endmodule
