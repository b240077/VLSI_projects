`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 03:58:56 PM
// Design Name: 
// Module Name: tb_spi
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

module tb_spi;

logic clk;
logic rst;
logic start;

logic [7:0] master_tx;
logic [7:0] slave_tx;

logic [7:0] master_rx;
logic [7:0] slave_rx;

logic mosi;
logic miso;
logic sclk;
logic ss;
logic done;

//================ MASTER ===================

spi_protocol_masterr master(

    .clk(clk),
    .rst(rst),
    .start(start),

    .tx_data(master_tx),

    .miso(miso),

    .mosi(mosi),
    .sclk(sclk),
    .ss(ss),

    .done(done),

    .rx_data(master_rx)

);

//================ SLAVE ===================

spi_protocol_slavee slave(

    .sclk(sclk),
    .rst(rst),
    .ss(ss),

    .mosi(mosi),

    .tx_data(slave_tx),

    .miso(miso),

    .rx_data(slave_rx)

);

//================ CLOCK ===================

always #5 clk = ~clk;

//================ TEST ===================

initial
begin

    clk = 0;
    rst = 1;
    start = 0;

    master_tx = 8'b10110011;
    slave_tx  = 8'b11001100;

    #20;
    rst = 0;

    #20;
    start = 1;

    #10;
    start = 0;

    wait(done);

    #20;

    $finish;

end

endmodule
