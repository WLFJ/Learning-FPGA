`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2023 10:55:42 AM
// Design Name: 
// Module Name: fifo_wr
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


module fifo_wr(
    input clk          ,
    input rst_n        ,
    
    input almost_empty ,
    input almost_full  ,
    
    output reg fifo_wr_en   ,
    output reg [7:0] fifo_wr_data
    );
    
    reg [1:0] state ; // 动作状态
    reg almost_empty_d0; // almost_empty 延迟一拍
    reg almost_empty_syn; // almost_empty 延迟两拍
    reg [3:0] dly_cnt; // 延迟计数器
    
    // ********** main ***********
    
    // 与边缘检测算法类似，这里使用两个变量进行爬升。但是具体作用是什么？我们还需要看后面的细节。
    always @ (posedge clk) begin
        if(!rst_n) begin
            almost_empty_d0 <= 1'b0;
            almost_empty_syn <= 1'b0;
        end
        else begin
            almost_empty_d0 <= almost_empty;
            almost_empty_syn <= almost_empty_d0;
        end
    end
    
    always @ (posedge clk) begin
        if(!rst_n) begin
            fifo_wr_en <= 1'b0;
            fifo_wr_data <= 8'd0;
            state <= 2'd0;
            dly_cnt <= 4'd0;
        end
        else begin
            case (state)
                2'd0: begin
                    if(almost_empty_syn) // 如果检测到FIFO将被读空（下一拍会空）
                        state <= 2'd1;   // 进入延时状态
                    else
                        state <= state; // 虽然是什么都不做，但是这里事实上延时了吧！
                end
                2'd1: begin
                    // 延时状态做什么了?
                    if(dly_cnt == 4'd10) begin// 延时10拍，相当于在等待对面完成写入，我们这里只处理读如的情况
                        dly_cnt <= 4'd0; // 但是我们的猜测是错误的，因为这里实际上是在等待fifo内部的电路状态
                        state <= 2'd2; // 准备开始写操作
                        fifo_wr_en <= 1'b1;
                    end
                    else
                        dly_cnt <= dly_cnt + 4'd1;
                end
                2'd2: begin
                    if(almost_full) begin
                        fifo_wr_en <= 1'b0;
                        fifo_wr_data <= 8'd0;
                        state <= 2'd0;
                    end
                    else begin
                        // 没有满就接着写
                        fifo_wr_en <= 1'b1;
                        fifo_wr_data <= fifo_wr_data + 1'd1;
                    end
                end
                default: state <= 2'd0;
            endcase
        end
        
    end
    
endmodule