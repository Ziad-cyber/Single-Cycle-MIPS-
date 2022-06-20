module PC (
input wire CLK ,
input wire RST ,
input wire [31:0] i_PC ,
output reg [31:0] o_pc
);

//reg Declaration 
reg [31:0] reg_pc ;

//PC Sequential Circuit
always @ ( posedge CLK or negedge RST )
	begin
		if (!RST)
			o_pc <= 32'h0000;
		else 
			o_pc <= i_PC ;
	end

endmodule