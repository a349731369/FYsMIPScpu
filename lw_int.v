`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:16:02 12/30/2018
// Design Name:   InstructionSplit
// Module Name:   E:/myCpu/FYsMIPScpu/lw_int.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionSplit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lw_int;

	// Inputs
	reg [31:0] instruction;

	// Outputs
	wire [5:0] op;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] sa;
	wire [5:0] func;
	wire [15:0] immediate;
	wire [25:0] addr;

	// Instantiate the Unit Under Test (UUT)
	InstructionSplit uut (
		.instruction(instruction), 
		.op(op), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.sa(sa), 
		.func(func), 
		.immediate(immediate), 
		.addr(addr)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
        instruction = 32'h8c020000;
		#100;
        instruction = 32'h8c030004;
		#100;
        instruction = 32'h8c040008;
		#100;
		$stop;

		// Add stimu =lus here

	end
      
endmodule

