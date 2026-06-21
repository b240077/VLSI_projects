`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 05:55:16 PM
// Design Name: 
// Module Name: tb_fourx1mux
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

`timescale 1ns/1ps

module tb_fourx1mux;

    logic [3:0] a_i;
    logic [1:0] s_i;
    logic       y_o;

    fourx1mux dut (.*);

    initial begin
        // Input pattern
        a_i = 4'b1010;

        // Test all select values
        s_i = 2'b00; #10;
        s_i = 2'b01; #10;
        s_i = 2'b10; #10;
        s_i = 2'b11; #10;

        $finish;
    end

endmodule
