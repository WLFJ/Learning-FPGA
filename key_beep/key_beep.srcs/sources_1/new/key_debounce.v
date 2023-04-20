//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:28:39 PM
// Design Name: 
// Module Name: key_debounce
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


module key_debounce(
    input sys_clk,
    input sys_rst_n,
    
    input key,
    // 什么时候用reg，什么时候不用reg呢？
    output reg key_value,
    output reg key_flag
    );
    
    reg [19:0] cnt;
    reg key_reg;
    
    // *************** main ******************
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            cnt <= 20'd0;       // 将计数器清零
            key_reg <= 1'b1; // 这里表示key没有按下
        end
        else begin
            // 下面这段代码如何理解？
            key_reg <= key; // 这里首先阻塞记录，只有当按键不再抖动，我们计数20ms
            if (key_reg != key) begin
                cnt <= 20'd1_000_000; // 为什么这里是20ms？因为：一个时钟周期是20ns, 20 * 1_000_000 -> 20ms.
            end
            else begin
                if (cnt > 20'd0)
                    cnt <= cnt - 1'b1;
                else
                    cnt <= 20'd0;
            end
        end
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        // 这种逻辑代码看起来每个分支都喜欢操作同样的信号，这里我们可以学习一下
        if (!sys_rst_n) begin
            key_value <= 1'b1;
            key_flag <= 1'b0;
        end
        else if (cnt == 20'd1) begin // 这里注意，只有数到1才是20ms过来的，不能看0！
            key_value <= key;
            key_flag <= 1'b1;
        end
        else begin
            key_value <= key_value; // 保持原来的key不发生改变
            key_flag <= 1'b0; // 在等待阶段数据无效！
        end
    end
endmodule
