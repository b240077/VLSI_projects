`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2026 02:52:26 PM
// Design Name: 
// Module Name: jk_ff
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


module jk_ff(
input logic j,
input logic k,
input logic clk,
output logic q
    );
always_ff@(posedge clk) begin
if(j & k)
q<=~q;
else if(j & ~k)
q<=1;
else if(~j & k)
q<=0;
else 
q<=q;
end
endmodule
