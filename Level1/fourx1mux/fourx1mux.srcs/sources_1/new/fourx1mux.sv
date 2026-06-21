`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 05:47:31 PM
// Design Name: 
// Module Name: fourx1mux
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


module fourx1mux(
    input  logic [3:0] a_i,
    input  logic [1:0] s_i,
    output logic       y_o
);

always_comb begin
    case (s_i)
        2'b00: y_o = a_i[0];
        2'b01: y_o = a_i[1];
        2'b10: y_o = a_i[2];
        2'b11: y_o = a_i[3];
    endcase
end

endmodule