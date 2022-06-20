module ALU (
input	wire [31:0]	SrcA ,
input	wire [31:0]	SrcB ,
input	wire [2:0]	ALUControl ,
output	reg  [31:0]	ALUResult ,
output	wire	    zero
);

//Declaration of wires
wire  [31:0] and_o;
wire  [31:0] or_o;
wire  [31:0] add_o;
wire  [31:0] sub_o;
wire  [31:0] mul_o;
wire SLT_o;

//assign wires
assign and_o = SrcA & SrcB ; 
assign or_o  = SrcA | SrcB ;
assign add_o = SrcA + SrcB ;
assign sub_o = SrcA - SrcB ;
assign mul_o = SrcA * SrcB ;
assign SLT_o = sub_o[31] ;

always @ (*)
	begin
		case (ALUControl)
			//AND Operation
			3'b000 : ALUResult = and_o;
			//OR Operation
			3'b001 : ALUResult = or_o;
			//ADD Operation
			3'b010 : ALUResult = add_o;
			//Subtract Operation
			3'b100 : ALUResult = sub_o;
			//Multiply Operation
			3'b101 : ALUResult = mul_o;
			//SLT Operation
			3'b110 : ALUResult = SLT_o;
			//Default
			default : ALUResult = 32'd4;
        endcase
    end

assign zero = (ALUResult == 32'h0000);

endmodule 