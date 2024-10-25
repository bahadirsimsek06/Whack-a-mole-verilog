`timescale 1ns / 1ps
module ClkDivider(clk_in,clk_out
    );
		input clk_in;
		output reg clk_out;
		integer Check;
		
		initial begin
		Check=1;
		clk_out=0;
		end
		
		always@(posedge clk_in)
		begin
		if(Check==50000)
		begin
		clk_out=~clk_out;
		Check=1;
		end
		else
		Check=Check+1;
		end

endmodule
