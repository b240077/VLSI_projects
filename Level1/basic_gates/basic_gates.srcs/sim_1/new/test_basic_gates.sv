`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2026 06:28:03 PM
// Design Name: 
// Module Name: test_basic_gates
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


module test_basic_gates;
logic a_i;
logic b_i;
logic and_o;
logic or_o;
logic xor_o;
logic nand_o;
logic nor_o;
logic xnor_o;
logic not_o;

basic_gates dut(.*);
initial begin
a_i=0;b_i=0; #10;
a_i=0;b_i=1; #10;
a_i=1;b_i=0; #10;
a_i=1;b_i=1; #10;
end 



endmodule
