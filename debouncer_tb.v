`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:24:26 05/10/2015
// Design Name:   debouncer
// Module Name:   C:/Users/Alex/Downloads/Stopwatch/Stopwatch/debouncer_tb.v
// Project Name:  Stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debouncer_tb;

	// Inputs
	reg clk;
	reg rst;
	reg pause;
	reg adj;
	reg select;
	reg reset2;

	// Outputs
	wire rst_out;
	wire adj_out;
	wire pause_out;
	wire select_out;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk(clk), 
		.rst(rst), 
		.pause(pause), 
		.adj(adj), 
		.select(select), 
		.reset2(reset2),
		.rst_out(rst_out), 
		.adj_out(adj_out), 
		.pause_out(pause_out), 
		.select_out(select_out)
	);

always begin
	#1 clk = ~clk;
end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		pause = 0;
		adj = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset2 = 1;
		#5 reset2 = 0;
		#1000;
		
		#100 rst = 1;
		#100 rst = 0;
		#5 rst = 0;
		#5 rst = 1;
		#5 rst = 0;
		#5 rst = 1;
		#5 rst = 1;
		#5 rst = 0;
		#5 rst = 1;
		#5 rst = 1;
		#5 rst = 0;
		#5 rst = 0;
		#5 rst = 1;
		#5 rst = 0;
		#5 rst = 1;
		#5 rst = 0;
		
		#5 adj = 1;
		#2000000000 $finish;
        
		// Add stimulus here

	end
      
endmodule

