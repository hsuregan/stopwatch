`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:08 04/29/2015 
// Design Name: 
// Module Name:    Counter 
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
module Counter(
    input pause,
    input sel,
    input reset,
    input ticker,
    output [2:0] min1,
    output [3:0] min2,
    output [2:0] sec1,
    output [3:0] sec2
    );
	 
	reg [31:0] seconds;
	reg [31:0] minutes;
	
	
	
	
	assign min1 = minutes/10;
	assign min2 = minutes%10;
	assign sec1 = seconds/10;
	assign sec2 = seconds%10;
	
	

	
	always @(posedge ticker or posedge reset)
	begin
		if(reset) begin
			seconds <= 0;
			minutes <= 0;
		end
		else
		begin
			if(!pause)
			begin
			
				if(!sel)
				begin
					if(minutes == 59 && seconds ==59)
					begin
						minutes <= 0;
						seconds <= 0;
					end
					else if(seconds == 59)
					begin
						seconds <= 0;
						minutes <= minutes +1;
					end
					else
					seconds <= seconds +1;
				end
				else
				if(minutes == 59)
				begin
					minutes <= 0;
				end
				else
				minutes <= minutes +1;
				
				
			end
		end
	end
	
	
	


endmodule
