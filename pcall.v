`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:49 01/01/2019 
// Design Name: 
// Module Name:    pcall 
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
module pcall(
    input RST,
    input CLK,
	 input PCWre,
    output [31:0] curPC
    );
	wire[31:0] nextPC = 0;
	pcAdd pcAdd(.RST(RST),
						 .PCSrc(2'b00),
						 .immediate(0),
						 .addr(0),
						 .curPC(curPC),
						 .rs(A),
						 .nextPC(nextPC));

		 pc pc(.CLK(CLK),
				 .RST(RST),
				 .PCWre(PCWre),
				 .nextPC(nextPC),
				 .curPC(curPC));

endmodule
