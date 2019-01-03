`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:29 12/30/2018 
// Design Name: 
// Module Name:    pcAdd 
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
module pcAdd(
    input RST,//复位信号
    input [1:0] PCSrc,       //不同状态的pc转移控制信号
    input [31:0] immediate,  //偏移�
    input [25:0] addr,
    input [31:0] curPC,//当前pc
    input [31:0] rs,
    output reg[31:0] nextPC  //新指令地址
    
    );
    initial begin
        nextPC = 0;
    end

    reg [31:0] pc;
    
    always@(*)
    begin
        if(!RST) begin//复位生效
            nextPC = 0;
        end
        else begin//
            pc = curPC + 4;
            /*
            case(PCSrc)
                2'b00: nextPC = curPC + 4;
                2'b01: nextPC = curPC + 4 + immediate * 4;
                2'b10: nextPC = rs;
                2'b11: nextPC = {pc[31:28],addr,2'b00};
            endcase
            */
            nextPC = pc;
        end
    end

endmodule
