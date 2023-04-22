`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2023 11:18:02 AM
// Design Name: 
// Module Name: fifo_rd
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


module fifo_rd(
    input clk,
    input rst_n,
    
    input [7:0] fifo_dout,
    input almost_full,
    input almost_empty,
    output reg fifo_rd_en
    );
    
    reg [1:0] state;
    reg almost_full_d0;
    reg almost_full_syn;
    reg [3:0] dly_cnt;
    
    
    // 时钟域同步技术，我们一定别忘记看波形！
    always @ (posedge clk) begin
        if(!rst_n) begin
            almost_full_d0 <= 1'b0;
            almost_full_syn <= 1'b0;
        end
        else begin
            almost_full_d0 <= almost_full;
            almost_full_syn <= almost_full_d0;
        end
    end
    
    always @ (posedge clk) begin
        if(!rst_n) begin
            fifo_rd_en <= 1'b0;
            state <= 2'b0;
            dly_cnt <= 4'd0;
        end
        else begin
            case (state)
                2'd0: begin
                    if(almost_full_syn)
                        state <= 2'd1;
                    else
                        state <= state;
                end
                2'd1: begin
                    if(dly_cnt == 4'd10) begin
                        dly_cnt <= 4'd0;
                        state <= 2'd2;
                    end
                    else begin
                        dly_cnt <= dly_cnt + 4'b1;
                    end
                end
                2'd2: begin
                    // 问题是为什么empty不需要做呢？可能是因为这个不算是脉冲信号？
                    if(almost_empty) begin
                        fifo_rd_en <= 1'b0;
                        state <= 2'b0;
                    end
                    else begin
                        fifo_rd_en <= 1'b1;
                    end
                end
                default:
                    state <= 2'b0;
            endcase
        end
    end
    
    
    
endmodule
