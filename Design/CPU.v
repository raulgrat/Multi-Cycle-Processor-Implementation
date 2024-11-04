`timescale 1ns / 1ps


module CPU(
    input clk
    );
    
     
    reg [15:0]  pc_q = 0;      
    reg [31:0]  instruction_q; 
    reg [1:0]   state_q = 0;   
    

    wire [31:0] read_data;
    InstructionMemory IM(.inst_address(pc_q), .read_data(read_data));
    reg [31:0] instruct;
    wire [2:0] opcode;
    wire [4:0] reg0;
    wire [4:0] reg1;
    wire [4:0] reg2;
    wire [14:0] addr;
    Decoder decoder(.inst(instruct), .opcode(opcode), .reg_addr_0(reg0), .reg_addr_1(reg1), .reg_addr_2(reg2), .addr(addr));
    reg [31:0] wdata;
    wire [31:0] rdata1;
    wire [31:0] rdata2;
    reg we;
    RegisterFile RF(.read_address_0(reg0), .read_address_1(reg1), .write_address_0(reg2), .write_en(we), .write_data(wdata), .read_data_0(rdata1), .read_data_1(rdata2));
    wire change_pc;
    reg [2:0] op_code_clone;
    reg [31:0] op1;
    reg [31:0] op2;
    wire [31:0] ALUres;
    ALU A(.ip_0(op1), .ip_1(op2), .opcode(op_code_clone), .op_0(ALUres), .change_pc(change_pc));
    reg [31:0] write_data;
    wire [31:0] read_data2;
    reg wedata;
    reg [14:0] writeadd;
    DataMemory DM(.data_address(addr), .write_en(wedata), .write_data(write_data), .write_address_0(writeadd),.read_data(read_data2));
    
    always@(posedge clk)
    begin
        if(state_q == 0) begin 
            we <= 0;
            wedata <= 0;
            instruction_q <= read_data;
            pc_q <= pc_q + 1;
            state_q <= 1;
        end else if(state_q == 1) begin     
            instruct <= instruction_q;
            state_q <= 2; 
        end else if(state_q == 2) begin     
            // Perform ALU operations
            if(opcode > 1) begin
                op1 <= rdata1;
                op2 <= rdata2;
                op_code_clone <= opcode;
            end
            else begin
                op_code_clone <= opcode;
                op1 <= 0;
                op2 <= 0;
                we <= 0;              
            end
            state_q <= 3; //update state
        end else if(state_q == 3) begin  // Memory Stage
            // Access Memory and register file(for load)
            we <= 0;
            if(opcode < 2) begin
                if(opcode == 1) begin
                    wedata <= 1;
                    write_data <= rdata1;
                    writeadd <= addr;
                end
                else if(opcode == 0) begin
                    wdata <= read_data2;
                    we <= 1;
                end
            end
            if(opcode > 3) begin
                    we <= 1;
                    wdata <= ALUres;
                end
                if(opcode < 4) begin
                    pc_q <= (change_pc == 1) ? addr : pc_q;
                end
            state_q <= 0;
        end    
    end
    
endmodule
