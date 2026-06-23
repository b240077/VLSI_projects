`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 12:26:23 AM
// Design Name: 
// Module Name: four_bit_counter
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


module four_bit_counter(
input logic clk,
input logic rst,
input logic en,
output logic[3:0]count
);
always_ff@(posedge clk)begin
if(rst)
count<=4'b0000;
else if(en)
count<=count+1'b1;
end
endmodule
