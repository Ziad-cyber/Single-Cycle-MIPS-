module Register_File	#(
parameter	WIDTH = 32,
parameter	DEPTH = 100
)(
input	wire	Clk,
input 	wire 	Rst,
input	wire	WE3,
input	wire	[$clog2 (DEPTH)-1:0]	A1,
input	wire	[$clog2 (DEPTH)-1:0]	A2,
input	wire	[$clog2 (DEPTH)-1:0]	A3,
input	wire	[WIDTH-1:0]	WD3,
output	reg		[WIDTH-1:0]	RD1,
output	reg		[WIDTH-1:0]	RD2 	) ;

reg	[WIDTH-1:0]	Reg_File [0:DEPTH-1];
integer i;
always @ (*)
	begin
		RD1 = Reg_File	[A1] ;
		RD2 = Reg_File	[A2];
	end
always @ (posedge Clk or negedge Rst)
	begin
		i=0;
		if (!Rst)
			begin
				for (i=0 ; i < DEPTH;i=i+1)
					begin
						//Reg_File[i] <= 'h0000;
						Reg_File [i] <= { (WIDTH) {1'b0} };
					end
			end
		else if (WE3)
			Reg_File[A3] <= WD3;
	end
//reading and writing at the same time & place?
endmodule