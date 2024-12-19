`timescale 1ns / 1ps
module con_unit(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,JumpD,shamt,funct,ALUControl,dst_src,opt);

    input [5:0]Op;
    input [5:0]funct;
    input [4:0]shamt;
    output RegWrite,ALUSrc,MemWrite,ResultSrc,
            JumpD, dst_src,opt;
    output [1:0]ImmSrc;
    output [2:0]ALUControl;

   // wire [1:0]ALUOp;

    maindecoder Main_Decoder(
                .Op(Op),
                .RegWrite(RegWrite),
                .ImmSrc(ImmSrc),
                .MemWrite(MemWrite),
                .ResultSrc(ResultSrc),
                .JumpD(JumpD),
                .ALUSrc(ALUSrc),
                //.ALUOp(ALUOp)
                //.ALUOp(ALUOp),
                            .shamt(shamt),
                            .funct(funct),
                            //.op(Op),
                            .ALUControl(ALUControl),
                            .dst_src(dst_src),
                            .opt(opt)
    );

//    ALU_Decoder ALU_Decoder(
//                            .ALUOp(ALUOp),
//                            .funct3(shamt),
//                            .funct7(funct),
//                            .op(Op),
//                            .ALUControl(ALUControl)
//    );


endmodule