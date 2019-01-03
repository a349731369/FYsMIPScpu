`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:27:27 12/31/2018
// Design Name:   RegisterFile
// Module Name:   E:/myCpu/FYsMIPScpu/Register_test.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_test;

	// Inputs
	reg CLK;
	reg [4:0] ReadReg1;
	reg [4:0] ReadReg2;
	reg [4:0] rd;
	reg [31:0] WriteData;
	reg [1:0] RegDst;
	reg RegWre;

	// Outputs
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;
	wire [31:0] WriteReg;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.CLK(CLK), 
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.rd(rd), 
		.WriteData(WriteData), 
		.RegDst(RegDst), 
		.RegWre(RegWre), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2), 
		.WriteReg(WriteReg)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		ReadReg1 = 0;
		ReadReg2 = 0;
		rd = 0;
		WriteData = 0;
		RegDst = 0;
		RegWre = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

