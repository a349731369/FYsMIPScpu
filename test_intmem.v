`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:59 01/01/2019
// Design Name:   InsMEM
// Module Name:   E:/myCpu/FYsMIPScpu/test_intmem.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InsMEM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_intmem;

	// Inputs
	reg [31:0] IAddr;
	reg InsMemRW;

	// Outputs
	wire [31:0] IDataOut;

	// Instantiate the Unit Under Test (UUT)
	InsMEM uut (
		.IAddr(IAddr), 
		.InsMemRW(InsMemRW), 
		.IDataOut(IDataOut)
	);

	initial begin
		// Initialize Inputs
		IAddr = 0;
		InsMemRW = 0;

		// Wait 100 ns for global reset to finish
		#100;
        IAddr = 32'd0;
		InsMemRW = 1;
		#100;
		IAddr = 32'd4;
		InsMemRW = 1;
		#20;
		IAddr = 32'd4;
		InsMemRW = 1;
		#100;
		IAddr = 32'd8;
		InsMemRW = 1;
		#20;
		IAddr = 32'd8;
		InsMemRW = 1;
		// Add stimulus here

	end
      
endmodule

