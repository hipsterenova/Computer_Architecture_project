`timescale 1ns / 1ps

module tb();

    reg clk, rst;
    wire [31:0] InstrD, ALU_ResultM;
    wire [2:0] ALUControlE;
    
    Pipeline_top dut (.clk(clk), .rst(rst), .InstrD(InstrD), .ALUControlE(ALUControlE), .ALU_ResultM(ALU_ResultM));
    
 initial 
    begin
        clk = 0;
        repeat (24)
        #5 clk = ~clk; #10 $finish;  
    end
    
    initial
    begin
        rst = 0;
        #10;
        rst = 1;
    end

//    initial begin
//        $dumpfile("dump.vcd");
//        $dumpvars(0);
//    end

    
endmodule
