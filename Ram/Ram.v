module Ram	#(
parameter	WORD_WIDTH = 32 ,
parameter	ENTRIES = 100
//how entries 100?
)(
input	wire	Clk,
input	wire	WE,
input 	wire 	Rst,
input	wire	[$clog2 (ENTRIES)-1:0]	A,
input	wire	[WORD_WIDTH-1:0]	WD,
output	reg		[WORD_WIDTH-1:0]	RD 	) ;

reg	[WORD_WIDTH-1:0] Ram [0:ENTRIES-1];
reg		[15:0]	test_value;
integer ii ;

always @ (*)
	begin
		RD = Ram [A] ;
	end
always @ (*)
	begin
		test_value = Ram [0];
		//test_value 16 bit MSB will be truncate
	end
always @ (posedge Clk or negedge Rst)
	begin
		ii=0;
		if (!Rst)
			begin
				for(ii=0; ii<ENTRIES; ii=ii+1)
					begin
						//Ram [ii] <= (WORD_WIDTH)'h0000 ;
						Ram [ii] <= { (WORD_WIDTH) {1'b0} };
					end
					//$readmemh("mem_contents.txt", Ram);
			end
		else if (WE)
			Ram [A] <= WD;
	end
//how to know that we build from BRAM?
endmodule