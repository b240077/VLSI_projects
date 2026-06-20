`timescale 1ns / 1ps

module basic_gates (
    input  logic a_i,
    input  logic b_i,

    output logic and_o,
    output logic or_o,
    output logic xor_o,
    output logic nand_o,
    output logic nor_o,
    output logic xnor_o,
    output logic not_o
);

    // Basic gates
    assign and_o  = a_i & b_i;
    assign or_o   = a_i | b_i;
    assign xor_o  = a_i ^ b_i;
    assign nand_o = ~(a_i & b_i);
    assign nor_o  = ~(a_i | b_i);
    assign xnor_o = ~(a_i ^ b_i);
    assign not_o  = ~a_i;

endmodule : basic_gates