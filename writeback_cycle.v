
`timescale 1ns / 1ps

module writeback_cycle(
    input ResultSrcW,
    input [31:0] ALU_ResultW, ReadDataW,
    output [31:0] ResultW
    // input clk, rst, 
    // input [31:0] PCPlus4W 
);

// Declaration of Module
Mux result_mux (
    .a(ALU_ResultW),
    .b(ReadDataW),
    .s(ResultSrcW),
    .c(ResultW)
);


endmodule
