`timescale 1ns / 1ps

module DecoderTB();
    reg [31:0] Instruc;
    wire [2:0] opcode;
    wire [4:0] RegisterZero;
    wire [4:0] RegisterOne;
    wire [4:0] RegisterTwo;
    wire [14:0] addr;
    Decoder decoding(.inst(Instruc), .opcode(opcode), .reg_addr_0(RegisterZero), .reg_addr_1(RegisterOne), .reg_addr_2(RegisterTwo), .addr(addr));
    initial begin
    
        Instruc <= 32'h4108_0007;
        #20
        Instruc <= 32'he208_E000;
        #20
        Instruc <= 32'h6118_0006;

    end
endmodule
