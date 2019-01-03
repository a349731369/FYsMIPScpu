`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:35 12/30/2018 
// Design Name: 
// Module Name:    pc 
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
module pc(
    input CLK,
    input RST,
    input PCWre,
    input [31:0] nextPC,
    output reg[31:0]curPC
    );

//≥ı ºªØpc
	initial begin
		curPC = 0;
	end
	
	always@(posedge CLK or negedge RST)
	begin 
		if(!RST)
			begin 
				curPC =0;
			end
		else
			begin
				if (PCWre)
					begin
						curPC = nextPC;
					end
				else
					begin
						curPC =curPC;
					end
			end
	end
endmodule
