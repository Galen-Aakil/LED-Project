module mux(a, b, sel, y);
	input a;
	input b;
	input sel;
	output y;
	reg y;
	
	always
	begin
		if(!sel) 
			y<=a;
		else 
			y<=b;
	end
endmodule
