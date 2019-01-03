`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:18 12/31/2018 
// Design Name: 
// Module Name:    if_id 
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
module if_id(
    input wire	clk,
	input wire  rst,

    input wire[5:0]               stall,	
	input wire                    flush,

	input wire[31:0]			if_pc,
	input wire[31:0]          if_inst,
	output reg[31:0]      id_pc,
	output reg[31:0]          id_inst  
    );
    pcAdd pcAdd(.RST(RST),
                .PCSrc(PCSrc),
                .immediate(extendtemp),
                .addr(addr),
                .curPC(curPC),
                .rs(A),
                .nextPC(nextPC));

    pc pc(.CLK(CLK),
          .RST(RST),
          .PCWre(PCWre),
          .nextPC(nextPC),
          .curPC(curPC));
          
    InsMEM InsMEM(.IAddr(curPC), 
                  .InsMemRW(InsMemRW), 
                  .IDataOut(instruction));
endmodule
