`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:00 12/30/2018 
// Design Name: 
// Module Name:    Datamem 
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
//data memory 数据存储器
module Datamem(

        input mRD,//读控制，为0读
        input mWR,//写控制，为0写
        input DBDataSrc,//指明来自alu单元的数据
        input [31:0] DAddr,//地址输入端口
        input [31:0] DataIn,//数据输入端口
        output reg[31:0] DataOut,//数据输出端口
        output reg[31:0] DB
    );
    initial begin //初始化输入为全0
        DB <= 16'b0;
    end

    reg[7:0] ram [0:31];

    always@(mRD or DAddr or DBDataSrc)//读信号或者有数据到来的时候
    begin
         //读,按字节分，后续再考虑拓展位
        DataOut[7:0] = mRD ? ram[DAddr + 3] : 8'bz; // z 为高阻态     
        DataOut[15:8] = mRD ? ram[DAddr + 2] : 8'bz;     
        DataOut[23:16] = mRD ? ram[DAddr + 1] : 8'bz;     
        DataOut[31:24] = mRD ? ram[DAddr] : 8'bz;
        DB = (DBDataSrc == 0) ? DAddr : DataOut;
    end

    always@(mWR or DAddr)
    begin   
        //写
        if(mWR)
            begin
                ram[DAddr] = DataIn[31:24];    
                ram[DAddr + 1] = DataIn[23:16];
                ram[DAddr + 2] = DataIn[15:8];     
                ram[DAddr + 3] = DataIn[7:0];    
            end
    end
endmodule
