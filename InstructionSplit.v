`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:07 12/30/2018 
// Design Name: 
// Module Name:    InstructionSplit 
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
module InstructionSplit(
        input [31:0] instruction,//指令
        output reg[5:0] op,//操作码
        output reg[4:0] rs,//第一源寄存器
        output reg[4:0] rt,//第二源寄存器
        output reg[4:0] rd,//目标寄存器
        output reg[4:0] sa,//移位指令，移位量
        output reg[5:0] func,
        output reg[15:0] immediate,//立即数
        output reg[25:0] addr//地址
    );
    initial begin
        op = 6'b00000;
        rs = 5'b00000;
        rt = 5'b00000;
        rd = 5'b00000;
        func = 6'b000000;
    end
    
    always@(instruction) 
    begin
        op <= instruction[31:26];
        rs <= instruction[25:21];
        rt <= instruction[20:16];
        rd <= instruction[15:11];
        sa <= instruction[10:6];
        func <= instruction[5:0];
        immediate <= instruction[15:0];
        addr <= instruction[25:0];
    end

endmodule
