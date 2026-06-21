`timescale 1ns / 1ps

module twox1mux(
    input  logic a_i,
    input  logic b_i,
    input  logic s_i,
    output logic y_o
);

always_comb begin
    if (s_i)
        y_o = b_i;
    else
        y_o = a_i;
end

endmodule