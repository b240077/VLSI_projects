`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2026 06:56:29 PM
// Design Name: 
// Module Name: tb_shift_registers
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


`timescale 1ns / 1ps
module tb_shift_registers;

logic clk;
logic clr;
logic data_in;
logic [7:0] data_out;

shift_registers dut(.*);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    clr = 1;
    data_in = 0;

    #10;
    clr = 0;

    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 0; #10;

    #10;

    $finish;
end

endmodule
