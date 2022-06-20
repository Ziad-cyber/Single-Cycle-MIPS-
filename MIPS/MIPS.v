////Top Module of MIPS
module MIPS (
input wire Clk_M,
input wire Reset_M,
output wire [15:0] Test_Value_M
);

//signal declaration
wire MemWrite_M;
wire [31:0] ALUOut_M;
wire [31:0] WriteData_M;
wire [31:0] RD_M;
wire [31:0] PC_M;
wire [31:0] Instr_M;
wire MemtoReg_M;
wire Branch_M;
wire ALUSrc_M;
wire Zero_M;
wire PCSrc_M;
wire RegDst_M;
wire RegWrite_M;
wire Jump_M;
wire [2:0] ALUControl_M;
//assign 
assign PCSrc_M = Zero_M & Branch_M;
//module instantiation
Ram #(.WORD_WIDTH(32),.ENTRIES(100)) RAM(
	.Clk(Clk_M),
	.WE(MemWrite_M),
	.Rst(Reset_M),
	.A(ALUOut_M),
	.WD(WriteData_M),
	.RD(RD_M),
	.test_value(Test_Value_M)
);

Rom	#(.WIDTH_ROM(32),.DEPTH_ROM(100)) ROM(
	.A(PC_M),
	.RD(Instr_M)
);

Control_Unit C_Unit(
    .Opcode(Instr_M[31:26]) , 
    .Funct(Instr_M[5:0])  ,
    .ALUControl(ALUControl_M) ,
    .MemtoReg(MemtoReg_M),
    .MemtoWrite(MemWrite_M),
    .Branch(Branch_M),
    .AluSrc(ALUSrc_M),
    .RegDst(RegDst_M),
    .RegWrite(RegWrite_M),
    .Jump(Jump_M)
);

Data_Path D_Path(
    .Clk_DP(Clk_M),
    .Reset_DP(Reset_M),
    .RegWrite_DP(RegWrite_M),
    .RegDst_DP(RegDst_M),
    .ALUSrc_DP(ALUSrc_M),
    .MemtoReg_DP(MemtoReg_M),
    .PCSrc_DP(PCSrc_M),
    .Jump_DP(Jump_M),
    .ALUControl_DP(ALUControl_M),
    .Instr_DP(Instr_M),
    .ReadData_DP(RD_M),
    .Zero_DP(Zero_M),
    .PC_DP(PC_M),
    .ALUOut_DP(ALUOut_M),
    .WriteData_DP(WriteData_M)
);
endmodule