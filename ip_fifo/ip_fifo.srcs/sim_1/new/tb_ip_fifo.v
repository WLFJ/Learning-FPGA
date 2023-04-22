`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2023 11:31:27 AM
// Design Name: 
// Module Name: tb_ip_fifo
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


module tb_ip_fifo();

reg sys_clk;
reg sys_rst_n;

ip_fifo u_ip_fifo(
    .sys_clk (sys_clk),
    .sys_rst_n (sys_rst_n)
);

parameter PERIOD = 20;
always begin
    sys_clk = 1'b0;
    #(PERIOD/2) sys_clk = 1'b1;
    #(PERIOD/2);
end

initial begin
    sys_rst_n = 1'b0;
    #100;
    sys_rst_n = 1;
end

endmodule
