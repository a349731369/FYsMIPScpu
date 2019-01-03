`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:25 12/30/2018 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
        input CLK,//时钟
        input RST,//复位信号
        input zero,         //ALU运算结果是否为0，为0时候为1
        input [5:0] op,     //指令的op
        input [5:0] func,  //指令的具体操作
        output reg IRWre,       //IR的写使能信号
        output reg PCWre,       //PC是否更改的信号量，为0时候不更改，否则可以更改
        output reg ExtSel,      //立即数扩展的信号量，为0时候为0扩展，否则为符号扩展
        output reg InsMemRW,    //指令寄存器的状态操作符，为0的时候写指令寄存器，否则为读指令寄存器
        output reg WrRegDSrc,   //写入寄存器的数据选择信号
        output reg [1:0] RegDst,//写寄存器组寄存器的地址，为0的时候地址来自rt，为1的时候地址来自rd
        output reg RegWre,      //寄存器组写使能，为1的时候可写
        output reg ALUSrcA,     //控制ALU数据A的选择端的输入，为0的时候，来自寄存器堆data1输出，为1的时候来自移位数sa
        output reg ALUSrcB,     //控制ALU数据B的选择端的输入，为0的时候，来自寄存器堆data2输出，为1时候来自扩展过的立即数
        output reg [1:0]PCSrc,  //获取下一个pc的地址的数据选择器的选择端输入
        output reg [3:0]ALUOp,  //ALU 16种运算功能选择(0000-1111)
        output reg mRD,         //数据存储器读控制信号，为0读
        output reg mWR,         //数据存储器写控制信号，为0写
        output reg DBDataSrc    //数据保存的选择端，为0来自ALU运算结果的输出，为1来自数据寄存器（Data MEM）的输出     
    );
    //无流水的状态转换
    reg [2:0] state, nextState;    //记录状态
    //流水状态需要修改↓↓↓
    parameter [2:0] iniState = 3'b111, //初始状态
                    sIF = 3'b000, //取指状态
                    sID = 3'b001,//译指状态
                    sEXE = 3'b010,//执行状态
                    sMEM = 3'b100,//访存状态
                    sWB = 3'b011;//写回状态
    initial begin
        state = iniState;
        PCWre = 0;  
        InsMemRW = 0;  
        IRWre = 0;  
        RegWre = 0;  ;  
        ExtSel = 0;  
        PCSrc = 2'b00;  
        RegDst = 2'b11;
        ALUOp = 0;  
        ExtSel = 0;
        WrRegDSrc = 0;
        ALUSrcA = 0;
        ALUSrcB = 0;
        DBDataSrc = 0;
        mRD = 0;
        mWR = 0;
    end

    //状态机
    always@(posedge CLK) begin
        if(!RST) begin
            state <= sIF;
        end else begin
            state <= nextState;
        end
    end

    always@(state or func or op  or zero) 
    begin
        // 状态更新
        case(state)
            iniState : nextState = sIF;//无条件转移状态
            sIF: nextState = sID;//无条件转移状态
            sID: begin
                case(op[5:0])
                    6'b000010: nextState = sIF;    //指令j,halt
                    6'b000011: nextState = sIF;//指令jal
                    6'b000000: 
                                if(func[5:0] ==6'b001000)//指令jr
                                    begin
                                        nextState = sIF;
                                    end
                                else
                                    begin
                                        nextState = sEXE;
                                    end
                    default: nextState = sEXE;
                endcase
            end
            sEXE:begin
                    if((op == 6'b000100)||(op == 6'b000001))//beq,bltz
                        begin
                            nextState = sIF;
                        end
                    else if((op == 6'b101011) || (op == 6'b100011)) //sw,lw
                        begin
                            nextState = sMEM;
                        end
                    else 
                        begin
                        nextState = sWB;
                        end
                end
            sMEM:begin
                    if(op ==6'b101011)
                        begin
                            //sw
                             nextState = sIF;
                        end
                    else
                        begin
                            //lw
                            nextState = sWB;
                        end
                end
            sWB: 
                begin
                    nextState = sIF;
                end
        endcase
        
        // 信号量
        if(nextState == sIF && op != 6'b111111 && state != iniState) 
            begin
                // halt
                PCWre = 1;
                InsMemRW = 1;  
            end 
        else 
            begin
                PCWre = 0;
                InsMemRW = 0;  
            end
        // IRWre
        if(state == sIF || nextState == sID) 
            begin
                IRWre = 1;
            end 
        else 
            begin
                IRWre = 0;
            end

        // ALUSrcA
        if((op == 6'b000000) && (func ==6'b000000)) 
            begin
                // sll
                ALUSrcA = 1;
            end 
        else 
            begin
                ALUSrcA = 0;
            end

        // ALUSrcB

        if(op==6'b001000||op == 6'b001101||op == 6'b101011||op == 6'b100011||op == 6'b001011)
            // addi,ori,sw,lw,sltiu
            ALUSrcB = 1;
        else
            ALUSrcB = 0;
        
         // DBDataSrc
        if(op == 6'b100011)
            //LW
            DBDataSrc = 1;
        else
            DBDataSrc = 0;
        

        // RegWre and WrRegDSrc and RegDst
        if((state == sWB && op != 6'b000100 && op != 6'b101011 && op != 6'b000001) || (op == 6'b000010 && state == sID))
            begin
                RegWre = 1;
            if(op==6'b000011)//jal
                begin
                     WrRegDSrc = 0;
                RegDst = 2'b00;
                end
            else
                begin
                    WrRegDSrc = 1;
                 if(op == 6'b001000 || op == 6'b001101 || op == 6'b001011 || op == 6'b100011) // addi, ori, sltiu, lw
                    begin
                        RegDst = 2'b01;
                    end
                else // add, sub, or, and, slt, sll
                    begin
                        RegDst = 2'b10;
                    end
                end
            
        end else begin
                RegWre = 0;
        end

        // InsMemRW
        if(op != 6'b111111)
            InsMemRW = 1;
         // mRD 
        mRD = (op == 6'b100011) ? 1 : 0; // lw
        // mWR
        mWR = (state == sMEM && op == 6'b101011) ? 1 : 0; // sw
        // ExtSel
        ExtSel = (op == 6'b001000 || op == 6'b100011 || op == 6'b101011 || op == 6'b000100 || op == 6'b000001) ? 1 : 0; 
        // addi、lw、sw、beq、bltz

        // PCSrc
        if(op == 6'b000000 &&func == 6'b001000) 
            begin
                // jr
                PCSrc = 2'b10;
        end else if((op == 6'b000100 && zero) || (op == 6'b000001 && !zero)) begin
            // beq 和 bltz跳转
            PCSrc = 2'b01;
        end else if(op == 6'b000010 || op == 6'b000011) begin
            // j,jal
            PCSrc = 2'b11;
        end else begin
            PCSrc = 2'b00;
        end

        // ALUOp
        case(op)
            6'b001000: ALUOp = 4'b0000;  // addi
            6'b001101: ALUOp = 4'b0101;  // ori
            6'b000100: ALUOp = 4'b0001;  // beq
            6'b001011: ALUOp = 4'b0010;  // sltiu
            6'b000001: ALUOp = 4'b0001;  // bltz
            6'b101011: ALUOp = 4'b0000;  //sw
            6'b100011: ALUOp = 4'b0000;  //lw
            6'b000000:
                    begin
                        if (func == 6'b100101)// or
                            begin
                                ALUOp = 4'b0101;
                        end else if (func == 6'b100010)// sub
                            begin
                                ALUOp = 4'b0001;
                            end
                        else if (func == 6'b100100)// and
                            begin
                                ALUOp = 4'b0110;
                            end 
                        else if (func == 6'b000000)// sll
                            begin
                                ALUOp = 4'b0100;
                            end 
                        else if (func == 6'b101010)// slt
                            begin
                                ALUOp = 4'b0011;
                            end
                    end
        endcase
    end
endmodule
