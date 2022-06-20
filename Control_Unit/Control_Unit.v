module Control_Unit (
input	wire	[5:0]	Opcode , 
input	wire	[5:0]	Funct  ,
output	reg     [2:0]	ALUControl ,
output	reg     MemtoReg,
output	reg     MemtoWrite,
output	reg     Branch,
output	reg     AluSrc,
output	reg     RegDst,
output	reg     RegWrite,
output	reg     Jump				);

reg [1:0]	ALUOP;

always @ (*)
	begin
		case (Opcode) 
		    //load word
            6'b10_0011 :begin
							Jump=0;
							MemtoWrite=0;
							RegWrite=1'b1;
							RegDst=0;
							AluSrc=1'b1;
							MemtoReg=1'b1;
							Branch=0;
							ALUOP=2'b00;
			            end
			//store word
			6'b10_1011 :begin
							Jump=0;
							MemtoWrite=1'b1;
							RegWrite=0;
							RegDst=0;
							AluSrc=1'b1;
							MemtoReg=1'b1;
							Branch=0;
							ALUOP=2'b00;
			            end
			//R-Type Instruction
			6'b00_0000 :begin
							Jump=0;
							MemtoWrite=0;
							RegWrite=1'b1;
							RegDst=1'b1;
							AluSrc=0;
							MemtoReg=0;
							Branch=0;
							ALUOP=2'b10;
			            end
			//Add Immediate
			6'b00_1000 :begin
							Jump=0;
							MemtoWrite=0;
							RegWrite=1'b1;
							RegDst=0;
							AluSrc=1'b1;
							MemtoReg=0;
							Branch=0;
							ALUOP=2'b00;
			            end
			//Branch If_Equal 
			6'b00_0100 :begin
							Jump=0;
							MemtoWrite=0;
							RegWrite=0;
							RegDst=0;
							AluSrc=0;
							MemtoReg=0;
							Branch=1'b1;
							ALUOP=2'b01;
						end

			//Jump Instruction
			6'b00_0010 :begin
							Jump=1'b1;
							MemtoWrite=0;
							RegWrite=0;
							RegDst=0;
							AluSrc=0;
							MemtoReg=0;
							Branch=0;
							ALUOP=2'b00;
			            end 
            //Flushing.
            default :	begin
							Jump=0;
							MemtoWrite=0;
							RegWrite=0;
							RegDst=0;
							AluSrc=0;
							MemtoReg=0;
							Branch=0;
							ALUOP=2'b00;
						end
        endcase
	end
always @ (*)
	begin
		case (ALUOP)
			2'b00 	: ALUControl = 3'b010;
			2'b01 	: ALUControl = 3'b100;
			2'b10 	:	begin
							case (Funct)
								//add
								6'b10_0000	:	ALUControl = 3'b010 ;
								//sub
								6'b10_0010	:	ALUControl = 3'b100 ;
								//slt
								6'b10_1010	:	ALUControl = 3'b110 ;
								//mul
								6'b01_1100	:	ALUControl = 3'b101 ;
								//default
								default : ALUControl = 3'b010;
							endcase
						end
			default : ALUControl = 3'b010;
		endcase
	end
endmodule 