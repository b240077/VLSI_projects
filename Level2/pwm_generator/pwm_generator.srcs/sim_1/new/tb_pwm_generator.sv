`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2026 12:53:48 AM
// Design Name: 
// Module Name: tb_pwm_generator
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


module tb_pwm_generator;
logic clk;
logic rst;
logic [7:0]duty;
logic y;
pwm_generator dut(.*);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;duty=0;#30;
rst=0;duty=8'd128;#3000;
rst=0;duty=8'd255;#3000;
rst=0;duty=8'd64;#3000;
rst=0;duty=8'd192;#3000;
$finish;
end
endmodule
