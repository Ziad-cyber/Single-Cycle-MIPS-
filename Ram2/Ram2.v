module Ram2	#(
parameter	WORD_WIDTH = 32,
parameter	ENTRIES = 100
//width= 8, 32?
//how entries 100?
)(
input	wire	Clk,
input	wire	WE,
input 	wire 	Rst,
input	wire	[$clog2 (ENTRIES)-1:0]	A,
input	wire	[WORD_WIDTH-1:0]	WD,
output	reg		[WORD_WIDTH-1:0]	RD 	) ;

reg	[7:0] Ram2 [0:ENTRIES-1];
reg		[15:0]	test_value;
integer ii ;

/*initial 
    begin
		$readmemh ("Hexadecimal_File2.txt", Ram2);
    end
*/
always @ (*)
	begin
		//little endian memory
			RD = {Ram2[A+3],Ram2[A+2],Ram2[A+1],Ram2[A]};
	end 
	
always @ (*)
	begin
		test_value = {Ram2 [1],Ram2 [0]};
	end
	
always @ (posedge Clk or negedge Rst)
	begin
		ii=0;
		if (!Rst)
			begin
				for(ii=0; ii<ENTRIES; ii=ii+1)
					begin
						//Ram2 [ii] <= 8'h0000;
						Ram2 [ii] <= { (8) {1'b0} };
					end
					//$readmemh("mem_contents.txt", Ram2);
			end
		else if (WE)
			begin
				//little endian memory
				Ram2 [A]   <= WD[7:0];
				Ram2 [A+1] <= WD[15:8];
				Ram2 [A+2] <= WD[23:16];
				Ram2 [A+3] <= WD[31:24];
				//{Ram2[A],Ram2[A+1],Ram2[A+2],Ram2[A+3]} <= WD ;
			end 
	end
//how to know that we build from BRAM?
endmodule