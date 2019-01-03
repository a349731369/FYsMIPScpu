`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:13 12/30/2018 
// Design Name: 
// Module Name:    IR 
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
//取指令模块,用来稳定指令，跟着时钟走

module IR(
    input [31:0] instruction,//输入指令
    input CLK,//时钟
    input IRWre,//控制信号
    output reg[31:0] IRInstruction//输出指令
    );
    initial begin
        IRInstruction = 0;
    end
    always@(posedge CLK)
    begin
        if(IRWre) begin
            IRInstruction <= instruction;
        end
    end

endmodule
