`timescale 1ns / 1ps

module ALU(
    input [31:0] SrcAE,
    input [31:0] SrcBE,
    input [2:0] ALUControl,
    output reg [31:0] Result
    //output OverFlow,
    //output Carry,
    //output Zero,
    //output Negative
);

always @(*) begin
    case (ALUControl)
        3'b000: Result = {SrcBE[15:0], 16'b0}; // Shift left
        3'b001: Result = SrcAE | SrcBE; // OR
        3'b010: Result = SrcBE << SrcAE; // Multiply
        3'b011: Result = SrcBE >> SrcAE; // Divide
        3'b110: Result = (SrcAE < SrcBE) ? 32'h1 : 32'h0; // Less than comparison
        default: Result = 32'h0; // Default case
    endcase
end

// Wire declarations for additional outputs
// wire Cout;
// wire [31:0] Sum;

// ALU operation assignment based on control bits
// assign Sum = (ALUControl[0] == 1'b0) ? A + B : (A + ((~B)+1));
// assign {Cout, Result} = (ALUControl == 3'b000) ? Sum :
//                          (ALUControl == 3'b001) ? Sum :
//                          (ALUControl == 3'b010) ? A & B :
//                          (ALUControl == 3'b011) ? A | B :
//                          (ALUControl == 3'b101) ? {{32{1'b0}}, (Sum[31])} :
//                          {33{1'b0}};
// assign OverFlow = ((Sum[31] ^ A[31]) & (~(ALUControl[0] ^ B[31] ^ A[31])) & (~ALUControl[1]));
// assign Carry = ((~ALUControl[1]) & Cout);
// assign Zero = &(~Result);
// assign Negative = Result[31];

endmodule
