`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 12:33:15 AM
// Design Name: 
// Module Name: tb_four_bit_counter
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


module tb_four_bit_counter;
logic clk;
logic rst;
logic en;
logic [3:0]count;
four_bit_counter dut(.*);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;en=0; #12;
rst=0;en=1; #10;
rst=0;en=1; #10;
rst=1;en=1; #10;

end
endmodule
