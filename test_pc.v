`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:59:29 01/01/2019
// Design Name:   pc
// Module Name:   E:/myCpu/FYsMIPScpu/test_pc.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pc;

	// Inputs
	reg CLK;
	reg RST;
	reg PCWre;
	reg [31:0] nextPC;

	// Outputs
	wire [31:0] curPC;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.CLK(CLK), 
		.RST(RST), 
		.PCWre(PCWre), 
		.nextPC(nextPC), 
		.curPC(curPC)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;
		PCWre = 1;
		nextPC = 0;

		// Wait 100 ns for global reset to finish
		
		#100;
		RST = 1;
		nextPC = 32'd4;
		CLK = 0;
		#100;
		nextPC = 32'd4;
		CLK = 1;
		#100;
		nextPC = 32'd8;
		CLK = 0;
		#100;
		nextPC = 32'd8;
		CLK = 1;
		#100;
		nextPC = 32'd12;
		CLK = 0;
		#100;
		nextPC = 32'd12;
		CLK = 1;
        
		// Add stimulus here

	end
      
endmodule

