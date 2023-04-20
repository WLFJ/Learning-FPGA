`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 03:53:58 PM
// Design Name: 
// Module Name: led_twinkle
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


module led_twinkle(
    input   sys_clk ,
    input   sys_rst_n,
    output [1:0]   led
    );
    
//    parameter   WIDTH   = 25    ;
//    parameter WIDTH = 4; // for 10.
//    parameter   COUNT_MAX   =   25_000_000; // 因为系统使用50MHz的时钟，因为我们想让板子每0.5s闪烁一次，于是计数器最大给到0.5s * 50HMz = 25M(数字，没有单位）
//    parameter COUNT_MAX = 10; // for simulation.
        
    reg [25:0] counter ; // counter 有必要这么大吗？
    reg [1:0]   led_ctrl_cnt; // 我们后面看他的具体功能
    
    wire counter_en ; // 后面看他的功能
    
    // ******************** main *********************
    
    // 这里就是结合寄存器的情况产生出新的信号
    assign led = (counter < 26'd2500_0000) ? 2'b01 : 2'b10;
    
    // 下面注意，我们可以明显看到这里有两个并行的过程，他们之间以时钟进行默契配合！
    
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            counter <= 26'd0;
        else if (counter < 26'd5000_0000)
            counter <= counter + 1'b1;
        else
            counter <= 26'd0;
    end
    
    ila_0 your_instance_name (
        .clk(sys_clk), // input wire clk
    
    
        .probe0(sys_rst_n), // input wire [0:0]  probe0  
        .probe1(led), // input wire [1:0]  probe1 
        .probe2(counter) // input wire [25:0]  probe2
    );
    
endmodule