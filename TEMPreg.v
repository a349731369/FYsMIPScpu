`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:45 12/30/2018 
// Design Name: 
// Module Name:    TEMPreg 
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
//中间锁一下数据
module TEMPreg(
        input CLK,//时钟
        input [31:0] IData,//新数据
        output reg[31:0] OData//旧数据
    );
    
    initial begin 
        OData = 0;
    end
    
    always@(posedge CLK) begin
        OData <= IData;
    end
endmodule
