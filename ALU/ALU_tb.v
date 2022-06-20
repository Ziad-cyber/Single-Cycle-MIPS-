/* 
This ia a simple testbench for the ALU Module
*/
`timescale 1ns/100ps 
// testbench has no inputs or outputs
module ALU_tb ();

	//declare testbench signals
    reg   [31:0]	SrcA_tb ;
    reg   [31:0]	SrcB_tb ;
    reg   [2:0]	    ALUControl_tb ;
    wire  [31:0]	ALUResult_tb ;
    wire	        zero_tb;

    // Design instantiation
    ALU  DUT (
      	.SrcA(SrcA_tb) ,
      	.SrcB(SrcB_tb) ,
        .ALUControl(ALUControl_tb) ,
      	.ALUResult(ALUResult_tb ),
        .zero(zero_tb)
    );

    //initial block
    initial
    begin
		$dumpfile("ALU.vcd");    // waveforms in this file      
		$dumpvars;                        // saves all waveforms  
        #5
        SrcA_tb=32'd1;
        SrcB_tb=32'd2;
        ALUControl_tb=3'b010;
		#1
        $display(" --------ADD-----------");
		$display(" zero_tb = %b  ",zero_tb);
		$display(" ALUResult_tb = %b  ",ALUResult_tb);
        #5
        SrcA_tb=32'd1;
        SrcB_tb=32'd2;
        ALUControl_tb=3'b100;
		#1
        $display(" --------SUB-----------");
		$display(" zero_tb = %b  ",zero_tb);
		$display(" ALUResult_tb = %b  ",ALUResult_tb);
         #5
        SrcA_tb=32'd1;
        SrcB_tb=32'd1;
        ALUControl_tb=3'b110;
		#1
        $display(" --------SLT-----------");
		$display(" zero_tb = %b  ",zero_tb);
		$display(" ALUResult_tb = %b  ",ALUResult_tb);
		#100 
		$finish;  //finished with simulation 
    end
endmodule