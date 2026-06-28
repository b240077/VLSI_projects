`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 05:42:33 PM
// Design Name: 
// Module Name: tb_eight_bit_ALU
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


module tb_eight_bit_ALU;
logic [7:0]a;
logic [7:0]b;
logic [2:0]opcode;
logic [7:0]y;
logic carry;
logic zero;
logic overflow;
logic negative;
eight_bit_ALU dut(.*);
initial begin
a=8'b11010001;
b=8'b00100101;
opcode=3'b010;
#20;
opcode=3'b110;
#20;
opcode=3'b000;
#20;
$finish;
end
endmodule
