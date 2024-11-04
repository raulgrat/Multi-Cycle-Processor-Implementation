`timescale 1ns / 1ps


module Decoder(
    input [31:0] inst, 
    output [2:0] opcode,
    output [4:0] reg_addr_0,
    output [4:0] reg_addr_1,
    output [4:0] reg_addr_2,
    output [14:0] addr
    );
    
 
    assign opcode = inst[31:29];
    assign addr = inst[14:0];
    assign reg_addr_0 = inst[28:24];
    assign reg_addr_1 = inst[23:19];
    assign reg_addr_2 = inst[18:14];
    
endmodule
