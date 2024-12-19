`timescale 1ns / 1ps

module reg_fl(clk,rst,WE3,WD3,A1,A2,A3,RD1,RD2);

    input clk,rst,WE3;
    input [4:0]A1,A2,A3;
    input [31:0]WD3;
    output [31:0]RD1,RD2;

    reg [31:0] Register [31:0];

    always @ (posedge clk)
    begin
        if(WE3 & (A3 != 5'h00))
            Register[A3] <= WD3;
    end

    assign RD1 = (rst==1'b0) ? 32'd0 : Register[A1];
    assign RD2 = (rst==1'b0) ? 32'd0 : Register[A2];

    initial begin
        Register[1] = 32'h00000000;
        Register[2] = 32'h00000004;
        Register[3] = 32'h00000000;
        Register[4] = 32'h00000004;
        Register[5] = 32'h00000001;
        Register[6] = 32'h00000000;
        Register[7] = 32'h00000004;
        Register[8] = 32'h00000002;
        Register[9] = 32'h00000004;
        Register[10] = 32'h000F0000;
    end

endmodule