`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bahadir SIMSEK
// 
// Create Date:    22:05:37 01/21/2023 
// Design Name: 
// Module Name:    lfsr 
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
module main_block(
    input clk,clr,reset,
	 input [3:0] button,
	 output reg[3:0]scoretemp0,
	 output reg[3:0]scoretemp1,
	 output reg[3:0]scoretemp2,
	 output reg[3:0]scoretemp3,
	 output reg[3:0]lfsr_out,
	 output reg [3:0] ssb_en,
	 output reg [6:0] ssb_out
    );
	 
wire [3:0] Q;
wire clk_out;
wire [3:0] scoreup;
wire clk4ms;
wire [6:0]res1;
wire [6:0]res2;
integer check; 
 
led U1(clk,clk_out);
four_bit_counter U2(clk_out,clr,Q);
ClkDivider U3(.clk_in(clk),.clk_out(clk4ms));
score U4(.score0(scoretemp0),.score1(scoretemp1),.score2(scoretemp2),.score3(scoretemp3),.scorefinal(scoreup));
ssb U5(.num_in(scoreup),.clk(clk),.led2(res1),.led1(res2));
 
initial 
begin 
scoretemp0=4'b0000;
scoretemp1=4'b0000;
scoretemp2=4'b0000;
scoretemp3=4'b0000;
check=0;
end 
 
 always@(posedge clk_out or posedge reset) begin
  if(reset)
  lfsr_out<=4'b0000;
  else
  
  case(Q)
  
  4'b0000:lfsr_out<=4'b0000;
  4'b0001:lfsr_out<=4'b0001;
  4'b0010:lfsr_out<=4'b0010;
  4'b0011:lfsr_out<=4'b0101;
  4'b0100:lfsr_out<=4'b1010;
  4'b0101:lfsr_out<=4'b0100;
  4'b0110:lfsr_out<=4'b1001;
  4'b0111:lfsr_out<=4'b0011;
  4'b1000:lfsr_out<=4'b0110;
  4'b1001:lfsr_out<=4'b1101;
  4'b1010:lfsr_out<=4'b1011;
  4'b1011:lfsr_out<=4'b0111;
  4'b1100:lfsr_out<=4'b1110;
  4'b1101:lfsr_out<=4'b1100;
  4'b1110:lfsr_out<=4'b1000;
  4'b1111:lfsr_out<=4'b0000;
  default:lfsr_out<=4'b0000;
  endcase
  end
always @(posedge button[0]) begin

    if (button[0] == lfsr_out[0]) begin
        scoretemp0 =scoretemp0 - 4'b0001;

    end else if(button[0] == ~lfsr_out[0])
	 begin
        scoretemp0 =scoretemp0 + 4'b0001;
	
    end

end	 
	 
always @(posedge button[1]) begin	
 
	 if (button[1] == lfsr_out[1]) begin
        scoretemp1 =scoretemp1 - 4'b0001;
		
    end else if(button[1] == ~lfsr_out[1])
	 begin
        scoretemp1 =scoretemp1 + 4'b0001;
		 
    end
end	 
	 
always @(posedge button[2]) begin	
 
	 if (button[2] == lfsr_out[2]) begin
        scoretemp2 =scoretemp2 - 4'b0001;

    end else if(button[2] == ~lfsr_out[2])
	 begin
        scoretemp2=scoretemp2 + 4'b0001;
		 
    end	 	 
end

always @(posedge button[3]) begin	
 
	 if (button[3] == lfsr_out[3]) begin
        scoretemp3 =scoretemp3 + 4'b0001;

    end else if(button[3] == ~lfsr_out[3])
	 begin
        scoretemp3=scoretemp3 - 4'b0001;
		 
    end	 	 
end



always@(posedge clk4ms)
	begin
		
		
			if(check==0)
				begin
				ssb_en=4'b1101;
				ssb_out=res1;
				check = 1;
		
				end
			else if(check==1)
			begin
				ssb_en=4'b1110;
				ssb_out=res2;
				check = 0;
			end
	end  
endmodule

