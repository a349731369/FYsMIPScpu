`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:56 12/30/2018 
// Design Name: 
// Module Name:    RegisterFile 
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
//寄存器单元
module RegisterFile(
        input CLK,                  //时钟
        input [4:0] ReadReg1,       //rs寄存器地址输入端口
        input [4:0] ReadReg2,       //rt寄存器地址输入端口
        input [4:0] rd,             //rd寄存器
        input [31:0] WriteData,     //写入寄存器的数据输入端口
        input [1:0] RegDst,         //写寄存器组地址选择信号
        input RegWre,               //WE，写使能信号，为1时，在时钟边沿触发写入
        output reg[31:0] ReadData1, //rs寄存器数据输出端口
        output reg[31:0] ReadData2, //rt寄存器数据输出端口
        output reg[31:0] WriteReg   //写回数据寄存器
    );
    initial begin
        ReadData1 <= 0;
        ReadData2 <= 0;
        WriteReg <= 0; 
    end

    reg [31:0] regFile[0:31]; //  寄存器定义必须用reg类型
    integer i;
    initial begin
        for (i = 0; i < 32; i = i+ 1) regFile[i] <= 0;  
    end
    
    always@(ReadReg1 or ReadReg2) 
    begin
        ReadData1 = regFile[ReadReg1];
        ReadData2 = regFile[ReadReg2];
    end

    always@(negedge CLK)
    begin
        //$0恒为0，所以写入寄存器的地址不能为0
        if(RegWre && WriteReg)
            begin
                regFile[WriteReg] <= WriteData;
            end
    end
    always@(*)
    begin
        case(RegDst)
            2'b00: WriteReg = 31;//返回地址寄存器
            2'b01: WriteReg = ReadReg2;
            2'b10: WriteReg = rd;
        endcase;
    end
endmodule
