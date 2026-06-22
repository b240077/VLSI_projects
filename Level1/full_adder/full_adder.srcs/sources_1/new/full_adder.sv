`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 12:32:10 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
input logic a,b,c,
output logic sum,carry    
);
assign sum=a^b^c;
assign carry=(a&b) |(b&c) |(a&c);
endmodule
/*Now if it would have asked to make a full adder using half adder it would go like i mean it's code will go like this 
module full_adder(
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
    output logic carry
);

logic s1;
logic c1;
logic c2;

half_adder HA1 (
    .a(a),
    .b(b),
    .sum(s1),
    .carry(c1)
);

half_adder HA2 (
    .a(s1),
    .b(cin),
    .sum(sum),
    .carry(c2)
);

assign carry = c1 | c2;

endmodule
);


AND THE TESTBENCH WILL BE SAME AS IT IS RIGHT NOW 


 */