`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:41 01/01/2019 
// Design Name: 
// Module Name:    IF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IF(
    input wire	clk,
	 input wire  rst,
    input [1:0] PCSrc,
    input wire PCWre,
    output [31:0] IRInstruction,
    output [31:0] curPC    
    );

    wire[15:0] immediate = 0;
    wire[25:0] addr = 0;
    

    pc pc(.CLK(clk),
          .RST(rst),
          .PCWre(PCWre),
          .nextPC(nextPC),
          .curPC(curPC));
                           
	 pcAdd pcAdd(.RST(rst),
                .PCSrc(PCSrc),
                .immediate(0),
                .addr(addr),
                .rs(0),
                .nextPC(nextPC),
					 .curPC(curPC));
					 
    InsMEM InsMEM(.IAddr(curPC), 
                  .InsMemRW(clk), 
                  .IDataOut(instruction));
    IR IR(.instruction(instruction),
          .CLK(clk),
          .IRWre(clk),
          .IRInstruction(IRInstruction));

endmodule
