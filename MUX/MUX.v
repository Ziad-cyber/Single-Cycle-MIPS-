module MUX #(
parameter	M_WIDTH = 32
)(
input	wire sel ,
input	wire [M_WIDTH-1:0] in1 ,
input	wire [M_WIDTH-1:0] in2 ,
output  reg  [M_WIDTH-1:0] out ) ;

always @ (*)
	begin 
		case (sel)
			1'b0 : out = in1 ;
			1'b1 : out = in2 ;
		endcase 
    end
endmodule
