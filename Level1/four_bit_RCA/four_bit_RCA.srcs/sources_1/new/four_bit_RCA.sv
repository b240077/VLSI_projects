`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 03:46:50 PM
// Design Name: 
// Module Name: four_bit_RCA
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


module four_bit_RCA(
input logic cin,
input logic [3:0]a,b,
output logic [3:0]s,
output logic cout
    );
logic [2:0]c;
full_adder FA1(.a(a[0]),.b(b[0]),.c(cin),.carry(c[0]),.sum(s[0]));
full_adder FA2(.a(a[1]),.b(b[1]),.c(c[0]),.carry(c[1]),.sum(s[1]));
full_adder FA3(.a(a[2]),.b(b[2]),.c(c[1]),.carry(c[2]),.sum(s[2]));
full_adder FA4(.a(a[3]),.b(b[3]),.c(c[2]),.carry(cout),.sum(s[3]));


endmodule
