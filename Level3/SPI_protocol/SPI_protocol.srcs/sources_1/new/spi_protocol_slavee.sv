`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2026 03:46:31 PM
// Design Name: 
// Module Name: spi_protocol_slavee
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

module spi_protocol_slavee(

    input  logic       sclk,
    input  logic       rst,
    input  logic       ss,
    input  logic       mosi,

    input  logic [7:0] tx_data,

    output logic       miso,
    output logic [7:0] rx_data

);

logic [7:0] tx_shift;
logic [7:0] rx_shift;
logic [2:0] bit_count;

always_ff @(posedge sclk or posedge rst)
begin
    if(rst)
    begin
        tx_shift  <= 8'd0;
        rx_shift  <= 8'd0;
        rx_data   <= 8'd0;
        bit_count <= 3'd0;
        miso      <= 1'b0;
    end

    else if(!ss)
    begin

        //--------------------------------------------------
        // First bit of transfer
        //--------------------------------------------------
        if(bit_count == 3'd0)
        begin
            tx_shift  <= tx_data;
            rx_shift  <= {7'd0, mosi};
            
            miso      <= tx_data[7];

            bit_count <= bit_count + 1;
        end

        //--------------------------------------------------
        // Remaining bits
        //--------------------------------------------------
        else
        begin
            rx_shift  <= {rx_shift[6:0], mosi};

            tx_shift  <= {tx_shift[6:0],1'b0};

            miso      <= tx_shift[6];

            bit_count <= bit_count + 1;

            if(bit_count == 3'd7)
            begin
                rx_data   <= {rx_shift[6:0], mosi};
                bit_count <= 3'd0;
            end
        end

    end

    //--------------------------------------------------
    // Slave not selected
    //--------------------------------------------------
    else
    begin
        bit_count <= 3'd0;
        miso      <= 1'b0;
    end

end

endmodule