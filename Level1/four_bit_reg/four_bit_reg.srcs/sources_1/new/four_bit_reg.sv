`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2026 03:58:36 PM
// Design Name: 
// Module Name: four_bit_reg
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

// 4-bit register with synchronous reset and enable

module four_bit_reg (
    input  logic       clk,
    input  logic       rst,
    input  logic       en,
    input  logic [3:0] d,
    output logic [3:0] q
);

always_ff @(posedge clk) begin
    if (rst)       q <= 4'b0000;
    else if (en)   q <= d;
end

endmodule
