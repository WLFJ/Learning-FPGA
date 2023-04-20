`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 03:18:09 PM
// Design Name: 
// Module Name: breath_led
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


module breath_led(
    input sys_clk,
    input sys_rst_n,
    
    output led
    );
    
    reg [15:0] period_cnt;
    reg [15:0] duty_cycle;
    reg inc_dec_flag;
    
    // ****** main ******
    
    assign led = (period_cnt >= duty_cycle) ? 1'b1 : 1'b0; // 这里就把led的信号生成出来了
    
    // 周期计数器 这个没什么好说的
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            period_cnt <= 16'd0;
        else if (period_cnt == 16'd50_000) // 对应多长时间？1ms{0.001s) * 50MHz -> 50_000 [50_000_000Hz]
            period_cnt <= 16'd0;
        else
            period_cnt <= period_cnt + 1'b1;
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            duty_cycle <= 16'd0;
            inc_dec_flag <= 1'b0;
        end
        else begin
            if(period_cnt == 16'd50_000) begin // 如果时间到了
                // 下面我们只需要看一个就可以了
                if(inc_dec_flag == 1'd0) begin // 
                    if(duty_cycle == 16'd50_000)
                        inc_dec_flag <= 1'b1;
                    else
                        duty_cycle <= duty_cycle + 16'd25;
                    end
                else begin
                    if(duty_cycle == 16'd0)
                        inc_dec_flag <= 1'b0;
                    else
                        duty_cycle <= duty_cycle - 16'd25;
                end
            end
        end
    end
    
endmodule
