`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2023 03:43:13 PM
// Design Name: 
// Module Name: tb_key_led
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

// 不太记得仿真代码怎么写了，我们再回顾一下
module tb_key_led(

    );
    
    reg sys_clk;
    reg sys_rst_n;
    
    wire    [1:0]   led;
    reg    [1:0]   key;
//    wire            clk;
    
    initial begin
        sys_clk =   1'b0;
        sys_rst_n   = 1'b0;
        key =   2'b00;
        
        #200 // 这是等200个时间单位的意思吗？
        sys_rst_n = 1'b1;
        // key =   2'b10;
        
        #200
        key =   2'b01;
        
//        #200
//        key =   2'b00;
    end
    
    always #10 sys_clk = ~sys_clk;
    
    key_led u_key_led(
        .sys_clk    (sys_clk),
        .sys_rst_n  (sys_rst_n),
        .led    (led),
        .key    (key)//,
//        .clk    (clk)
    );
endmodule
