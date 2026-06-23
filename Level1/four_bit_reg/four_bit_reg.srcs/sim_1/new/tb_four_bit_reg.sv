`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2026 04:00:28 PM
// Design Name: 
// Module Name: tb_four_bit_reg
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


module tb_register_4bit;

    logic       clk;
    logic       rst;
    logic       en;
    logic [3:0] d;
    logic [3:0] q;

    four_bit_reg dut (.*);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst=1; en=0; d=4'b1111; #12;
        rst=0; en=0; d=4'b1010; #10;
        rst=0; en=1; d=4'b1010; #10;
        rst=0; en=1; d=4'b1111; #10;
        rst=0; en=0; d=4'b0000; #10;
        rst=1; en=1; d=4'b1010; #10;
        $finish;
    end


endmodule