`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2026 12:26:13 AM
// Design Name: 
// Module Name: sequence_detector
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


module sequence_detector (
    input  logic clk,
    input  logic rst_n,     
    input  logic data_in,   
    output logic detected   
);

   
    typedef enum logic [2:0] {
        S0 = 3'd0,   
        S1 = 3'd1,   
        S2 = 3'd2,   
        S3 = 3'd3,   
        S4 = 3'd4    
    } state_t;

    state_t state, next_state;

    //STATE REGISTER
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= S0;
        else
            state <= next_state;
    end
    //NEXT STATE
    always_comb begin
        case (state)
            S0: next_state = data_in ? S1 : S0;
            S1: next_state = data_in ? S1 : S2;
            S2: next_state = data_in ? S3 : S0;
            S3: next_state = data_in ? S4 : S2;
            S4: next_state = data_in ? S1 : S2;   // overlapping
            default: next_state = S0;
        endcase
    end
    // OUTPUT ONLY DEPENDS ON THE STATE AND NOT THE INPUT
    assign detected = (state == S4) ? 1'b1 : 1'b0;
endmodule
/*module seq_detector_mealy (
    input  logic clk,
    input  logic rst_n,
    input  logic data_in,
    output logic detected
);

    typedef enum logic [1:0] {
        S0 = 2'd0,
        S1 = 2'd1,
        S2 = 2'd2,
        S3 = 2'd3
    } state_t;

    state_t state, next_state;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= S0;
        else        state <= next_state;
    end

    always_comb begin
        next_state = S0;
        detected   = 0;

        case (state)
            S0: next_state = data_in ? S1 : S0;
            S1: next_state = data_in ? S1 : S2;
            S2: next_state = data_in ? S3 : S0;
            S3: begin
                if (data_in) begin
                    next_state = S1;
                    detected   = 1;
                end else
                    next_state = S2;
            end
            default: next_state = S0;
        endcase
    end

endmodule*/