`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:58 05/06/2015 
// Design Name: 
// Module Name:    seven_seg 
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
module seven_seg(
    input [2:0] min1,
    input [3:0] min2,
    input [2:0] sec1,
    input [3:0] sec2,
    input fast,
    input blink,
	 input reset,
	 input adj,
     input sel,
    output [6:0] seg,
    output reg [3:0] dig
    );
	 reg [1:0] iterator;
	 reg [3:0] digit;
	 reg [6:0] seven_seg;

	 assign seg = seven_seg;
	 
	 always @(iterator) begin
		if(iterator == 0) 
		begin
			digit = min1;
			dig = 4'b1000;
		end
		else if(iterator == 1)
		begin
			digit = min2;
			dig = 4'b0100;
		end	
		else if(iterator == 2) 
		begin
			digit = sec1;
			dig = 4'b0010;
		end
		else 
		begin
			digit = sec2;
			dig = 4'b0001;
		end
	 end
	 
	 always @(digit) begin
		if(adj == 1 & blink == 1) seven_seg = 7'b0000000;
		else if(digit == 0) seven_seg = 7'b1111110;
		else if(digit == 1) seven_seg = 7'b0110000;
		else if(digit == 2) seven_seg = 7'b1101101;
		else if(digit == 3) seven_seg = 7'b1111001;
		else if(digit == 4) seven_seg = 7'b0110011;
		else if(digit == 5) seven_seg = 7'b1011011;
		else if(digit == 6) seven_seg = 7'b1011111;
		else if(digit == 7) seven_seg = 7'b1110000;
		else if(digit == 8) seven_seg = 7'b1111111;
		else if(digit == 9) seven_seg = 7'b1111011;
	 end
	 
	 always @(posedge fast or posedge reset)
	 begin
		if(reset) iterator <= 0;
		else iterator <= iterator+1;		
	 end
	 
	
	 
	 


endmodule
