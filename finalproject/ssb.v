`timescale 1ns / 1ps
module ssb(
input[3:0]num_in,
input clk,
output reg[6:0] led2,
output reg[6:0] led1
);

	always@(posedge clk)
	begin
	
	case(num_in)
	4'b0000: led2 = 7'b0000001;
	4'b0001: led2 = 7'b0000001;
	4'b0010: led2 = 7'b0000001;
	4'b0011: led2 = 7'b0000001;
	4'b0100: led2 = 7'b0000001;
	4'b0101: led2 = 7'b0000001;
	4'b0110: led2 = 7'b0000001;
	4'b0111: led2 = 7'b0000001;
	4'b1000: led2 = 7'b0000001;
	4'b1001: led2 = 7'b0000001;
	4'b1010: led2 = 7'b1001111;
	4'b1011: led2 = 7'b1001111;
	4'b1100: led2 = 7'b1001111;
	4'b1101: led2 = 7'b1001111;
	4'b1110: led2 = 7'b1001111;
	4'b1111: led2 = 7'b1001111;
	
	endcase
		
		end
		
	always@(posedge clk)
	begin
	
	
	case(num_in)
	4'b0000: led1 = 7'b0000001;
	4'b0001: led1 = 7'b1001111;
	4'b0010: led1 = 7'b0010010;
	4'b0011: led1 = 7'b0000110;
	4'b0100: led1 = 7'b1001100;
	4'b0101: led1 = 7'b0100100;
	4'b0110: led1 = 7'b0100000;
	4'b0111: led1 = 7'b0001111;
	4'b1000: led1 = 7'b0000000;
	4'b1001: led1 = 7'b0000100;
	4'b1010: led1 = 7'b0000001;
	4'b1011: led1 = 7'b1001111;
	4'b1100: led1 = 7'b0010010;
	4'b1101: led1 = 7'b0000110;
	4'b1110: led1 = 7'b1001100;
	4'b1111: led1 = 7'b0100100;
	
	
	endcase
	
	
	end
	
endmodule	
