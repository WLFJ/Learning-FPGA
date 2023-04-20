//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:43:10 PM
// Design Name: 
// Module Name: beep_control
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


module beep_control(
    input sys_clk,
    input sys_rst_n,
    
    input key_value,
    input key_flag,
    output reg beep
    );
    
    reg last_key;
    
    // ************ main *************
    // 功能：按下一次，鸣叫，再按一次，不鸣叫
    // 练习：能否改成：按下去鸣叫，松手不鸣叫？这个就需要保存状态了！
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)
            beep <= 1'b0;
        else if (key_flag) begin// flag 用于表示数据是否有效！当按键被按下去的时候
            // beep <= 1'b1; // 这样不工作，因为是脉冲信号？
            if (last_key != key_value)
                beep <= ~key_value;
            last_key <= key_value;
        end
        else // 当按键处于无效状态的时候不做任何响应
            beep <= beep;
    end
    
endmodule
