`timescale 1ns / 1ps
/*
Instruction Module

A 2-d register array with one read port
*/


module  InstructionMemory(
    input [15:0] inst_address,
    output [31:0] read_data
    );
    reg [31:0] ram [255:0];
        // Initialize Instructions in the memory for testing
    initial begin
        ram[0] <= 32'h2000_0004; // Store: Reg[0] -> Mem[4]
        ram[1] <= 32'h0000_0008; // LW: Reg[0] = 8
        ram[2] <= 32'h8000_8000; // Add: Reg[1] = Reg[0] + Reg[0] = 16
        ram[3] <= 32'h4108_0005; // BEQ: Branch to inst. 5 if Reg[1] == Reg[1]
        ram[4] <= 32'hc30a_0000; // AND: Reg[4] = Reg[3] AND Reg[1] = 16 AND 8 = 0
        ram[5] <= 32'h4120_0008; // BEQ: Branch to inst. 8 if Reg[1] == Reg[4]
        ram[6] <= 32'ha101_8000; // Sub: Reg[2] = Reg[1] - Reg[0] = 8
        ram[7] <= 32'he208_c001; // OR: Reg[3] = Reg[2] OR Reg[1] = 8 OR 16 = 24
        ram[8] <= 32'h6119_0003; // BLT: Branch to inst. 3 if Reg[1] < Reg[3]
        ram[9] <= 32'h2300_0008; // Store: Reg[3] -> Mem[8] = 24
    end
    
    
    
    // Assign statement to read ram based on inst_address
    assign read_data = ram[inst_address];
endmodule
