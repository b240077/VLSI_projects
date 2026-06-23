`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2026 03:05:03 PM
// Design Name: 
// Module Name: tb_jk_ff
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


module tb_jk_ff;
logic j;
logic k;
logic clk;
logic q;
jk_ff dut(.*);
initial begin
clk=0;
forever  #5 clk=~clk;
end
initial begin
j=0;k=0; #12;
j=0;k=1; #10;
j=1;k=0; #10;
j=1;k=1; #10;
$finish;
end

endmodule
