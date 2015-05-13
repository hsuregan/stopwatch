`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:47 05/04/2015 
// Design Name: 
// Module Name:    FSM 
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
module FSM(
		input clk,
    input pause,
    input rst,
    input adj,
    input sel,
	 input oneHz,
    input twoHz,
    output out_select,
    output out_reset,
    output out_pause,
    output ticker
    );

	assign out_reset = rst;
	assign out_select = (!sel)&adj;	// out_select is one, we increment minute, else seconds
	assign ticker = (!adj&oneHz)|((adj)&twoHz); // If adj is 0, run at 1Hz
	
	reg pauseState;
	reg prevPause;
	
	assign out_pause = pauseState;
	
	
	
	always @(posedge clk or posedge rst or posedge pause)
		begin

		if(rst) 
		begin
				pauseState <= 0;
				prevPause <= 0;
		end
		else if(pause)
		begin
            if(!prevPause)
            begin
                prevPause <= 1;
                if(!pauseState)
                pauseState <= 1;
                else 
                pauseState <= 0;
            end
		end
		else
		prevPause <= 0;
		
	end

	
		


endmodule
