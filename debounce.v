module debounce(clk,nrst,key_in,key_out);
    input clk, nrst;
    input key_in;
    output reg key_out;

    localparam TIME_20MS = 1_000_000;

    reg key_cnt;
    reg [20:0] cnt;

    always @(posedge clk or negedge nrst) 
	 begin
        if(nrst == 0)
            key_cnt <= 0;
        else if(key_cnt == 0 && key_out != key_in)
            key_cnt <= 1;
        else if(cnt == TIME_20MS - 1)
            key_cnt <= 0;
    end

    always @(posedge clk or negedge nrst) 
	 begin
        if(nrst == 0)
            cnt <= 0;
        else if(key_cnt)
            cnt <= cnt + 1'b1;
        else
            cnt <= 0;
    end

    always @(posedge clk or negedge nrst) 
	 begin
        if(nrst == 0)
            key_out <= 0;
        else if(key_cnt == 0 && key_out != key_in)
            key_out <= key_in;
    end
endmodule

