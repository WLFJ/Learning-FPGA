// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Apr 18 17:36:19 2023
// Host        : pop-os running 64-bit Pop!_OS 22.04 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/yveswong/key_led/key_led.sim/sim_1/synth/func/xsim/tb_key_led_func_synth.v
// Design      : key_led
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* S_KEY1 = "3'b001" *) (* S_KEY1_b = "3'b101" *) (* S_KEY2 = "3'b010" *) 
(* S_KEY2_b = "3'b110" *) (* S_NONE = "3'b000" *) 
(* NotValidForBitStream *)
module key_led
   (sys_clk,
    sys_rst_n,
    key,
    led);
  input sys_clk;
  input sys_rst_n;
  input [1:0]key;
  output [1:0]led;

  wire [1:0]key;
  wire [1:0]key_IBUF;
  wire [1:0]led;
  wire \led[0]_i_1_n_0 ;
  wire \led[1]_i_1_n_0 ;
  wire [1:0]led_OBUF;
  wire p_0_in;
  wire [2:0]status;
  wire \status[0]_i_1_n_0 ;
  wire \status[1]_i_1_n_0 ;
  wire \status[2]_i_1_n_0 ;
  wire sys_clk;
  wire sys_clk_IBUF;
  wire sys_clk_IBUF_BUFG;
  wire sys_rst_n;
  wire sys_rst_n_IBUF;
  wire tag;
  wire time_clk;
  wire u_time_delay_n_0;

  IBUF \key_IBUF[0]_inst 
       (.I(key[0]),
        .O(key_IBUF[0]));
  IBUF \key_IBUF[1]_inst 
       (.I(key[1]),
        .O(key_IBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hEB)) 
    \led[0]_i_1 
       (.I0(status[2]),
        .I1(status[1]),
        .I2(status[0]),
        .O(\led[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hE7)) 
    \led[1]_i_1 
       (.I0(status[0]),
        .I1(status[2]),
        .I2(status[1]),
        .O(\led[1]_i_1_n_0 ));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  FDCE #(
    .INIT(1'b0)) 
    \led_reg[0] 
       (.C(time_clk),
        .CE(1'b1),
        .CLR(u_time_delay_n_0),
        .D(\led[0]_i_1_n_0 ),
        .Q(led_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \led_reg[1] 
       (.C(time_clk),
        .CE(1'b1),
        .CLR(u_time_delay_n_0),
        .D(\led[1]_i_1_n_0 ),
        .Q(led_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \status[0]_i_1 
       (.I0(key_IBUF[0]),
        .I1(key_IBUF[1]),
        .O(\status[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \status[1]_i_1 
       (.I0(key_IBUF[1]),
        .I1(key_IBUF[0]),
        .O(\status[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \status[2]_i_1 
       (.I0(tag),
        .I1(key_IBUF[1]),
        .I2(key_IBUF[0]),
        .O(\status[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \status_reg[0] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_time_delay_n_0),
        .D(\status[0]_i_1_n_0 ),
        .Q(status[0]));
  FDCE #(
    .INIT(1'b0)) 
    \status_reg[1] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_time_delay_n_0),
        .D(\status[1]_i_1_n_0 ),
        .Q(status[1]));
  FDCE #(
    .INIT(1'b0)) 
    \status_reg[2] 
       (.C(sys_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_time_delay_n_0),
        .D(\status[2]_i_1_n_0 ),
        .Q(status[2]));
  BUFG sys_clk_IBUF_BUFG_inst
       (.I(sys_clk_IBUF),
        .O(sys_clk_IBUF_BUFG));
  IBUF sys_clk_IBUF_inst
       (.I(sys_clk),
        .O(sys_clk_IBUF));
  IBUF sys_rst_n_IBUF_inst
       (.I(sys_rst_n),
        .O(sys_rst_n_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    tag_i_1
       (.I0(tag),
        .O(p_0_in));
  FDCE #(
    .INIT(1'b0)) 
    tag_reg
       (.C(time_clk),
        .CE(1'b1),
        .CLR(u_time_delay_n_0),
        .D(p_0_in),
        .Q(tag));
  time_delay u_time_delay
       (.CLK(sys_clk_IBUF_BUFG),
        .\count_reg[24]_0 (time_clk),
        .sys_rst_n(u_time_delay_n_0),
        .sys_rst_n_IBUF(sys_rst_n_IBUF));
endmodule

module time_delay
   (sys_rst_n,
    \count_reg[24]_0 ,
    sys_rst_n_IBUF,
    CLK);
  output sys_rst_n;
  output \count_reg[24]_0 ;
  input sys_rst_n_IBUF;
  input CLK;

  wire CLK;
  wire [24:0]count;
  wire count0_carry__0_n_0;
  wire count0_carry__0_n_1;
  wire count0_carry__0_n_2;
  wire count0_carry__0_n_3;
  wire count0_carry__1_n_0;
  wire count0_carry__1_n_1;
  wire count0_carry__1_n_2;
  wire count0_carry__1_n_3;
  wire count0_carry__2_n_0;
  wire count0_carry__2_n_1;
  wire count0_carry__2_n_2;
  wire count0_carry__2_n_3;
  wire count0_carry__3_n_0;
  wire count0_carry__3_n_1;
  wire count0_carry__3_n_2;
  wire count0_carry__3_n_3;
  wire count0_carry__4_n_1;
  wire count0_carry__4_n_2;
  wire count0_carry__4_n_3;
  wire count0_carry_n_0;
  wire count0_carry_n_1;
  wire count0_carry_n_2;
  wire count0_carry_n_3;
  wire \count[24]_i_3_n_0 ;
  wire \count[24]_i_4_n_0 ;
  wire \count[24]_i_5_n_0 ;
  wire \count[24]_i_6_n_0 ;
  wire \count[24]_i_7_n_0 ;
  wire \count[24]_i_8_n_0 ;
  wire [24:0]count_0;
  wire \count_reg[24]_0 ;
  wire [24:1]data0;
  wire sys_rst_n;
  wire sys_rst_n_IBUF;
  wire tag_i_3_n_0;
  wire tag_i_4_n_0;
  wire tag_i_5_n_0;
  wire [3:3]NLW_count0_carry__4_CO_UNCONNECTED;

  CARRY4 count0_carry
       (.CI(1'b0),
        .CO({count0_carry_n_0,count0_carry_n_1,count0_carry_n_2,count0_carry_n_3}),
        .CYINIT(count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(count[4:1]));
  CARRY4 count0_carry__0
       (.CI(count0_carry_n_0),
        .CO({count0_carry__0_n_0,count0_carry__0_n_1,count0_carry__0_n_2,count0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(count[8:5]));
  CARRY4 count0_carry__1
       (.CI(count0_carry__0_n_0),
        .CO({count0_carry__1_n_0,count0_carry__1_n_1,count0_carry__1_n_2,count0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(count[12:9]));
  CARRY4 count0_carry__2
       (.CI(count0_carry__1_n_0),
        .CO({count0_carry__2_n_0,count0_carry__2_n_1,count0_carry__2_n_2,count0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(count[16:13]));
  CARRY4 count0_carry__3
       (.CI(count0_carry__2_n_0),
        .CO({count0_carry__3_n_0,count0_carry__3_n_1,count0_carry__3_n_2,count0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(count[20:17]));
  CARRY4 count0_carry__4
       (.CI(count0_carry__3_n_0),
        .CO({NLW_count0_carry__4_CO_UNCONNECTED[3],count0_carry__4_n_1,count0_carry__4_n_2,count0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(count[24:21]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .O(count_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[10]_i_1 
       (.I0(data0[10]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[11]_i_1 
       (.I0(data0[11]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[12]_i_1 
       (.I0(data0[12]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[12]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[13]_i_1 
       (.I0(data0[13]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[13]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[14]_i_1 
       (.I0(data0[14]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[14]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[15]_i_1 
       (.I0(data0[15]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[15]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[16]_i_1 
       (.I0(data0[16]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[17]_i_1 
       (.I0(data0[17]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[17]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[18]_i_1 
       (.I0(data0[18]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[18]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[19]_i_1 
       (.I0(data0[19]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[19]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[1]_i_1 
       (.I0(data0[1]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[20]_i_1 
       (.I0(data0[20]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[20]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[21]_i_1 
       (.I0(data0[21]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[21]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[22]_i_1 
       (.I0(data0[22]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[22]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[23]_i_1 
       (.I0(data0[23]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[23]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[24]_i_1 
       (.I0(data0[24]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[24]));
  LUT1 #(
    .INIT(2'h1)) 
    \count[24]_i_2 
       (.I0(sys_rst_n_IBUF),
        .O(sys_rst_n));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \count[24]_i_3 
       (.I0(tag_i_4_n_0),
        .I1(\count[24]_i_4_n_0 ),
        .I2(\count[24]_i_5_n_0 ),
        .I3(\count[24]_i_6_n_0 ),
        .I4(\count[24]_i_7_n_0 ),
        .I5(\count[24]_i_8_n_0 ),
        .O(\count[24]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \count[24]_i_4 
       (.I0(count[9]),
        .I1(count[8]),
        .I2(count[7]),
        .I3(count[6]),
        .O(\count[24]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hBF)) 
    \count[24]_i_5 
       (.I0(count[23]),
        .I1(count[24]),
        .I2(count[1]),
        .O(\count[24]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    \count[24]_i_6 
       (.I0(count[3]),
        .I1(count[0]),
        .I2(count[14]),
        .I3(count[15]),
        .O(\count[24]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \count[24]_i_7 
       (.I0(count[22]),
        .I1(count[2]),
        .I2(count[16]),
        .I3(count[10]),
        .O(\count[24]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \count[24]_i_8 
       (.I0(count[12]),
        .I1(count[11]),
        .I2(count[17]),
        .I3(count[13]),
        .I4(count[4]),
        .I5(count[5]),
        .O(\count[24]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[2]_i_1 
       (.I0(data0[2]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[3]_i_1 
       (.I0(data0[3]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[4]_i_1 
       (.I0(data0[4]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[5]_i_1 
       (.I0(data0[5]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[6]_i_1 
       (.I0(data0[6]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[7]_i_1 
       (.I0(data0[7]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[8]_i_1 
       (.I0(data0[8]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[9]_i_1 
       (.I0(data0[9]),
        .I1(\count[24]_i_3_n_0 ),
        .O(count_0[9]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[0]),
        .Q(count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[10]),
        .Q(count[10]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[11]),
        .Q(count[11]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[12]),
        .Q(count[12]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[13]),
        .Q(count[13]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[14]),
        .Q(count[14]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[15]),
        .Q(count[15]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[16]),
        .Q(count[16]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[17]),
        .Q(count[17]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[18]),
        .Q(count[18]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[19]),
        .Q(count[19]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[1]),
        .Q(count[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[20]),
        .Q(count[20]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[21]),
        .Q(count[21]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[22]),
        .Q(count[22]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[23]),
        .Q(count[23]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[24]),
        .Q(count[24]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[2]),
        .Q(count[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[3]),
        .Q(count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[4]),
        .Q(count[4]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[5]),
        .Q(count[5]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[6]),
        .Q(count[6]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[7]),
        .Q(count[7]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[8]),
        .Q(count[8]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(count_0[9]),
        .Q(count[9]));
  LUT6 #(
    .INIT(64'hFFFFAEAAAAAAAAAA)) 
    tag_i_2
       (.I0(count[24]),
        .I1(tag_i_3_n_0),
        .I2(tag_i_4_n_0),
        .I3(count[17]),
        .I4(count[22]),
        .I5(count[23]),
        .O(\count_reg[24]_0 ));
  LUT6 #(
    .INIT(64'hFFFFAAFEAAAAAAAA)) 
    tag_i_3
       (.I0(count[16]),
        .I1(count[5]),
        .I2(\count[24]_i_4_n_0 ),
        .I3(tag_i_5_n_0),
        .I4(count[14]),
        .I5(count[15]),
        .O(tag_i_3_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    tag_i_4
       (.I0(count[19]),
        .I1(count[18]),
        .I2(count[21]),
        .I3(count[20]),
        .O(tag_i_4_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    tag_i_5
       (.I0(count[12]),
        .I1(count[11]),
        .I2(count[13]),
        .I3(count[10]),
        .O(tag_i_5_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
