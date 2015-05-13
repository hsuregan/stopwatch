`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:01:41 05/10/2015
// Design Name:   seven_seg
// Module Name:   C:/Users/Alex/Downloads/Stopwatch/Stopwatch/seven_seg_tb.v
// Project Name:  Stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_seg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_seg_tb;

	// Inputs
	reg [2:0] min1;
	reg [3:0] min2;
	reg [2:0] sec1;
	reg [3:0] sec2;
	reg fast;
	reg blink;
	reg reset;

	// Outputs
	wire [6:0] seg;
	wire [3:0] dig;

	// Instantiate the Unit Under Test (UUT)
	seven_seg uut (
		.min1(min1), 
		.min2(min2), 
		.sec1(sec1), 
		.sec2(sec2), 
		.fast(fast), 
		.blink(blink), 
		.reset(reset), 
		.seg(seg), 
		.dig(dig)
	);

	initial begin
		// Initialize Inputs
		min1 = 0;
		min2 = 0;
		sec1 = 0;
		sec2 = 0;
		fast = 0;
		blink = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		min2 = min2 + 1;
		fast = 1;
      
		// Add stimulus here

	end
      
endmodule

