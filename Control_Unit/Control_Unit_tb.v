/* 
This ia a simple testbench for the Control Unit Module
*/
`timescale 1ns/100ps 
// testbench has no inputs or outputs
module Control_Unit_tb ();

	//declare testbench signals
    reg		    [5:0]	Opcode_tb ;
    reg		    [5:0]	Funct_tb  ;
    wire	    [2:0]	ALUControl_tb ;
    wire	            MemtoReg_tb;
    wire	            MemtoWrite_tb;
    wire	            Branch_tb;
    wire	            AluSrc_tb;
    wire	            RegDst_tb;
    wire	            RegWrite_tb;
    wire	            Jump_tb	;

    // Design instantiation
    Control_Unit  DUT (
     	.Opcode(Opcode_tb),
	   	.Funct(Funct_tb),
       	.ALUControl(ALUControl_tb),
        .MemtoReg(MemtoReg_tb),
        .MemtoWrite(MemtoWrite_tb),
        .Branch(Branch_tb),
        .AluSrc(AluSrc_tb),
        .RegDst(RegDst_tb),
        .RegWrite(RegWrite_tb),
        .Jump(Jump_tb)
    );

    //initial block
    initial
    begin
		$dumpfile("Control_Unit.vcd");    // waveforms in this file      
		$dumpvars;                        // saves all waveforms  
		#5
		Opcode_tb = 6'b100011 ;
		#1
		$display(" --------Load Instruction-----------");
		$display(" ALUControl_tb = %b  ",ALUControl_tb);
		$display(" MemtoReg_tb = %b  ",MemtoReg_tb);
		$display(" MemtoWrite_tb= %b  ",MemtoWrite_tb);
		$display(" Branch_tb = %b  ",Branch_tb);
		$display(" AluSrc_tb = %b  ",AluSrc_tb);
		$display(" RegDst_tb = %b  ",RegDst_tb);
		$display(" RegWrite_tb = %b  ",RegWrite_tb);
		$display(" Jump_tb = %b ",Jump_tb);
        #5
		Opcode_tb = 6'b101011 ;
		#1
		$display(" --------Store Instruction-----------");
		$display(" ALUControl_tb = %b  ",ALUControl_tb);
		$display(" MemtoReg_tb = %b  ",MemtoReg_tb);
		$display(" MemtoWrite_tb= %b  ",MemtoWrite_tb);
		$display(" Branch_tb = %b  ",Branch_tb);
		$display(" AluSrc_tb = %b  ",AluSrc_tb);
		$display(" RegDst_tb = %b  ",RegDst_tb);
		$display(" RegWrite_tb = %b  ",RegWrite_tb);
		$display(" Jump_tb = %b ",Jump_tb);
		#5
		Opcode_tb = 6'b000000 ;
		Funct_tb  = 6'b100000 ;
		$display(" --------ADD Instruction-----------");
		#1
		$display(" ALUControl_tb = %b  ",ALUControl_tb);
		$display(" MemtoReg_tb = %b  ",MemtoReg_tb);
		$display(" MemtoWrite_tb= %b  ",MemtoWrite_tb);
		$display(" Branch_tb = %b  ",Branch_tb);
		$display(" AluSrc_tb = %b  ",AluSrc_tb);
		$display(" RegDst_tb = %b  ",RegDst_tb);
		$display(" RegWrite_tb = %b  ",RegWrite_tb);
		$display(" Jump_tb = %b ",Jump_tb);
		#5
		Opcode_tb = 6'b000000 ;
		Funct_tb  = 6'b011100 ;
		#1
		$display(" --------MUL Instruction-----------");
		$display(" ALUControl_tb = %b  ",ALUControl_tb);
		$display(" MemtoReg_tb = %b  ",MemtoReg_tb);
		$display(" MemtoWrite_tb= %b  ",MemtoWrite_tb);
		$display(" Branch_tb = %b  ",Branch_tb);
		$display(" AluSrc_tb = %b  ",AluSrc_tb);
		$display(" RegDst_tb = %b  ",RegDst_tb);
		$display(" RegWrite_tb = %b  ",RegWrite_tb);
		$display(" Jump_tb = %b ",Jump_tb);
		#5
		Opcode_tb = 6'b000000 ;
		Funct_tb  = 6'b100010 ;
		$display(" --------SUB Instruction-----------");
		#1
		$display(" ALUControl_tb = %b  ",ALUControl_tb);
		$display(" MemtoReg_tb = %b  ",MemtoReg_tb);
		$display(" MemtoWrite_tb= %b  ",MemtoWrite_tb);
		$display(" Branch_tb = %b  ",Branch_tb);
		$display(" AluSrc_tb = %b  ",AluSrc_tb);
		$display(" RegDst_tb = %b  ",RegDst_tb);
		$display(" RegWrite_tb = %b  ",RegWrite_tb);
		$display(" Jump_tb = %b ",Jump_tb);
		#5
		Opcode_tb = 6'b000000 ;
		Funct_tb  = 6'b101010	 ;
		#1
		$display(" --------SLT Instruction-----------");
		$display(" ALUControl_tb = %b  ",ALUControl_tb);
		$display(" MemtoReg_tb = %b  ",MemtoReg_tb);
		$display(" MemtoWrite_tb= %b  ",MemtoWrite_tb);
		$display(" Branch_tb = %b  ",Branch_tb);
		$display(" AluSrc_tb = %b  ",AluSrc_tb);
		$display(" RegDst_tb = %b  ",RegDst_tb);
		$display(" RegWrite_tb = %b  ",RegWrite_tb);
		$display(" Jump_tb = %b ",Jump_tb);
		#100 
		$finish;  //finished with simulation 
    end
endmodule