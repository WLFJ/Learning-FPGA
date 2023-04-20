`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2023 01:32:12 PM
// Design Name: 
// Module Name: tb_ip_clk_wiz
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


module tb_ip_clk_wiz();
    
    reg sys_clk;
    reg sys_rst_n;
    
    wire clk_out1;
    wire clk_out2;
    wire clk_out3;
    wire clk_out4;
    wire locked  ;
    
    always #10 sys_clk = ~sys_clk;
    
    initial begin
        sys_clk = 1'b0;
        sys_rst_n = 1'b0;
        
        #10
        sys_rst_n = 1'b1;
    end
    
    ip_clk_wiz u_ip_clk_wiz(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        
        .clk_out1   (clk_out1),
        .clk_out2   (clk_out2),
        .clk_out3   (clk_out3),
        .clk_out4   (clk_out4),
        .locked     (locked  )
    );
    
endmodule
