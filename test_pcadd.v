`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:09:09 01/01/2019
// Design Name:   pcAdd
// Module Name:   E:/myCpu/FYsMIPScpu/test_pcadd.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pcAdd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pcadd;

	// Inputs
	reg RST;
	reg [1:0] PCSrc;
	reg [31:0] immediate;
	reg [25:0] addr;
	reg [31:0] curPC;
	reg [31:0] rs;

	// Outputs
	wire [31:0] nextPC;

	// Instantiate the Unit Under Test (UUT)
	pcAdd uut (
		.RST(RST), 
		.PCSrc(PCSrc), 
		.curPC(curPC), 
		.nextPC(nextPC)
	);

	initial begin
		// Initialize Inputs
		RST = 0;
		PCSrc = 0;
		curPC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        RST = 1;
		#100;
		curPC = 4;
		#100;
		curPC = 8;

		// Add stimulus here

	end
      
endmodule

