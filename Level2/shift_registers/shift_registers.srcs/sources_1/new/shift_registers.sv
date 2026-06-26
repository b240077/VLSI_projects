`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2026 05:42:52 PM
// Design Name: 
// Module Name: shift_registers
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
`timescale 1ns / 1ps

module shift_registers(
    input  logic       clk,
    input  logic       clr,
    input  logic       data_in,
    output logic [7:0] data_out
);

always_ff @(posedge clk or posedge clr) begin
    if (clr)
        data_out <= 8'b00000000;
    else if (data_in)
        data_out <= (data_out >> 1) | 8'b10000000;
    else
        data_out <= (data_out >> 1);
end

endmodule
