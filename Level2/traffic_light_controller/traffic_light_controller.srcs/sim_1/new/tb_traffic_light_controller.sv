`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 02:10:39 PM
// Design Name: 
// Module Name: tb_traffic_light_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module tb_traffic_light_controller;
//logic clk;
//logic rst;

//logic A_red;
//logic A_green;
//logic A_yellow;

//logic B_red;
//logic B_green;
//logic B_yellow;

//traffic_light_controller dut(.*);
//initial begin
//clk=0;
//forever #5 clk=~clk;
//end
//initial begin
//rst=1;#10;
//rst=0;#260;
//$finish;
//end
//endmodule
//THIS ONE IS FOR THREE DIRECTION TRAFFIC CONTROL LIGHT
module tb_traffic_light_controller;
logic clk;
logic rst;
logic A_red;
logic A_green;
logic A_yellow;
logic B_red;
logic B_green;
logic B_yellow;
logic C_red;
logic C_green;
logic C_yellow;
traffic_light_controller dut(.*);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;#10;
rst=0;#390;
$finish;
end
endmodule
/*module tb_traffic_light_controller;
logic clk;
logic rst;
logic North_green;
logic North_yellow;
logic North_red;
logic South_green;
logic South_yellow;
logic South_red;
logic East_green;
logic East_yellow;
logic East_red;
logic West_green;
logic West_yellow;
logic West_red;
traffic_light_controller dut(.*);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;#10;
rst=0;#520;
$finish;
end
endmodule*/