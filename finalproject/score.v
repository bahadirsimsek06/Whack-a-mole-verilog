`timescale 1ns / 1ps
module score(
input [3:0]score0,
input [3:0]score1,
input [3:0]score2,
input [3:0]score3,
output [3:0]scorefinal
    );

assign scorefinal=score0+score1+score2+score3;

endmodule
