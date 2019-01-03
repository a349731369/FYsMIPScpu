`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:21:34 12/30/2018
// Design Name:   CPUTOP
// Module Name:   E:/myCpu/FYsMIPScpu/test1.v
// Project Name:  FYsMIPScpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPUTOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test1;

	// Inputs
	reg CLK;
	reg RST;

	// Outputs
	wire [31:0] curPC;
	wire [31:0] nextPC;
	wire [31:0] instruction;
	wire [31:0] IRInstruction;
	wire [5:0] op;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [5:0] func;
	wire [31:0] DB;
	wire [31:0] dataDB;
	wire [31:0] A;
	wire [31:0] dataA;
	wire [31:0] B;
	wire [31:0] dataB;
	wire [31:0] result;
	wire [31:0] dataResult;
	wire [1:0] PCSrc;
	wire zero;
	wire PCWre;
	wire ExtSel;
	wire InsMemRW;
	wire [1:0] RegDst;
	wire RegWre;
	wire ALUSrcA;
	wire ALUSrcB;
	wire [3:0] ALUOp;
	wire mRD;
	wire mWR;
	wire DBDataSrc;
	wire WrRegDSrc;
	wire [31:0] WriteReg;

	// Instantiate the Unit Under Test (UUT)
	CPUTOP uut (
		.CLK(CLK), 
		.RST(RST), 
		.curPC(curPC), 
		.nextPC(nextPC), 
		.instruction(instruction), 
		.IRInstruction(IRInstruction), 
		.op(op), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.func(func), 
		.DB(DB), 
		.dataDB(dataDB), 
		.A(A), 
		.dataA(dataA), 
		.B(B), 
		.dataB(dataB), 
		.result(result), 
		.dataResult(dataResult), 
		.PCSrc(PCSrc), 
		.zero(zero), 
		.PCWre(PCWre), 
		.ExtSel(ExtSel), 
		.InsMemRW(InsMemRW), 
		.RegDst(RegDst), 
		.RegWre(RegWre), 
		.ALUSrcA(ALUSrcA), 
		.ALUSrcB(ALUSrcB), 
		.ALUOp(ALUOp), 
		.mRD(mRD), 
		.mWR(mWR), 
		.DBDataSrc(DBDataSrc), 
		.WrRegDSrc(WrRegDSrc), 
		.WriteReg(WriteReg)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;

		// Wait 100 ns for global reset to finish
		#1000 RST = 1;
        forever #20 CLK = ~CLK;
        
		// Add stimulus here

	end
      
endmodule

