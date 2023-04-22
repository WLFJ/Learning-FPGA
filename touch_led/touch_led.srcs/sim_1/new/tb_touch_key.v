`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 02:43:41 PM
// Design Name: 
// Module Name: tb_touch_key
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


module tb_touch_key(

    );
    
    reg sys_clk;
    reg sys_rst_n;
    reg touch_key;
    
    wire led;
    
    always #10 sys_clk = ~sys_clk; // 这是是怎么回事？给一个10tike的时钟周期？
    
    initial begin
        sys_clk = 1'b0;
        sys_rst_n = 1'b0;
        touch_key = 0;
        
        #200
        sys_rst_n = 1'b1;
        
        // 下面进行信号模拟
        #40 touch_key = 1'b1;
        #200 touch_key = 1'b0;
        #40 touch_key = 1'b1;
        #200 touch_key = 1'b0;
        #40 touch_key = 1'b1;
        #200 touch_key = 1'b0;
        #40 touch_key = 1'b1;
        #200 touch_key = 1'b0;
    end
    
    touch_led u_touch_led(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        
        .touch_key (touch_key),
        .led (led)
    );
    
    
endmodule
