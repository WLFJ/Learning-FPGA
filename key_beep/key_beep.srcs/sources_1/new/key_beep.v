//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:24:01 PM
// Design Name: 
// Module Name: key_beep
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


module key_beep(
    input sys_clk,
    input sys_rst_n,
    
    input key,
    output beep
    );
    
    // 感受一下这里的wire有什么作用？
    // 我们不管里面是什么情况，因为我们要把模块连接起来，所以就这样做了
    wire key_value;
    wire key_flag;
    
    // ****************** main ***********************
    
    // 按键消抖模块
    key_debounce u_key_debounce(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        
        .key (key),
        .key_value (key_value), // output
        .key_flag (key_flag)    // output
    );
    
    // 凤鸣器模块
    beep_control u_beep_control(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        
        .key_value (key_value),
        .key_flag (key_flag),
        .beep (beep)            // output
    ); 
endmodule
