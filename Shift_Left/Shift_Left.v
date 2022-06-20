module Shift_Left #(
parameter	I_WIDTH = 32
)(
input	wire  [I_WIDTH-1:0] in ,
output  wire  [I_WIDTH-1:0] out  ) ;

//combinational Shift Left circuit

assign	out = in << 2;
//assign	out = in <<<2;

endmodule
