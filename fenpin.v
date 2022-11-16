module fenpin(rst, clk, clkk1,clkk2);
   input rst;
	input clk;
   output  clkk1;
	output  clkk2;
   reg clkk1;
	reg clkk2;
	reg [24:0] count;
	integer cnt=0;
	
	
   always @(posedge clk or negedge rst)
      if(!rst)
			begin 
				count <= 0;
				clkk1<=0;
				clkk2<=0;
			end
		else 
			if(count == 25'd12_499_999 && cnt==0)
				begin
					count<=0;
					cnt <= 1;
					clkk1<=~clkk1;
				end
			else if(count == 25'd12_499_999 && cnt==1)
				begin
					count<=0;
					cnt <= 0;
					clkk1<=~clkk1;
					clkk2<=~clkk2;
				end
			else
				begin 
					count <= count + 1'd1;
				end
endmodule
