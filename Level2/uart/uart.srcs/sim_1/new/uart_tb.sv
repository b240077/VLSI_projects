`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2026 05:21:51 PM
// Design Name: 
// Module Name: uart_tb
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

module uart_tb;

    logic       clk;
    logic       rst;
    logic       tx_start;
    logic [7:0] tx_data;
    logic       tx;
    logic       tx_busy;
    
    logic [7:0] rx_data;
    logic       rx_ready;

    uart uut_tx (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    uart_receiver uut_rx (
        .clk(clk),
        .rst(rst),
        .rx(tx), 
        .rx_data(rx_data),
        .rx_ready(rx_ready)
    );

    // Clock generator: 20ns period (50 MHz)
    always begin
        #10 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 8'b0;

        // Hold reset for 5 clock cycles
        #100;
        rst = 0;
        #20; // Wait 1 cycle after reset

        // --- Transmit First Byte: 0xA5 ---
        tx_data = 8'hA5; 
        tx_start = 1;
        #20;             // Wait exactly 1 clock cycle (20ns)
        tx_start = 0;    // Pull start back down

        // Wait a large delay for the entire UART frame to transmit and receive
        // 10 bits * 5208 cycles/bit * 20ns/cycle = ~1,041,600 ns
        #1100000;
        
        // --- Transmit Second Byte: 0x3C ---
        tx_data = 8'h3C; 
        tx_start = 1;
        #20;             // Wait exactly 1 clock cycle (20ns)
        tx_start = 0;    // Pull start back down

        // Wait for the second frame to completely finish
        #1100000;

        $finish;
    end

endmodule
