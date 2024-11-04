`timescale 1ns / 1ps

module MemoryTB();
    reg [15:0] inst_address;
    wire [31:0] instruct;
    wire [14:0] data_address;
    reg EnableWrite;
    wire [31:0] read_data;
    InstructionMemory IMTest(.inst_address(inst_address), .read_data(instruct));
    wire [2:0] opcode;
    wire [4:0] reg_addr_0;
    wire [4:0] reg_addr_1;
    wire [4:0] reg_addr_2;
    Decoder decoding(.inst(instruct), .opcode(opcode), .reg_addr_0(reg_addr_0), .reg_addr_1(reg_addr_1), .reg_addr_2(reg_addr_2), .addr(data_address));
    reg [4:0] write_address_0;
    reg TempWrite;
    reg [31:0] TempData;
    wire [31:0] TempRead;
    RegisterFile RFing(.read_address_0(reg_addr_0), .read_address_1(reg_addr_1), .write_address_0(write_address_0), .write_en(TempWrite), .write_data(TempData), .read_data_0(read_data), .read_data_1(TempRead));
    wire [31:0] Out;
    DataMemory DMTest(.data_address(data_address), .write_en(EnableWrite), .write_data(read_data),.write_address_0(data_address) ,.read_data(Out));
    initial begin
        EnableWrite <= 1;
        TempWrite <= 0;
        inst_address <= 5; 
        #10
        EnableWrite <= 0;
        inst_address <= 1; 
    end
endmodule
