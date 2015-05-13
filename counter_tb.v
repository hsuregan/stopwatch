`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:17:04 05/04/2015
// Design Name:   Counter
// Module Name:   C:/Users/152/Desktop/Regan/lab3/Stopwatch/counter_tb.v
// Project Name:  Stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_tb;

	// Inputs
	reg pause;
	reg sel;
	reg reset;
	reg clk;


	// Outputs
	wire [2:0] min1;
	wire [3:0] min2;
	wire [2:0] sec1;
	wire [3:0] sec2;

	// Instantiate the Unit Under Test (UUT)
	Counter uut (
		.pause(pause), 
		.sel(sel), 
		.reset(reset), 
		.ticker(clk), 
		.min1(min1), 
		.min2(min2), 
		.sec1(sec1), 
		.sec2(sec2)
	);
	
	always begin
		#5 clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		pause = 0;
		sel = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1; //press reset button on fpga
		clk = 1;
		#5 reset = 0;
		#500 $finish;
		// Add stimulus here

	end
      
endmodule

