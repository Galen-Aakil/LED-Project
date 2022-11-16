module LED_Project(clk, sel, rst, q);
   input clk;
   input sel;
   input rst;
   output [7:0] q;
   wire  h0;
   wire  h1;
	wire  h2;
	wire  h3;
	
   
	fenpin u1(.rst(rst), .clk(clk), .clkk1(h0), .clkk2(h1));
	
	debounce d1(.clk(clk), .nrst(rst), .key_in(sel), .key_out(h3));
   
   mux u2(.a(h0), .b(h1), .sel(h3), .y(h2));
   
   color u3(.clk(h2), .rst(rst), .q(q));
   
endmodule
