`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:15:46 01/01/2019
// Design Name:   pcall
// Module Name:   E:/myCpu/FYsMIPScpu/test_pc_all.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pcall
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pc_all;

	// Inputs
	reg CLK;
	reg RST;

	// Outputs
	wire [31:0]curPC;

	// Instantiate the Unit Under Test (UUT)
	pcall uut (
		.CLK(CLK), 
		.RST(RST), 
		.curPC(curPC)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;

		// Wait 100 ns for global reset to finish
		#1000;
        RST = 1;
		#20;
		CLK = 1;
		#20;
		CLK = 0;
		#20;
		CLK = 1;
		#20;
		CLK = 0;
		#20;
		CLK = 1;
		#20;
		CLK = 0;

		// Add stimulus here

	end
      
endmodule

