`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:54:40 01/21/2023 
// Design Name: 
// Module Name:    four_bit_counter 
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
module four_bit_counter(clk, clr, Q
    );
	 
input clk, clr;
output reg [3:0] Q;

always@(posedge clk or posedge clr) begin
if(clr)
Q<=4'b0000;
else
Q<=Q+1'b1;
end

endmodule
