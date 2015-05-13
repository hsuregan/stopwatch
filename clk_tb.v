`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:27:17 05/04/2015
// Design Name:   clk_div
// Module Name:   C:/Users/152/Desktop/Regan/lab3/Stopwatch/clk_tb.v
// Project Name:  Stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_tb;

	// Inputs
	reg clk;
	reg rst;
	// Outputs
	wire One_Hz;
	wire Two_Hz;
	wire Blink;
	wire Fast;

	// Instantiate the Unit Under Test (UUT)
	clk_div uut (
		.clk(clk), 
		.rst(rst),
		.One_Hz(One_Hz), 
		.Two_Hz(Two_Hz), 
		.Blink(Blink), 
		.Fast(Fast)
	);
	
	always begin
	#1 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#5 rst = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

