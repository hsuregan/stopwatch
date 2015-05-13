`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:10:05 05/10/2015
// Design Name:   top
// Module Name:   C:/Users/Alex/Downloads/Stopwatch/Stopwatch/top_tb2.v
// Project Name:  Stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb2;

	// Inputs
	reg clk;
	reg pause;
	reg adj;
	reg reset;
	reg sel;

	// Outputs
	wire [2:0] min1;
	wire [3:0] min2;
	wire [2:0] sec1;
	wire [3:0] sec2;
	wire [6:0] seg;
	wire [3:0] dig;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.pause(pause), 
		.adj(adj), 
		.reset(reset), 
		.sel(sel), 
		.min1(min1), 
		.min2(min2), 
		.sec1(sec1), 
		.sec2(sec2), 
		.seg(seg), 
		.dig(dig)
	);

always begin
	#1 clk = ~clk;
end

	initial begin
		// Initialize Inputs
		clk = 0;
		pause = 0;
		adj = 0;
		reset = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#5 reset = 0;
		adj = 0;
		
		#50000 sel = 1;
		#100000 adj = 1;
		#50000 sel = 0;
		#500000 pause = 1;
		#300 $finish;
        
		// Add stimulus here

	end
      
endmodule

