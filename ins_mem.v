`timescale 1ns / 1ps

module ins_mem(rst,A,RD);

  input rst;
  input [31:0]A;
  output [31:0]RD;

  reg [31:0] mem [1023:0];
  
  assign RD = (~rst) ? {32{1'b0}} : mem[A[31:2]];

//  initial begin
//    $readmemh("memfile.hex",mem);
//  end



  initial begin
    //mem[0] = 32'h00000000;
    mem[0] = 32'hC8480800;
     mem[1] = 32'hC8891800;
     mem[2] = 32'h0023282A;
    mem[3] = 32'h34A600C8;
     mem[4] = 32'hECEA3000;
     mem[5] = 32'h0800000C;
    mem[6] = 32'hC8E83000;
    mem[7] = 32'h3C060080;
    mem[8] = 32'hC8480800;
     mem[9] = 32'hC8891800;
    
  end

endmodule
