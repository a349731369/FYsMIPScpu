`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:05 12/30/2018 
// Design Name: 
// Module Name:    CPUTOP 
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
module CPUTOP(
        input CLK,
        input RST,
        output [31:0] curPC,
        output [31:0] nextPC,
        output [31:0] instruction,
        output [31:0] IRInstruction,
        output [5:0] op,
        output [4:0] rs,
        output [4:0] rt,
        output [4:0] rd,
        output [5:0] func,
        output [31:0] DB,
        output [31:0] dataDB,
        output [31:0] A,
        output [31:0] dataA,
        output [31:0] B,
        output [31:0] dataB,
        output [31:0] result,
        output [31:0] dataResult,
        output [1:0] PCSrc,
        output zero,
        output PCWre,       //PC是否更改的信号量，为0时候不更改，否则可以更改
        output ExtSel,      //立即数扩展的信号量，为0时候为0扩展，否则为符号扩展
        output InsMemRW,    //指令寄存器的状态操作符，为0的时候写指令寄存器，否则为读指令寄存器
        output [1:0] RegDst, //写寄存器组寄存器的地址，为0的时候地址来自rt，为1的时候地址来自rd
        output RegWre,      //寄存器组写使能，为1的时候可写
        output ALUSrcA,     //控制ALU数据A的选择端的输入，为0的时候，来自寄存器堆data1输出，为1的时候来自移位数sa
        output ALUSrcB,     //控制ALU数据B的选择端的输入，为0的时候，来自寄存器堆data2输出，为1时候来自扩展过的立即数
        output [3:0]ALUOp,  //ALU 16种运算功能选择(0000-1111)
        output mRD,         //数据存储器读控制信号，为0读
        output mWR,         //数据存储器写控制信号，为0写
        output DBDataSrc,   //数据保存的选择端，为0来自ALU运算结果的输出，为1来自数据寄存器（Data MEM）的输出  
        output WrRegDSrc,    //写入寄存器组寄存器的数据选择信号
        output WriteReg     //写回寄存器地址
    );
    wire [31:0] extendtemp;
    wire [31:0] DataOut;
    wire[4:0] sa;
    wire[15:0] immediate;
    wire[25:0] addr;
    ControlUnit ControlUnit(.CLK(CLK),
                            .RST(RST),
                            .zero(zero),
                            .op(op),
                            .func(func),
                            .IRWre(IRWre),
                            .PCWre(PCWre),
                            .ExtSel(ExtSel),
                            .InsMemRW(InsMemRW),
                            .WrRegDSrc(WrRegDSrc),
                            .RegDst(RegDst),
                            .RegWre(RegWre),
                            .ALUSrcA(ALUSrcA),
                            .ALUSrcB(ALUSrcB),
                            .PCSrc(PCSrc),
                            .ALUOp(ALUOp),
                            .mRD(mRD),
                            .mWR(mWR),
                            .DBDataSrc(DBDataSrc));

    pcAdd pcAdd(.RST(RST),
                .PCSrc(PCSrc),
                .immediate(extendtemp),
                .addr(addr),
                .curPC(curPC),
                .rs(A),
                .nextPC(nextPC));

    pc pc(.CLK(CLK),
          .RST(RST),
          .PCWre(PCWre),
          .nextPC(nextPC),
          .curPC(curPC));
                              
    InsMEM InsMEM(.IAddr(curPC), 
                  .InsMemRW(InsMemRW), 
                  .IDataOut(instruction));

    IR IR(.instruction(instruction),
          .CLK(CLK),
          .IRWre(IRWre),
          .IRInstruction(IRInstruction));
          
    InstructionSplit InstructionSplit(.instruction(IRInstruction),
                                  .op(op),
                                  .rs(rs),
                                  .rt(rt),
                                  .rd(rd),
                                  .sa(sa),
                                  .func(func),
                                  .immediate(immediate),
                                  .addr(addr));
    
    extend Extend(.immediate(immediate),
                                  .ExtSel(ExtSel),
                                  .extendImmediate(extendtemp));
                                  
    RegisterFile RegisterFile(.CLK(CLK),
                              .ReadReg1(rs),
                              .ReadReg2(rt),
                              .rd(rd),
                              .WriteData(WrRegDSrc ? dataDB : curPC + 4),
                              .RegDst(RegDst),
                              .RegWre(RegWre),
                              .ReadData1(A),
                              .ReadData2(B),
                              .WriteReg(WriteReg));
                              
    TEMPreg ADR(.CLK(CLK),
                .IData(A),
                .OData(dataA));
                
    TEMPreg BDR(.CLK(CLK),
                .IData(B),
                .OData(dataB));
                
    ALU alu(.ALUSrcA(ALUSrcA),
            .ALUSrcB(ALUSrcB),
            .ReadData1(dataA),
            .ReadData2(dataB),
            .sa(sa),
            .extend(extendtemp),
            .ALUOp(ALUOp),
            .zero(zero),
            .result(result));
                            
    TEMPreg ALUoutDR(.CLK(CLK),
                     .IData(result),
                     .OData(dataResult));
    
    Datamem DataMEM(.mRD(mRD),
                    .mWR(mWR),
                    .DBDataSrc(DBDataSrc),
                    .DAddr(result),
                    .DataIn(dataB),
                    .DataOut(DataOut),
                    .DB(DB));
                    
    TEMPreg DBDR(.CLK(CLK),
                 .IData(DB),
                 .OData(dataDB));                        

endmodule
