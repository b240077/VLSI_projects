`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 05:24:57 PM
// Design Name: 
// Module Name: tb_twox1mux
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


module tb_twox1mux;
logic a_i;
logic b_i;
logic s_i;
logic y_o;
twox1mux dut(.*);
initial begin
a_i=0;b_i=0;s_i=0; #10;
a_i=0;b_i=0;s_i=1; #10;
a_i=0;b_i=1;s_i=0; #10;
a_i=0;b_i=1;s_i=1; #10;
a_i=1;b_i=0;s_i=0; #10;
a_i=1;b_i=0;s_i=1; #10;
a_i=1;b_i=1;s_i=0; #10;
a_i=1;b_i=1;s_i=1; #10;

end
endmodule
