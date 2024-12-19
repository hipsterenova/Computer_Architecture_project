`timescale 1ns / 1ps

module new_alu(
    input [31:0] A,
    input [31:0] B,
    input [2:0] alu_con,
    output reg [31:0] alu_out,
    output reg [31:0] A0,
    output reg [31:0] B0
);

always @* begin
    A0 = (A[31] == 1) ? {1'b1, ~A[30:0] + 1} : A;
    B0 = (B[31] == 1) ? {1'b1, ~B[30:0] + 1} : B;

    case (alu_con)
        2'b111: alu_out = A0 - B0;
        2'b101: alu_out = (A0 - B0 < 0) ? (~((A0 - B0) - 1)) : (A0 - B0);
        2'b100: alu_out = A0;
        default: alu_out = 32'h0;
    endcase
end

endmodule