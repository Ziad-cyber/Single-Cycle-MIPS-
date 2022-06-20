module Sign_Extend (
input  wire [15:0] Instr ,
output reg  [31:0] SignImm
);

//Wire Declaration
wire result ;

//assign wires
assign result = Instr [15] ; 

//Sign Extend Combinational Circuit
always @ (*)
	begin
		if (result==1)
			SignImm = {16'hFFFF,Instr} ;
		else 
			SignImm = {16'h0000,Instr} ;
	end
endmodule 