`timescale 1ns / 1ps

module maindecoder(
    input [5:0] Op,
    //input [1:0] ALUOp,
    input [4:0] shamt,
    input [5:0] funct,
    output [2:0] ALUControl,
    output RegWrite,
    output ALUSrc,
    output MemWrite,
    output ResultSrc,
    output JumpD,
    output opt,
    output [1:0] ImmSrc,//ALUOp
    output dst_src
);

assign RegWrite = (Op == 6'b000010) ? 1'b0 : 1'b1;
assign ImmSrc = (Op == 6'b000010) ? 2'b01 :
                (Op == 6'b001101) ? 2'b00 : 2'b11;
assign dst_src = (Op == 6'b001101) ? 1'b0 :1'b1;                
assign ALUSrc = (Op == 6'b001111) || (Op == 6'b001101) ? 1'b1 : 1'b0;
assign MemWrite = 1'b0;
assign ResultSrc = 1'b0;
assign JumpD = (Op == 7'b000010) ? 1'b1 : 1'b0;
assign opt = 1'b0;
//assign ALUOp = (Op == 7'b0110011) ? 2'b10 :
//               (Op == 7'b1100011) ? 2'b01 :
//                                    2'b00;
                                    
assign ALUControl = (Op == 6'b001111) ? 3'b000 :
                    (Op == 6'b001101) ? 3'b001 :
                    ((Op == 6'b110010) && (shamt == 5'b00000) && (funct == 6'b000000)) ? 3'b010 :
                    ((Op == 6'b111011) && (shamt == 5'b00000) && (funct == 6'b000000)) ? 3'b011 :
                    (Op == 6'b000010) ? 3'b100 :
                    (Op == 6'b000000) ? 3'b110 :
                                        3'b111;

endmodule

