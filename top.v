`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:22 05/04/2015 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
	 input clk,
    input pause,
    input adj,
    input reset,
    input sel,
    output [2:0] min1,
    output [3:0] min2,
    output [2:0] sec1,
    output [3:0] sec2,
	 //output [6:0] seg_out,
	 //output [3:0] dig_out,
	 output seg1,
	 output seg2,
	 output seg3,
	 output seg4,
	 output seg5,
	 output seg6,
	 output seg7,
	 output dig1,
	 output dig2,
	 output dig3,
	 output dig4,
	 output oneHz,
	 output twoHz,
	 output one
    );

wire oneHz, twoHz, out_select, out_pause, out_reset, ticker;
wire [2:0] min1_w;
wire [3:0] min2_w;
wire [2:0] sec1_w;
wire [3:0] sec2_w;

assign min1 = min1_w;
assign min2 = min2_w;
assign sec1 = sec1_w;
assign sec2 = sec2_w;

assign one = reset;


wire [6:0] seg;
wire [3:0] dig;
//assign seg_out = seg;
//assign dig_out = dig;
assign seg1 = !seg[6];
assign seg2 = !seg[5];
assign seg3 = !seg[4];
assign seg4 = !seg[3];
assign seg5 = !seg[2];
assign seg6 = !seg[1];
assign seg7 = !seg[0];
assign dig1 = !dig[0];//inverted
assign dig2 = !dig[1];
assign dig3 = !dig[2];
assign dig4 = !dig[3];

wire fast_w, blink_w;


FSM uut(
		.clk(clk),
		.pause(pause), 
		.rst(reset), 
		.adj(adj), 
		.sel(sel), 
		.oneHz(oneHz), 
		.twoHz(twoHz), 
		.out_select(out_select),
		.out_pause(out_pause),
		.out_reset(out_reset),
		.ticker(ticker));

clk_div uut1(
	.clk(clk),
	.One_Hz(oneHz),
	.Two_Hz(twoHz),
	.Blink(blink_w),
	.Fast(fast_w),
	.rst(out_reset)
	); 


Counter uut2(
	.pause(out_pause),
	.sel(out_select),
	.reset(out_reset),
	.ticker(ticker),
	.min1(min1_w),
	.min2(min2_w),
	.sec1(sec1_w),
	.sec2(sec2_w)
);



seven_seg uut3(

	.min1(min1_w),
	.min2(min2_w),
	.sec1(sec1_w),
	.sec2(sec2_w),
	.fast(fast_w),
	.blink(blink_w),
	.reset(out_reset),
	.adj(adj),
    .sel(sel),
	.seg(seg),
	.dig(dig)
);



endmodule
