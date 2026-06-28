`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 10:37:09 PM
// Design Name: 
// Module Name: tb_fifo_buffer
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


module tb_fifo_buffer;
logic clk;
logic rst_n;
logic wr_en;
logic rd_en;
logic [7:0]data_in;
logic  [7:0]data_out;
logic full;
logic empty;
fifo_buffer dut(.*);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin 
rst_n=0;wr_en=0;rd_en=0;data_in=8'd0;#10;
rst_n=1; wr_en=1;rd_en=0;data_in=8'd67;#10;
rst_n=1; wr_en=1;rd_en=1;data_in=8'd43;#10;
rst_n=1; wr_en=0;rd_en=1;data_in=8'd56;#10;
rst_n=0;#10;
$finish;
end

endmodule
