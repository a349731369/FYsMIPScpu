`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:36 12/30/2018 
// Design Name: 
// Module Name:    InsMem 
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
module InsMEM(
        input [31:0] IAddr,
        input InsMemRW,             //状态为'0'，写指令寄存器，否则为读指令寄存器
        output reg[31:0] IDataOut
    );
    
    reg [7:0] rom[128:0];  // 存储器定义必须用reg类型，存储器存储单元8位长度，共128个存储单元，可以存32条指令
    
    // 加载指令存储器rom
    initial 
    begin
        $readmemh("E:\\myCpu\\FYsMIPScpu\\FY_test_int.txt", rom);//初始化加载指令
    end
    
    always@(IAddr or InsMemRW)
    begin
        //取指令
        if(InsMemRW)
            begin//高字节在低地址，所以是大端模式
                IDataOut[7:0] = rom[IAddr + 3];
                IDataOut[15:8] = rom[IAddr + 2];
                IDataOut[23:16] = rom[IAddr + 1];
                IDataOut[31:24] = rom[IAddr];
            end 
    end
    
endmodule