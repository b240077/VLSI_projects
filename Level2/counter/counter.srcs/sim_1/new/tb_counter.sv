`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 01:04:24 AM
// Design Name: 
// Module Name: tb_counter
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


module tb_counter;
parameter N=10;
logic clk;
logic rst;
logic en;
logic [$clog2(N)-1:0]count;
counter #(.N(N)) dut (.*);
initial begin
clk=0;
forever #5 clk=~clk;
end  
initial begin
rst=1;en=0;#10;
rst=0;en=1;#200;
rst=1;en=0;#15;
$finish;
end 

endmodule
