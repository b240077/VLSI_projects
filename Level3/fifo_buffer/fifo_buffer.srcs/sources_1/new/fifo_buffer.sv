`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 05:54:09 PM
// Design Name: 
// Module Name: fifo_buffer
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


module fifo_buffer(
input logic clk,
input logic rst_n,
input logic wr_en,
input logic rd_en,
input logic [7:0]data_in,
output logic [7:0]data_out,
output logic full,
output logic empty
    );
    logic [2:0]rd_ptr;
    logic [2:0]wr_ptr;
    logic[3:0]count;
    
    logic [7:0]mem[0:7];
always_ff@(posedge clk) begin  
if(!rst_n) begin
count<=0;
rd_ptr<=0;
wr_ptr<=0;
end
else if(wr_en && !full && rd_en && !empty) begin
//We don't need to increase or decrease count as  it will remain the same 
mem[wr_ptr]<=data_in;
wr_ptr<=wr_ptr+3'd1;
rd_ptr<=rd_ptr+3'd1;
end


else if(wr_en && !full) begin
mem[wr_ptr]<=data_in;
wr_ptr<=wr_ptr+3'd1;
count<=count+1;
end

else if(rd_en && !empty) begin
rd_ptr<=rd_ptr+3'd1;
count<=count-1;
end
end
assign data_out=mem[rd_ptr];
assign full=(count==8);
assign empty=(count==0);
endmodule
