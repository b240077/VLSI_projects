`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2026 03:10:16 PM
// Design Name: 
// Module Name: uart
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

module uart(
    input  logic       clk,
    input  logic       rst,
    input  logic       tx_start,
    input  logic [7:0] tx_data,
    output logic       tx,
    output logic       tx_busy
);

    typedef enum logic [1:0] {
        IDLE,
        START,
        DATA,
        STOP
    } state_t;
    
    state_t state, next_state;
    
    localparam int Bit_period = 5208;
    
    logic [15:0] baud_cnt;
    logic        baud_tick;
    logic [2:0]  data_cnt;
    logic [7:0]  register; 
 
    // BLOCK 1: Next State Comb Logic
    always_comb begin
        next_state = state;
        case(state)
            IDLE:  if(tx_start)                next_state = START;
            START: if(baud_tick)               next_state = DATA;
            DATA:  if(baud_tick && (data_cnt == 3'd7)) next_state = STOP; // Fixed: == and 3'd7
            STOP:  if(baud_tick)               next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end
    
    // BLOCK 2: State Register update
    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end 
 
    // BLOCK 3: Counters & Datapath Control
    always_ff @(posedge clk or posedge rst) begin 
        if(rst) begin
            tx           <= 1'b1; 
            tx_busy      <= 1'b0;
            register     <= 8'b0;
            baud_cnt     <= 16'b0;
            data_cnt     <= 3'b0;
            baud_tick    <= 1'b0;
        end else begin 
            
            //baaud Rate Generation 
            if(state == IDLE) begin 
                baud_tick <= 1'b0;
                baud_cnt  <= '0;
            end else if(baud_cnt == Bit_period - 1) begin 
                baud_tick <= 1'b1;
                baud_cnt  <= '0;
            end else begin 
                baud_cnt  <= baud_cnt + 1;
                baud_tick <= 1'b0;
            end
            
            
            case(state)
                IDLE: begin 
                    tx       <= 1'b1; 
                    tx_busy  <= 1'b0; 
                    data_cnt <= 3'b0;
                    if(tx_start) begin 
                        register <= tx_data;
                    end
                end
                
                START: begin 
                    tx      <= 1'b0;  
                    tx_busy <= 1'b1;
                end
                
                DATA: begin 
                    tx      <= register[data_cnt]; 
                    tx_busy <= 1'b1;
                    if(baud_tick) begin
                        if(data_cnt == 3'd7) begin 
                            data_cnt <= 3'd0;
                        end else begin
                            data_cnt <= data_cnt + 1;
                        end
                    end
                end
                
                STOP: begin 
                    tx      <= 1'b1;  
                    tx_busy <= 1'b1;  
                end
            endcase
        end 
    end 

endmodule