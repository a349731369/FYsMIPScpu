`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:29 12/30/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
		input ALUSrcA,
        input ALUSrcB,
        input [31:0] ReadData1,
        input [31:0] ReadData2,
        input [4:0] sa,
        input [31:0] extend,
        input [3:0] ALUOp,
        output reg zero,
        output reg[31:0] result
    );
	 reg [31:0] A;
    reg [31:0] B;
	 initial begin
        result = 0;
        zero = 0;
    end
	 
	 
	 always@(ReadData1 or ReadData2 or ALUSrcA or ALUSrcB or ALUOp)
     begin
        A = (ALUSrcA ==0)? ReadData1 :sa;
        B = (ALUSrcB ==0)? ReadData2 :extend;
        case (ALUOp)
            4'b0000:result = A+B;
            4'b0001: result = A - B;
            4'b0010: result = (A < B) ? 1 : 0;
            4'b0011: result = (((ReadData1 < ReadData2) && (ReadData1[31] == ReadData2[31] )) ||( ( ReadData1[31] ==1 && ReadData2[31] == 0))) ? 1:0;
            4'b0100: result = B << A;
            4'b0101: result = A | B;
            4'b0110: result = A & B;
            4'b0111: result = A ^ B;
            4'b1000: result = A * B;
            4'b1001: result = A / B;//浮点寄存器才能用

        endcase
	    zero = (result == 0) ? 1 : 0;
	 end
	
endmodule
