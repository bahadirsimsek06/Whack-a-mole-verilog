`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:43 01/21/2023 
// Design Name: 
// Module Name:    led 
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
module led(input clk_in, output reg clk_out);
    reg [25:0] count=0;

    always@(posedge clk_in) begin
        count <= count + 1;
        if(count == 22_000_000) begin
            count <= 0;
            clk_out <= ~clk_out;
        end
    end
endmodule
