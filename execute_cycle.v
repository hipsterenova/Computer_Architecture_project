`timescale 1ns / 1ps

module execute_cycle(
    input clk, rst,opt,
    input RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, JumpE,
    input [2:0] ALUControlE,
    input [31:0] RD1_E, RD2_E, 
    input [31:0] Imm_Ext_E,
    input [4:0] RD_E,
    input [31:0] PCPlus4E, //PCE,
    input [31:0] ResultW,
    input [1:0] ForwardA_E, ForwardB_E,
    output PCSrcE, RegWriteM, MemWriteM, ResultSrcM,
    output [4:0] RD_M, 
    output [31:0] PCPlus4M, WriteDataM, ALU_ResultM
    //output [31:0] PCTargetE
);

// Declaration of Interim Wires
wire [31:0] Src_A, Src_B_interim, Src_B;
wire [31:0] ResultE,ResultE2,final_ResultE;

// Declaration of Register
reg RegWriteE_r, MemWriteE_r, ResultSrcE_r;
reg [4:0] RD_E_r;
reg [31:0] PCPlus4E_r, RD2_E_r, ResultE_r;

// Declaration of Modules
// 3 by 1 Mux for Source A
Mux_3_by_1 srca_mux (
    .a(RD1_E),
    .b(ResultW),
    .c(ALU_ResultM),
    .s(ForwardA_E),
    .d(Src_A)
);

// 3 by 1 Mux for Source B
Mux_3_by_1 srcb_mux (
    .a(RD2_E),
    .b(ResultW),
    .c(ALU_ResultM),
    .s(ForwardB_E),
    .d(Src_B_interim)
);

// ALU Src Mux
Mux alu_src_mux (
    .a(Src_B_interim),
    .b(Imm_Ext_E),
    .s(ALUSrcE),
    .c(Src_B)
);

// ALU Unit
ALU alu (
    .SrcAE(Src_A),
    .SrcBE(Src_B),
    .Result(ResultE),
    .ALUControl(ALUControlE)
);
new_alu newalu (
                .A(Src_A),
                .B(Src_B),
                .alu_con(ALUControlE),
                .alu_out(ResultE2)
                );
Mux alu_mux (.a(ResultE),.b(ResultE2),.s(opt),.c(final_ResultE));
// Adder
//pcadder branch_adder (
//    .a(PCE),
//    .b(Imm_Ext_E),
//    .c(PCTargetE)
//);

// Register Logic
always @(posedge clk or negedge rst) begin
    if(rst == 1'b0) begin
        RegWriteE_r <= 1'b0; 
        MemWriteE_r <= 1'b0; 
        ResultSrcE_r <= 1'b0;
        RD_E_r <= 5'h00;
        PCPlus4E_r <= 32'h00000000; 
        RD2_E_r <= 32'h00000000; 
        ResultE_r <= 32'h00000000;
    end
    else begin
        RegWriteE_r <= RegWriteE; 
        MemWriteE_r <= MemWriteE; 
        ResultSrcE_r <= ResultSrcE;
        RD_E_r <= RD_E;
        PCPlus4E_r <= PCPlus4E; 
        RD2_E_r <= Src_B_interim; 
        ResultE_r <= final_ResultE;
    end
end

// Output Assignments
assign PCSrcE = JumpE;
assign RegWriteM = RegWriteE_r;
assign MemWriteM = MemWriteE_r;
assign ResultSrcM = ResultSrcE_r;
assign RD_M = RD_E_r;
assign PCPlus4M = PCPlus4E_r;
assign WriteDataM = RD2_E_r;
assign ALU_ResultM = ResultE_r;

endmodule
