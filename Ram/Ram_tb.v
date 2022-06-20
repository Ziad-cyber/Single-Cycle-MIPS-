/* 
This ia a simple testbench for the Ram Module
*/
`timescale 1ns/100ps 
// testbench has no inputs or outputs

module Ram_tb #(
parameter WORD_WIDTH_tb = 32 ,
parameter ENTRIES_tb    = 100   )();

	//declare testbench signals
	reg  [$clog2 (ENTRIES_tb)-1:0]  A_tb;
	reg  [(WORD_WIDTH_tb)-1:0]	    WD_tb;
    reg                             Clk_tb;                  
    reg                             WE_tb;
    reg                             Rst_tb;  
    wire [(WORD_WIDTH_tb)-1:0]	    RD_tb;

    // Design instantiation
    Ram #(.WORD_WIDTH(32),.ENTRIES(100)) DUT (
        .Clk(Clk_tb),            
        .A(A_tb), 
        .WD(WD_tb),   
        .WE(WE_tb),     
        .Rst(Rst_tb),
        .RD(RD_tb)
    );
	// Clock Generator
    localparam clk_period= 10;
    always #(clk_period/2) Clk_tb = ~Clk_tb ;      // clock frequency 100 MHz

    //initial block
    initial
    begin
		$dumpfile("Ram.vcd");    // waveforms in this file      
		$dumpvars;              // saves all waveforms  
		Clk_tb = 1'b0; 
		Rst_tb = 1'b1;   
		A_tb   = 'b0000000;   
		WE_tb  = 1'b0;
		#3  // wait 3 ns  
		Rst_tb = 1'b0; 
		A_tb   = 'b0000000;
		WE_tb  = 1'b0;
		#12   // wait 12 ns 
		Rst_tb = 1'b1;  
		A_tb   = 'b0000000;
		WE_tb  = 1'b1;
		WD_tb  = 'h0002;
		#10    // wait 10 ns
		Rst_tb = 1'b1;  
		A_tb   = 'b0000001;
		WE_tb  = 1'b1;
		WD_tb  = 'h0004;
        #10   // wait 10 ns 
		Rst_tb = 1'b1;  
		A_tb   = 'b0000010;
		WE_tb  = 1'b1;
		WD_tb  = 'h0006;
		#5 //t=40 ns
		Rst_tb = 1'b1; 
		A_tb   = 'b0000000;
		WE_tb  = 1'b0;
		#1
		$display(" --------Test Case 1-----------");
        if(RD_tb != 'h0002)
        $display ("TEST CASE 1 IS FAILED") ;
        else
        $display ("TEST CASE 1 IS PASSED") ; 
		$display(" RD_tb = %d ",RD_tb);
		#5
		Rst_tb = 1'b1; 
		A_tb   = 'b0000001;
		WE_tb  = 1'b0;
		#1
		$display(" --------Test Case 2-----------");
        if(RD_tb != 'h0004)
        $display ("TEST CASE 2 IS FAILED") ;
        else
        $display ("TEST CASE 2 IS PASSED") ; 
		$display(" RD_tb = %d ",RD_tb);
		#5
		Rst_tb = 1'b1; 
		A_tb   = 'b0000010;
		WE_tb  = 1'b0;
		#1
		$display(" --------Test Case 3-----------");
        if(RD_tb != 'h0006)
        $display ("TEST CASE 3 IS FAILED") ;
        else
        $display ("TEST CASE 3 IS PASSED") ; 
		$display(" RD_tb = %d ",RD_tb);
		#100 
		$finish;  //finished with simulation 
    end
endmodule