`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2023 01:26:46 PM
// Design Name: 
// Module Name: ip_clk_wiz
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


module ip_clk_wiz(
    input sys_clk,
    input sys_rst_n,
    
    output clk_out1,
    output clk_out2,
    output clk_out3,
    output clk_out4,
    output locked
    );
    
    
    clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_out1(clk_out1),     // output clk_out1
    .clk_out2(clk_out2),     // output clk_out2
    .clk_out3(clk_out3),     // output clk_out3
    .clk_out4(clk_out4),     // output clk_out4
    // Status and control signals
    .resetn  (sys_rst_n), // input resetn
    .locked  (locked),       // output locked
   // Clock in ports
    .clk_in1 (sys_clk));      // input clk_in1
    
    
endmodule
