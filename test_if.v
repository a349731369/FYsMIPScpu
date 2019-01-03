`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:32:35 01/01/2019
// Design Name:   IF
// Module Name:   E:/myCpu/FYsMIPScpu/test_if.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_if;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] PCSrc;
	reg PCWre ;
	// Outputs
	wire [31:0] IRInstruction;
	wire [31:0] curPC;

	// Instantiate the Unit Under Test (UUT)
	IF uut (
		.clk(clk), 
		.rst(rst), 
		.PCSrc(PCSrc), 
		.IRInstruction(IRInstruction), 
		.curPC(curPC),
		.PCWre(PCWre)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		PCSrc = 2'b00;
		PCWre = 0;
		// Wait 100 ns for global reset to finish
		#1000;
		
        rst = 1;
		#20 clk = 1;
		#20 clk = 0;
		#20 clk = 1;
		#20 clk = 0;
		#20 clk = 1;
		#20 clk =0;
		#20 clk = 1;
		PCWre = 1;
		#20 clk = ~clk;
		#20 clk = ~clk;
		PCWre = 0;
		// Add stimulus here

	end
      
endmodule

