`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2023 01:53:03 PM
// Design Name: 
// Module Name: ram_rw
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


module ram_rw(
    input sys_clk,
    input sys_rst_n,
    
    output ram_en, // ram 使能信号
    output ram_wea, // ram 读写选择
    output reg [4:0] ram_addr, // ram 读写地址
    output reg [7:0] ram_wr_data, // ram 写数据
    input      [7:0] ram_rd_data // ram 读数据
    );
    
    reg [5:0] rw_cnt; // 读写控制计数器
    
    // ************* main ************
    
    assign ram_en = sys_rst_n; // 当系统复位了就直接开始了
    assign ram_wea = (rw_cnt <= 6'd31 && ram_en == 1'b1) ? 1'b1 : 1'b0; // 这里我们把64的计数单位一分为二来看的，前一半写入，后一半读出
    
    // 读写控制计数器，计数器范围0~63
    always @ (posedge sys_clk or negedge sys_rst_n ) begin
        if (!sys_rst_n)
            rw_cnt <= 1'b0;
        else if (rw_cnt == 6'd63)
            rw_cnt <= 1'b0;
        else
            rw_cnt <= rw_cnt + 1'b1;
    end
    
    // 第一个是在周期前半段不断增加写入的数据数值
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            ram_wr_data <= 1'b0;
        else if(rw_cnt <= 6'd31)
            ram_wr_data <= ram_wr_data + 1'b1;
        else
            ram_wr_data <= 1'b0;
    end
    
    // 读写地址信号 这个则是在后半段不断增加读出的地址
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            ram_addr <= 1'b0;
        else if(ram_addr == 5'd31)
            ram_addr <= 1'b0;
        else
            ram_addr <= ram_addr + 1'b1;
    end
endmodule
