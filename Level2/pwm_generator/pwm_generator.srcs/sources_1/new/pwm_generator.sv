`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2026 12:21:58 AM
// Design Name: 
// Module Name: pwm_generator
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


module pwm_generator(
input logic clk,
input logic rst,
input logic [7:0]duty,
output logic y);
logic [7:0]count;
always_ff @(posedge clk) begin
    if (rst) begin
        count <= 8'd0;
        y     <= 0;
    end else begin
        if (count == 8'd255)
            count <= 8'd0;
        else
            count <= count + 8'd1;

        y <= (count < duty);
    end
end
endmodule
