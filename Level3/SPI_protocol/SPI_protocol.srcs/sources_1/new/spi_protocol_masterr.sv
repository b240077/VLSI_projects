`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 01:41:43 PM
// Design Name: 
// Module Name: spi_protocol_masterr
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
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 01:41:43 PM
// Design Name: 
// Module Name: spi_protocol_masterr
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

module spi_protocol_masterr(
    input  logic       clk,
    input  logic       rst,
    input  logic       start,

    input  logic [7:0] tx_data,
    input  logic       miso,

    output logic       mosi,
    output logic       sclk,
    output logic       ss,
    output logic       done,
    output logic [7:0] rx_data
);

typedef enum logic [1:0] {
    IDLE,
    LOAD,
    TRANSFER,
    DONE
} state_t;

state_t state, next_state;

logic [7:0] tx_shift;
logic [7:0] rx_shift;
logic [2:0] bit_count;

assign sclk = (state == TRANSFER) ? clk : 1'b0;

//STATE REGISTER
always_ff @(posedge clk or posedge rst)
begin
    if(rst)
        state <= IDLE;
    else
        state <= next_state;
end

//NEXT STATE LOGIC
always_comb
begin
    next_state = state;

    case(state)

        IDLE :
            if(start)
                next_state = LOAD;

        LOAD :
            next_state = TRANSFER;

        TRANSFER :
            if(bit_count == 3'd7)
                next_state = DONE;

        DONE :
            next_state = IDLE;

    endcase
end
//MAIN DATAPATH BLOCK
always_ff @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        ss        <= 1'b1;
        done      <= 1'b0;
        mosi      <= 1'b0;
        tx_shift  <= 8'd0;
        rx_shift  <= 8'd0;
        rx_data   <= 8'd0;
        bit_count <= 3'd0;
    end

    else
    begin

        case(state)

        //////////////////////////////////////////////////////
        IDLE:
        //////////////////////////////////////////////////////
        begin
            ss        <= 1'b1;
            done      <= 1'b0;
            bit_count <= 3'd0;
        end

        //////////////////////////////////////////////////////
        LOAD:
        //////////////////////////////////////////////////////
        begin
            ss        <= 1'b0;
            tx_shift  <= tx_data;
            rx_shift  <= 8'd0;
            bit_count <= 3'd0;

            mosi <= tx_data[7];
        end

        //////////////////////////////////////////////////////
        TRANSFER:
        //////////////////////////////////////////////////////
        begin
            rx_shift <= {rx_shift[6:0], miso};

            tx_shift <= {tx_shift[6:0],1'b0};

            mosi <= tx_shift[6];

            bit_count <= bit_count + 1;
        end

        //////////////////////////////////////////////////////
        DONE:
        //////////////////////////////////////////////////////
        begin
            ss      <= 1'b1;
            done    <= 1'b1;
            rx_data <= rx_shift;
        end

        endcase
    end
end

endmodule
