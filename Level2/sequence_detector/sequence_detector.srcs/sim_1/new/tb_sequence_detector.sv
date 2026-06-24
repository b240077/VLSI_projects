`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2026 12:41:22 AM
// Design Name: 
// Module Name: tb_sequence_detector
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

module tb_sequence_detector;

    logic clk, rst_n, data_in, detected;

    sequence_detector dut (
        .clk      (clk),
        .rst_n    (rst_n),
        .data_in  (data_in),
        .detected (detected)
    );

    initial clk = 0;          // ← initialize first
    always #5 clk = ~clk;     // ← then toggle

    initial begin
        rst_n   = 0;
        data_in = 0;

        #15 rst_n = 1;

        // Test 1: 0 1 0 1 1 → detected HIGH after last bit
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 1; #10;

        // Test 2: overlapping → 1 0 1 1 → detected HIGH again
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 1; #10;

        #30 $finish;
    end

endmodule
/*
module seq_detector_tb;

    logic clk, rst_n, data_in, detected;

    // swap module name to test either one
    seq_detector_moore dut (
        .clk      (clk),
        .rst_n    (rst_n),
        .data_in  (data_in),
        .detected (detected)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst_n   = 0;
        data_in = 0;

        #15 rst_n = 1;

        // Test 1: 0 1 0 1 1 → detected HIGH
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 1; #10;

        // Test 2: overlapping 1 0 1 1 → detected HIGH again
        data_in = 1; #10;
        data_in = 0; #10;
        data_in = 1; #10;
        data_in = 1; #10;

        #30 $finish;
    end

endmodule*/