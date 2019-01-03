`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:15:04 12/31/2018
// Design Name:   ALU
// Module Name:   E:/myCpu/FYsMIPScpu/testalu.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testalu;

	// Inputs
	reg ALUSrcA;
	reg ALUSrcB;
	reg [31:0] ReadData1;
	reg [31:0] ReadData2;
	reg [4:0] sa;
	reg [31:0] extend;
	reg [3:0] ALUOp;

	// Outputs
	wire zero;
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.ALUSrcA(ALUSrcA), 
		.ALUSrcB(ALUSrcB), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2), 
		.sa(sa), 
		.extend(extend), 
		.ALUOp(ALUOp), 
		.zero(zero), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		ALUSrcA = 0;
		ALUSrcB = 0;
		ReadData1 = 0;
		ReadData2 = 0;
		sa = 0;
		extend = 0;
		ALUOp = 0;

		// Wait 100 ns for global reset to finish
		#100;
		ReadData1 =32'd8;
		ReadData2 =32'd2;
		ALUOp = 4'b0001;
        
		// Add stimulus here

	end
      
endmodule

