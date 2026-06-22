`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 05:39:52 PM
// Design Name: 
// Module Name: tb_d_ff
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


module tb_d_ff;
logic d;
logic clk;
logic q;
d_ff dut(.*);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin 
d=0;#10;
d=1;#10;
$finish;
end
endmodule
