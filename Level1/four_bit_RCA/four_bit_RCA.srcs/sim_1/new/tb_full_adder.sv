`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 03:54:00 PM
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder;
logic [3:0]a;
logic [3:0]b;
logic cin;
logic [3:0]s;
logic cout;
four_bit_RCA dut(.*);
initial begin
a=4'b1101;b=4'b0010;cin=1'b0;#10;
a=4'b1101;b=4'b0110;cin=1'b1;#10;
a=4'b1111;b=4'b0010;cin=1'b0;#10;
a=4'b0101;b=4'b0010;cin=1'b1;#10;

end
endmodule
