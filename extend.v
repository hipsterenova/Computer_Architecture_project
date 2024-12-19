`timescale 1ns / 1ps
module extend (In,ImmSrc,Imm_Ext);
    input [31:0] In;
    input [1:0] ImmSrc;
    output [31:0] Imm_Ext;

    assign Imm_Ext =  (ImmSrc == 2'b00) ? {{16{In[15]}},In[15:0]} : 
                        (ImmSrc == 2'b01) ? {{6{In[25]}},In[25:0]} : 
                      In; 

endmodule
