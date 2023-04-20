`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2023 02:08:43 PM
// Design Name: 
// Module Name: tb_ip_ram
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


module tb_ip_ram();

reg sys_clk;
reg sys_rst_n;

always #10 sys_clk = ~sys_clk;

initial begin
    sys_clk = 1'b0;
    sys_rst_n = 1'b0;
    
    #200
    sys_rst_n = 1'b1;
end

ip_ram u_ip_ram(
    .sys_clk (sys_clk),
    .sys_rst_n (sys_rst_n)
);

endmodule
