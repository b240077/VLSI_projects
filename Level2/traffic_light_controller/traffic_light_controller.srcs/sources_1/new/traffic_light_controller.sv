`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 01:34:59 PM
// Design Name: 
// Module Name: traffic_light_controller
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

//module traffic_light_controller (
//    input logic clk,
//    input logic rst,
    
//    output logic A_red,
//    output logic A_yellow,
//    output logic A_green,
    
    
//    output logic B_red,
//    output logic B_yellow,
//    output logic B_green
    
//    );
//    logic[1:0]state;
//    logic[4:0]counter;
//    always_ff@(posedge clk or posedge rst) begin
//    if(rst) begin
//    state<=2'b00;
//    counter<=4'd0;
//    end
//    else begin
//    counter<=counter+1'd1;
//    case(state)
//    2'b00:if(counter==4'd9) begin state<=2'b01;counter<=4'd0;end
//    2'b01:if(counter==4'd2) begin state<=2'b10;counter<=4'd0;end
//    2'b10:if(counter==4'd9) begin state<=2'b11;counter<=4'd0;end
//    2'b11:if(counter==4'd2) begin state<=2'b00;counter<=4'd0;end
//    endcase
//    end
//    end
//    always_comb begin
//    A_red=0;
//    A_green=0;
//    A_yellow=0;
    
//     B_red=0;
//    B_green=0;
//    B_yellow=0;
//    case(state)
//    2'b00:begin 
//    A_green=1;
//    B_red=1;
//    end
//    2'b01:begin 
//    A_yellow=1;
//    B_red=1;
//    end
//    2'b10:begin 
//    A_red=1;
//    B_green=1;
//    end    
//    2'b11:begin 
//    A_red=1;
//    B_yellow=1;
//    end
//    endcase
//    end
    
//endmodule
//THIS  IS FOR TWO DIRECTION
//NOW FOR THREE DIRECTION TRAFFIC LIGHT  CONTROLLER
module traffic_light_controller(
input logic clk,
input logic rst,
output logic A_green,
output logic A_red,
output logic A_yellow,
output logic B_green,
output logic B_red,
output logic B_yellow,
output logic C_green,
output logic C_red,
output logic C_yellow
);
logic [2:0]state;
logic [3:0]counter;

always_ff@(posedge clk or posedge rst) begin
if(rst) begin
state<=3'b000;
counter<=4'd0;
end
else begin
counter<=counter+1'd1;
case(state)
3'b000:if(counter==4'd9) begin state<=3'b001;counter<=4'd0;end
3'b001:if(counter==4'd2) begin state<=3'b010;counter<=4'd0;end
3'b010:if(counter==4'd9) begin state<=3'b011;counter<=4'd0;end
3'b011:if(counter==4'd2) begin state<=3'b100;counter<=4'd0;end
3'b100:if(counter==4'd9) begin state<=3'b101;counter<=4'd0;end
3'b101:if(counter==4'd2) begin state<=3'b000;counter<=4'd0;end
endcase
end
end

always_comb begin
A_red=0;A_yellow=0;A_green=0;
B_red=0;B_yellow=0;B_green=0;
C_red=0;C_yellow=0;C_green=0;
case(state)
3'b000:begin A_green=1; B_red=1;   C_red=1;   end
3'b001:begin A_yellow=1;B_red=1;   C_red=1;   end
3'b010:begin A_red=1;   B_green=1; C_red=1;   end
3'b011:begin A_red=1;   B_yellow=1;C_red=1;   end
3'b100:begin A_red=1;   B_red=1;   C_green=1; end
3'b101:begin A_red=1;   B_red=1;   C_yellow=1;end
endcase
end

endmodule
/*module traffic_light_controller(
input logic clk,
input logic rst,
output logic North_green,
output logic North_yellow,
output logic North_red,
output logic South_green,
output logic South_yellow,
output logic South_red,
output logic East_green,
output logic East_yellow,
output logic East_red,
output logic West_green,
output logic West_yellow,
output logic West_red
);
logic [2:0]state;
logic [3:0]counter;

always_ff@(posedge clk or posedge rst) begin
if(rst) begin
state<=3'b000;
counter<=4'd0;
end
else begin
counter<=counter+1'd1;
case(state)
3'b000:if(counter==4'd9) begin state<=3'b001;counter<=4'd0;end
3'b001:if(counter==4'd2) begin state<=3'b010;counter<=4'd0;end
3'b010:if(counter==4'd9) begin state<=3'b011;counter<=4'd0;end
3'b011:if(counter==4'd2) begin state<=3'b100;counter<=4'd0;end
3'b100:if(counter==4'd9) begin state<=3'b101;counter<=4'd0;end
3'b101:if(counter==4'd2) begin state<=3'b110;counter<=4'd0;end
3'b110:if(counter==4'd9) begin state<=3'b111;counter<=4'd0;end
3'b111:if(counter==4'd2) begin state<=3'b000;counter<=4'd0;end
endcase
end
end

always_comb begin
North_red=0;North_yellow=0;North_green=0;
South_red=0;South_yellow=0;South_green=0;
East_red=0; East_yellow=0; East_green=0;
West_red=0; West_yellow=0; West_green=0;
case(state)
3'b000:begin North_green=1; South_red=1;  East_red=1;  West_red=1;  end
3'b001:begin North_yellow=1;South_red=1;  East_red=1;  West_red=1;  end
3'b010:begin South_green=1; North_red=1;  East_red=1;  West_red=1;  end
3'b011:begin South_yellow=1;North_red=1;  East_red=1;  West_red=1;  end
3'b100:begin East_green=1;  North_red=1;  South_red=1; West_red=1;  end
3'b101:begin East_yellow=1; North_red=1;  South_red=1; West_red=1;  end
3'b110:begin West_green=1;  North_red=1;  South_red=1; East_red=1;  end
3'b111:begin West_yellow=1; North_red=1;  South_red=1; East_red=1;  end
endcase
end

endmodule
THIS ONE IS FOR FOUR DIRECTION 8 STATE TRAFFIC LIGHT CONTROLLER*/