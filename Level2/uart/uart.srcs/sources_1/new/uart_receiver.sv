`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2026 04:30:59 PM
// Design Name: 
// Module Name: uart_receiver
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

module uart_receiver(
    input  logic       clk,
    input  logic       rst,
    input  logic       rx,
    output logic [7:0] rx_data,
    output logic       rx_ready
);

    typedef enum logic [1:0] {
        IDLE,
        START,
        DATA,
        STOP
    } state_t;
    
    state_t state, next_state;
    
    localparam int Bit_period = 5208;
    localparam int Half_period = 2604;

    logic [15:0] baud_cnt;
    logic        baud_tick;
    logic [2:0]  data_cnt;
    logic [7:0]  rx_shift_reg;

    always_comb begin
        next_state = state;
        case(state)
            IDLE: begin
                if (!rx) next_state = START;
            end
            
            START: begin
                if (baud_cnt == Half_period - 1) begin
                    if (!rx) next_state = DATA;
                    else     next_state = IDLE;
                end
            end
            
            DATA: begin
                if (baud_tick && (data_cnt == 3'd7)) begin
                    next_state = STOP;
                end
            end
            
            STOP: begin
                if (baud_tick) begin
                    next_state = IDLE;
                end
            end
            
            default: next_state = IDLE;
        endcase
    end
    
    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end 
 
    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            rx_data      <= 8'b0;
            rx_ready     <= 1'b0;
            baud_cnt     <= 16'b0;
            data_cnt     <= 3'b0;
            baud_tick    <= 1'b0;
            rx_shift_reg <= 8'b0;
        end else begin 
            
            if (state == IDLE) begin
                baud_cnt  <= '0;
                baud_tick <= 1'b0;
            end else if (state == START) begin
                if (baud_cnt == Half_period - 1) begin
                    baud_cnt  <= '0;
                    baud_tick <= 1'b0;
                end else begin
                    baud_cnt <= baud_cnt + 1;
                end
            end else begin
                if (baud_cnt == Bit_period - 1) begin
                    baud_cnt  <= '0;
                    baud_tick <= 1'b1;
                end else begin
                    baud_cnt  <= baud_cnt + 1;
                    baud_tick <= 1'b0;
                end
            end
            
            case(state)
                IDLE: begin
                    rx_ready <= 1'b0;
                    data_cnt <= 3'b0;
                end
                
                START: begin
                    rx_ready <= 1'b0;
                end
                
                DATA: begin
                    if (baud_tick) begin
                        rx_shift_reg[data_cnt] <= rx;
                        
                        if (data_cnt == 3'd7) begin
                            data_cnt <= 3'd0;
                        end else begin
                            data_cnt <= data_cnt + 1;
                        end
                    end
                end
                
                STOP: begin
                    if (baud_tick) begin
                        rx_data  <= rx_shift_reg; 
                        rx_ready <= 1'b1;
                    end
                end
            endcase
        end
    end


endmodule