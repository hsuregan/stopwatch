`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:16 05/12/2015 
// Design Name: 
// Module Name:    top_top 
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
module top_top(
    input clk,
    input pause,
    input adj,
    input reset,
    input sel,
    input d_reset,
    output [2:0] min1,
    output [3:0] min2,
    output [2:0] sec1,
    output [3:0] sec2,
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


wire rst_out, adj_out, pause_out, select_out;


debouncer UUT0 (
	//inputs
    .clk(clk),
	.rst(reset),
	.pause(pause),
	.adj(adj),
	.select(sel),
	.reset2(d_reset),
	
	//outputs
	.rst_out(rst_out),
	.adj_out(adj_out),
	.pause_out(pause_out),
	.select_out(select_out)
);

top UUT1 (
	//inputs
	.clk(clk),
	.pause(pause_out),
	.adj(adj_out),
	.reset(rst_out),
	.sel(select_out),
	
	//outputs
	.min1(min1),
	.min2(min2),
	.sec1(sec1),
	.sec2(sec2),
	.seg1(seg1),
	.seg2(seg2),
	.seg3(seg3),
	.seg4(seg4),
	.seg5(seg5),
	.seg6(seg6),
	.seg7(seg7),
	.dig1(dig1),
	.dig2(dig2),
	.dig3(dig3),
	.dig4(dig4),
	.oneHz(oneHz),
	.twoHz(twoHz),
	.one(one)
);

endmodule
