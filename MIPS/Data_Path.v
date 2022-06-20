//Top Module of DataPath
module Data_Path (
input  wire          Clk_DP,
input  wire          Reset_DP,
input  wire          RegWrite_DP,
input  wire          RegDst_DP,
input  wire          ALUSrc_DP,
input  wire          MemtoReg_DP,
input  wire          PCSrc_DP,
input  wire          Jump_DP,
input  wire  [2:0]   ALUControl_DP,
input  wire  [31:0]  Instr_DP,
input  wire  [31:0]  ReadData_DP,
output wire          Zero_DP,
output wire  [31:0]  PC_DP,
output wire  [31:0]  ALUOut_DP,
output wire  [31:0]  WriteData_DP
);

//Declare I/O signals
wire [31:0] RD1_SrcA;
wire [4:0]  Mux1_OUT_A3;
wire [31:0] MUX0_SrcB;
wire [31:0] SignImm_MUX0_Sleft;
wire [31:0] Sleft_Adder0;
wire [31:0] PCBranch;
wire [31:0] PCPlus4;
wire [31:0] PCJump;
wire [27:0] Instr_shift;
wire [27:0] Out_shift0;
wire [31:0] MUX2_OUT;
wire [31:0] MUX3_OUT;
wire [31:0] Result_ReadData;
//assign
assign Instr_shift = {2'b00,Instr_DP[25:0]};
assign PCJump = {PCPlus4[31:28],Out_shift0};
//Instantiate Blocks
Register_File #(.WIDTH(32),.DEPTH(32)) R_File(
	.Clk(Clk_DP),
    .Rst(Reset_DP),
	.WE3(RegWrite_DP),
	.A1 (Instr_DP[25:21]),
	.A2 (Instr_DP[20:16]),
	.A3 (Mux1_OUT_A3),
	.WD3(Result_ReadData),
	.RD1(RD1_SrcA),
	.RD2(WriteData_DP)
);
MUX #(.M_WIDTH(32)) Mux0(
	.sel (ALUSrc_DP) ,
	.in1 (WriteData_DP) ,
	.in2 (SignImm_MUX0_Sleft) ,
	.out (MUX0_SrcB)
);
MUX #(.M_WIDTH(5)) Mux1(
	.sel (RegDst_DP) ,
	.in1 (Instr_DP[20:16]) ,
	.in2 (Instr_DP[15:11]) ,
	.out (Mux1_OUT_A3)
);
MUX #(.M_WIDTH(32)) Mux2(
	.sel (PCSrc_DP) ,
	.in1 (PCPlus4) ,
	.in2 (PCBranch) ,
	.out (MUX2_OUT)
);
MUX #(.M_WIDTH(32)) Mux3(
	.sel (Jump_DP) ,
	.in1 (MUX2_OUT) ,
	.in2 (PCJump) ,
	.out (MUX3_OUT)
);
MUX #(.M_WIDTH(32)) Mux4(
	.sel (MemtoReg_DP) ,
	.in1 (ALUOut_DP) ,
	.in2 (ReadData_DP) ,
	.out (Result_ReadData)
);
ALU  Alu (
	.SrcA(RD1_SrcA),
	.SrcB(MUX0_SrcB),
	.ALUControl(ALUControl_DP),
	.ALUResult(ALUOut_DP),
	.zero(Zero_DP)
);
Sign_Extend S_Extend (
	.Instr(Instr_DP[15:0]),
	.SignImm(SignImm_MUX0_Sleft)
);
Shift_Left #(.I_WIDTH(28)) S_Left0 (
	.in(Instr_shift),
	.out(Out_shift0)
);
Shift_Left #(.I_WIDTH(32)) S_Left1 (
	.in(SignImm_MUX0_Sleft),
	.out(Sleft_Adder0)
);
Adder Add0 (
	.A(Sleft_Adder0),
	.B(PCPlus4),
	.C(PCBranch)
);
Adder Add1 (
	.A(PC_DP),
	.B(32'd4),
	.C(PCPlus4)
);
PC Pc1 (
	.CLK(Clk_DP),
	.RST(Reset_DP),
	.i_PC(MUX3_OUT),
	.o_pc(PC_DP)
);
endmodule