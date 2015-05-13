`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:43 04/29/2015 
// Design Name: 
// Module Name:    clk_div 
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
module clk_div(
	input rst,
    input clk,
    output One_Hz,
    output Two_Hz,
    output Blink,
    output Fast
    );
	 
	reg [31:0] first_counter;
	reg [31:0] second_counter;
	reg [31:0] third_counter;
	reg [31:0] fourth_counter;
	
	assign One_Hz = (first_counter == 100000000);//1 hz
	assign Two_Hz = (second_counter == 50000000);//2 hz
	assign Blink = (third_counter < 20000000);
	assign Fast = (fourth_counter == 200000);//500 hz
	
	always @(posedge clk or posedge rst)
	begin
		if(rst) begin
			first_counter <= 0;
			second_counter <= 0;
			third_counter <= 0;
			fourth_counter <= 0;
		end
	
		else begin
        
            if(first_counter != 100000001)
                first_counter <= first_counter + 1;
            else
                first_counter <= 1;
            
            if(second_counter != 50000001)
                second_counter <= second_counter + 1;
            else
                second_counter <= 1;
			
            if(third_counter != 40000001)
                third_counter <= third_counter + 1;
               else
                third_counter <= 1;
                
            if(fourth_counter != 200001)
                fourth_counter <= fourth_counter + 1;
             else
                fourth_counter <= 1;
		end
        
        
/*
		if(first_counter == 1000001)
				first_counter = 1;
            
		if(second_counter == 500001)
				second_counter = 1;
            
		if(third_counter == 5000001)
				third_counter = 1;
            
		if(fourth_counter == 10001)
				fourth_counter = 1;
         */
	end	
    
			
		
		
    

endmodule
