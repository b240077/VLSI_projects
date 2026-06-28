`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2026 07:28:21 PM
// Design Name: 
// Module Name: eight_bit_ALU
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
module eight_bit_ALU(
input  logic signed [7:0] a,
input  logic signed [7:0] b,
input  logic        [2:0] opcode,
output logic signed [7:0] y,
output logic              carry,
output logic              zero,
output logic              overflow,
output logic              negative
);

always_comb begin
    y        = 8'b0;
    carry    = 1'b0;
    zero     = 1'b0;
    overflow = 1'b0;
    negative = 1'b0;

    case(opcode)
        3'b000: begin 
            {carry, y} = a + b;
            zero     = (y == 8'b0);
            negative = y[7];
            overflow = (a[7] == b[7]) && (y[7] != a[7]);
        end
        3'b001: begin 
            {carry, y} = a - b;
            zero     = (y == 8'b0);
            negative = y[7];
            overflow = (a[7] != b[7]) && (y[7] != a[7]);
        end
        3'b010: begin 
            y        = a & b;
            zero     = (y == 8'b0);
            negative = y[7];
        end
        3'b011: begin 
            y        = a | b;
            zero     = (y == 8'b0);
            negative = y[7];
        end
        3'b100: begin 
            y        = a ^ b;
            zero     = (y == 8'b0);
            negative = y[7];
        end
        3'b101: begin 
            y        = ~a;
            zero     = (y == 8'b0);
            negative = y[7];
        end
        3'b110: begin 
            carry    = a[7];
            y        = a << 1;
            zero     = (y == 8'b0);
            negative = y[7];
        end
        3'b111: begin 
            carry    = a[0];
            y        = a >>> 1;
            zero     = (y == 8'b0);
            negative = y[7];
        end
        default: begin
            y = 8'b0;
        end
    endcase
end

endmodule