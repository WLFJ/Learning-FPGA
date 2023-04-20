`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2023 02:02:12 PM
// Design Name: 
// Module Name: ip_ram
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


module ip_ram(
    input sys_clk,
    input sys_rst_n
    );
    
    wire ram_en; // ram 使能
    wire ram_wea; // ram读写使能信号
    wire [4:0] ram_addr; // ram读写地址
    wire [7:0] ram_wr_data; // ram写数据
    wire [7:0] ram_rd_data; // ram读数据
    
    // ********** main ***********
    
    // 添加我们封装好的读写模块
    ram_rw u_ram_rw (
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        
        .ram_en (ram_en),
        .ram_wea (ram_wea),
        .ram_addr (ram_addr),
        .ram_wr_data (ram_wr_data),
        .ram_rd_data (ram_rd_data)
    );
    
    // 下面把IP核添加进来
    blk_mem_gen_0 your_instance_name (
      .clka(sys_clk),    // input wire clka
      .ena(ram_en),      // input wire ena
      .wea(ram_wea),      // input wire [0 : 0] wea
      .addra(ram_addr),  // input wire [4 : 0] addra
      .dina(ram_wr_data),    // input wire [7 : 0] dina
      .douta(ram_rd_data)  // output wire [7 : 0] douta
    );
    
    ila_0 u_ila_0 (
        .clk(sys_clk), // input wire clk
        
        .probe0(ram_en), // input wire [0:0]  probe0  
        .probe1(ram_wea), // input wire [0:0]  probe1 
        .probe2(ram_addr), // input wire [4:0]  probe2 
        .probe3(ram_wr_data), // input wire [7:0]  probe3 
        .probe4(ram_rd_data) // input wire [7:0]  probe4
    );
endmodule
