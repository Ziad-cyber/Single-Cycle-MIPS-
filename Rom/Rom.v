module Rom	#(
parameter	WIDTH_ROM = 32,
parameter	DEPTH_ROM = 100
)(
input	wire	Clk,
input	wire	[$clog2 (DEPTH_ROM)-1:0] A,
output	reg		[WIDTH_ROM-1:0]	RD 	) ;

reg	[WIDTH_ROM-1:0]	Rom	[0:DEPTH_ROM-1];
integer iii;

/*initial 
    begin
		$readmemh ("Hexadecimal_File.txt", Rom);
    end
*/
always @ (*)
	begin
		RD = Rom [A>>2];
	end
	
endmodule 