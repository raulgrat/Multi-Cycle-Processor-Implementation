`timescale 1ns / 1ps

/*
ALU Module

Performs arithmetic operations for add,
sub, and, or operations. Also performs 
comparison operation for beq, blt.
*/

module ALU(
    input wire [31:0] ip_0,
    input wire [31:0] ip_1,
    input wire [2:0] opcode,
    output wire [31:0] op_0,
    output wire change_pc
    );
    
    // Use assign statement to perform add, sub,
    // and, or operations on ip_0 and ip_1 based 
    // on the instruction/opcode
    
//    assign op_0 = 
    assign op_0 = (opcode == 4) ? (ip_0 + ip_1):(
                  (opcode == 5) ? (ip_0 - ip_1):(
                  (opcode == 6) ? (ip_0 & ip_1):(
                  (opcode == 7) ? (ip_0 | ip_1):0)));
    
    
    // Change_pc is required for the branch operations for 
    // the two control instructions. If ip_0 and ip_1 are equal 
    //  when the instruction is "beq" or ip_0 < ip_1 when 
    // instruction is "blt", the change_pc goes high 
    
    assign change_pc = opcode == 3'b010 ? (ip_0 == ip_1):(
                        opcode == 3'b011 ? (ip_0 < ip_1) : 0);
    
    
endmodule
