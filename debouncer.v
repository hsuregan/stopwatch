`timescale 1ns / 1ps
//input wire switch

module debouncer(
	input clk,

	input rst,
	input pause,
	input adj,
	input select,
	input reset2,
	output rst_out,
	output adj_out,
	output pause_out,
	output select_out
);

    reg[31:0] rst_counter;
    reg[31:0] pause_counter;
    reg[31:0] adj_counter;
    reg[31:0] select_counter;
    
    assign rst_out = (rst_counter > 0);
    assign pause_out = (pause_counter > 0);
    assign adj_out = adj;
    assign select_out = select;
    
   
    
    always @(posedge reset2 or posedge rst or 
    posedge pause or posedge clk)
    begin
        if(reset2)
        begin
            rst_counter <= 0;
            pause_counter <= 0;
            adj_counter <= 0;
            select_counter <= 0;
        end
        else if(rst | pause)
        begin
            if(rst)
               rst_counter <= 20000000;
            if(pause)    
                pause_counter <= 20000000;
        end
        else
        begin
            if(rst_counter!=0)
                rst_counter <= rst_counter -1;
            if(pause_counter!=0)
                pause_counter <= pause_counter -1;
        end
    end
    
    
endmodule



