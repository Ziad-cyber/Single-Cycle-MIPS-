/* 
This ia a simple testbench for the Register_File Module
*/
`timescale 1ns/100ps 
// testbench has no inputs or outputs
module Register_File_tb #(
parameter WIDTH_tb    = 32 ,
parameter DEPTH_tb    = 100   )();

	//declare testbench signals
reg	 	[$clog2 (DEPTH_tb)-1:0]	A1_tb ;
reg	 	[$clog2 (DEPTH_tb)-1:0]	A2_tb ;
reg	 	[$clog2 (DEPTH_tb)-1:0]	A3_tb ;
reg	 	                        Clk_tb;
reg   	                        Rst_tb;
reg	 	                        WE3_tb;
reg	 	[(WIDTH_tb)-1:0]	    WD3_tb;
wire 	[(WIDTH_tb)-1:0]	    RD2_tb;
wire 	[(WIDTH_tb)-1:0]	    RD1_tb;

    // Design instantiation
    Register_File #(.WIDTH(32),.DEPTH(100)) DUT (
		.A1  (A1_tb)  ,
		.A2  (A2_tb)  ,
		.A3  (A3_tb)  ,
		.Clk (Clk_tb) ,
		.Rst (Rst_tb) ,
		.WE3 (WE3_tb) ,
		.WD3 (WD3_tb) ,
		.RD2 (RD2_tb) ,
		.RD1 (RD1_tb)
    );
	
	// Clock Generator
    localparam clk_period= 10;
    always #(clk_period/2) Clk_tb = ~Clk_tb ;      // clock frequency 100 MHz

    //initial block
    initial
    begin
		$dumpfile("Register_File.vcd");    // waveforms in this file      
		$dumpvars;                        // saves all waveforms  
		Clk_tb  = 1'b0; 
		Rst_tb  = 1'b1;   
		A1_tb   = 'b0000000;  
		A2_tb   = 'b0000000; 
    	A3_tb   = 'b0000000;  		
		WE3_tb  = 1'b0;
		#3  // wait 3 ns  
		Rst_tb  = 1'b0; 
		A1_tb   = 'b0000000;  
		A2_tb   = 'b0000000; 
    	A3_tb   = 'b0000000; 
		WE3_tb   = 1'b0;
		#12   // wait 12 ns 
		Rst_tb = 1'b1;  
		A3_tb   = 'b0000000;
		WE3_tb  = 1'b1;
		WD3_tb  = 'd0;
		#10    // wait 10 ns
		Rst_tb = 1'b1;  
		A3_tb   = 'b0000001;
		WE3_tb  = 1'b1;
		WD3_tb  = 'd1;
		#10    // wait 10 ns
		Rst_tb = 1'b1;  
		A3_tb   = 'b0000010;
		WE3_tb  = 1'b1;
		WD3_tb  = 'd2;
		#10    // wait 10 ns
		Rst_tb = 1'b1;  
		A3_tb   = 'b0000011;
		WE3_tb  = 1'b1;
		WD3_tb  = 'd3;
		#10    // wait 10 ns
		Rst_tb = 1'b1;  
		A3_tb   = 'b0000100;
		WE3_tb  = 1'b1;
		WD3_tb  = 'd4;
		#10    // wait 10 ns
		Rst_tb = 1'b1;  
		A3_tb   = 'b0000101;
		WE3_tb  = 1'b1;
		WD3_tb  = 'd5;
		#5 //t=65 ns
		Rst_tb = 1'b1; 
		A1_tb   = 'b0000000;
		A2_tb   = 'b0000001;
		WE3_tb  = 1'b0;
		#1
		$display(" --------Test Case 1-----------");
        if(RD1_tb != 'd0 && RD2_tb != 'd1 )
        $display ("TEST CASE 1 IS FAILED") ;
        else
        $display ("TEST CASE 1 IS PASSED") ; 
		$display(" RD1_tb = %d ,  RD2_tb = %d ",RD1_tb,RD2_tb);
		#5
		Rst_tb  = 1'b1; 
		A1_tb   = 'b0000010;
		A2_tb   = 'b0000011;
		WE3_tb  = 1'b0;
		#1
		$display(" --------Test Case 2-----------");
        if(RD1_tb != 'd2 && RD2_tb != 'd3 )
        $display ("TEST CASE 2 IS FAILED") ;
        else
        $display ("TEST CASE 2 IS PASSED") ; 
		$display(" RD1_tb = %d ,  RD2_tb = %d ",RD1_tb,RD2_tb);
		#5
		Rst_tb  = 1'b1; 
		A1_tb   = 'b0000100;
		A2_tb   = 'b0000101;
		WE3_tb  = 1'b0;
		#1
		$display(" --------Test Case 3-----------");
		if(RD1_tb != 'd4 && RD2_tb != 'd5 )
        $display ("TEST CASE 3 IS FAILED") ;
        else
        $display ("TEST CASE 3 IS PASSED") ; 
		$display(" RD1_tb = %d ,  RD2_tb = %d ",RD1_tb,RD2_tb);
		#100 
		$finish;  //finished with simulation 
    end
endmodule