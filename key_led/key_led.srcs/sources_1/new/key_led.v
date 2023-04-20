//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2023 12:59:30 PM
// Design Name: 
// Module Name: key_led
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


/*
模块功能

当没有按键按下的时候，两个LED等常亮，当按键0按下的时候，两个LED交替闪烁，当按键1按下的时候，两个LED同时闪烁

*/
module key_led(
    input               sys_clk,
    input               sys_rst_n,
    
    input       [1:0]   key,
    output  reg [1:0]   led //,
//    output  clk // simulation purpos.
    );
    
    reg [24:0] cnt;
    reg led_ctrl;
    
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            cnt <= 25'd0;
        else if(cnt < 25'd25_000_000)
            cnt <= cnt + 1'b1;
        else
            cnt <= 25'd0;
    end
    
    // 每隔500ms就更改LED的闪烁状态
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            led_ctrl <= 1'b0;
        else if(cnt == 25'd25_000_000)
            led_ctrl <= ~led_ctrl;
    end
    
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            led <= 2'b11;
        else case (key)
            2'b10:
                if(led_ctrl == 1'b0)
                    led <= 2'b01;
                else
                    led <= 2'b10;
            2'b01:
                if(led_ctrl == 1'b0)
                    led <= 2'b11;
                else
                    led <= 2'b00;
            2'b11:
                led <= 2'b11;
            default:
                ;
        endcase
    end
    
endmodule
