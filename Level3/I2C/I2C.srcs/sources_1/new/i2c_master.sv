`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2026 02:03:30 PM
// Design Name: 
// Module Name: i2c_master
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


module i2c_master(
output logic sda,
inout wire scl,
input logic clk,
input logic rst,
input logic start,
input logic [6:0]addr,
input logic rw,
input  logic [7:0]data_in,
output logic [7:0]data_out,
output logic busy,
output logic ack_err
    );
 typedef enum logic[2:0]{
 IDLE,
 START,
 ADDR_RW,
 ACK_ADDR,
 WRITE_DATA,
 READ_DATA,
 ACK_DATA,
 STOP
 }state_t;
 state_t state,next_state;
 always_ff@(posedge clk or posedge rst)begin
 if(rst)begin
 state<=IDLE;
 end
 else begin
 state<=next_state;
 end
 end
 always_ff@(posedge clk) begin 
 next_state<=state;
 case(state) 
 IDLE:if(start) begin next_state<=START; end
 START:scl<=0; 
 ADDR_RW:
 ACK_ADDR:if()
 WRITE_DATA:if(rw) begin addr<=data_in; end
 READ_DATA:if(!rw) begin data_out<=addr; end
 ACK_DATA:
 STOP:next_state<=IDLE;
 endcase
 end
endmodule
