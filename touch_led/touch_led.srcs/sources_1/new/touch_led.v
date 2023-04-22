`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 01:48:57 PM
// Design Name: 
// Module Name: touch_led
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


module touch_led(
    input sys_clk,
    input sys_rst_n,
    
    input touch_key,
    
    output reg led
    );
    
    reg touch_key_d0;
    reg touch_key_d1;
    
    wire touch_en;
    
    // ********** main ***********
    
    // --- 这是一个边缘检测电路，能够对按键的状态进行建模
    assign touch_en = (~touch_key_d1) & touch_key_d0;
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            touch_key_d0 <= 1'b0;
            touch_key_d1 <= 1'b0;
        end
        else begin
            touch_key_d0 <= touch_key;
            touch_key_d1 <= touch_key_d0;
        end
    end
    // ---
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            led <= 1'b1;
        else begin
            if(touch_en) // 这里模拟了锁存器的工作
                led <= ~led;
        end
    end
    
endmodule
