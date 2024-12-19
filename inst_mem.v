`timescale 1ns / 1ps

module Instruction_Memory(PC,reset,Instruction_Code);

  input reset;
  input [31:0]PC;
  output [31:0]Instruction_Code;

  reg [31:0] mem [36:0];
  
  assign Instruction_Code = (~reset) ? {32{1'b0}} : mem[PC[31:2]];



  initial begin
   // mem[0] = 32'h00011020;
   // mem[1] = 32'h00832383;
    // mem[0] = 32'h0064A423;
     //mem[1] = 32'h00B62423;
   //mem[0] = 32'h0062E233;
     //mem[1] = 32'h00B62423;

  end

endmodule