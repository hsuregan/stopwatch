`timescale 1ns / 1ps


//input wire switch

module debouncer(
	input clk,
	input rst,
	input pause,
	input adj,
	input select,

	output rst_out,
	output adj_out,
	output pause_out,
	output select_out
);

	reg [4:0] rst_queue;
	reg [4:0] pause_queue;
	reg [4:0] adj_queue;
	reg [4:0] select_queue;
	reg [15:0] counter;

	assign rst_out = rst_queue[4]&rst_queue[3]&rst_queue[2]&rst_queue[1]&rst_queue[0];
	assign adj_out = adj_queue[4]&adj_queue[3]&adj_queue[2]&adj_queue[1]&adj_queue[0];
	assign pause_out = pause_queue[4]&pause_queue[3]&pause_queue[2]&pause_queue[1]&pause_queue[0];
	assign select_out = select_queue[4]&select_queue[3]&select_queue[2]&select_queue[1]&select_queue[0];

	always @(posedge clk)
	begin
		counter = counter+1;
		if(counter == 100)		// Counter resets every 100 clock cycles
			begin
				counter = 0;
			end
		if((rst_queue == 0))
 		begin
			rst_queue[4] = rst;
		end
		if((pause_queue == 0))
		begin
			pause_queue[4] = pause;
		end
		if((adj_queue == 0))
		begin
			adj_queue[4] = adj;
		end
		if((select_queue == 0))
		begin
			select_queue[4] = select;
		end
	end

	always @( posedge counter )
	begin
	 	if(counter == 50)
	 	begin
	 		if((rst_queue != 0))
	 		begin
				rst_queue = rst_queue > 1;
				rst_queue[4] = rst;
			end
			if((pause_queue != 0))
			begin
				pause_queue = pause_queue > 1;
				pause_queue[4] = pause;
			end
			if((adj_queue != 0))
			begin
				adj_queue = adj_queue > 1;
				adj_queue[4] = adj;
			end
			if((select_queue != 0))
			begin
				select_queue = select_queue > 1;
				select_queue[4] = select;
			end
		end
	end
end module




