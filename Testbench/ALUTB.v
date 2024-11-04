`timescale 1ns / 1ps

module ALUTB();
    reg [31:0] operandOne;
    reg [31:0] operandTwo;
    reg [2:0] opcode;
    wire [31:0] output_reg;
    wire ChangeThis;
    ALU test(.ip_0(operandOne), .ip_1(operandTwo), .opcode(opcode), .op_0(output_reg), .change_pc(ChangeThis));
    initial begin
        operandOne <= 10;
        operandTwo <= 619;
        opcode <= 4;    
        #5
        operandOne <= 55;
        operandTwo <= 3;
        opcode <= 5;    
        #5
        operandOne <= 9;
        operandTwo <= 20;
        opcode <= 6; 
        #5
        operandOne <= 0;
        operandTwo <= 21;
        opcode <= 7; 
        #5  
        operandOne <= 5;
        operandTwo <= 5; 
        opcode <= 2; 
        #5
        operandOne <= 9;
        #5
        opcode <= 3; 
        operandOne <= 8;
        operandTwo <= 235;
        #5
        operandOne <= 200;
        end
endmodule
