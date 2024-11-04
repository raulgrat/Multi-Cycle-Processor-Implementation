`timescale 1ns / 1ps

module  DataMemory(
    input [14:0] data_address,
    input write_en,
    input [31:0] write_data,
    input [14:0] write_address_0,
    output [31:0] read_data
    );
    integer i;
    reg [31:0] ram [255:0];
    
    initial begin
        for(i = 0; i < 256; i = i + 1) begin
            ram[i] = i;
        end
    end
    
    assign read_data = ram[data_address];
    
    always @* begin
        if(write_en) begin
            ram[write_address_0] = write_data;
        end
    end
    
endmodule
