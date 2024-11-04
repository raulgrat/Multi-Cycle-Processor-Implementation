`timescale 1ns / 1ps

module RegisterTB();
    reg [4:0] ReadZero;
    reg [4:0] ReadOne;
    reg [4:0] write;
    reg EnableWrite;
    reg [31:0] DataWrite;
    wire [31:0] Read_Data_One;
    wire [31:0] Read_Data_Two;
    RegisterFile RegTest(.read_address_0(ReadZero), .read_address_1(ReadOne), .write_address_0(write), .write_en(EnableWrite), .write_data(DataWrite), .read_data_0(Read_Data_One), .read_data_1(Read_Data_Two));
    initial begin
        ReadZero <= 10;
        ReadOne <= 15;
        EnableWrite <= 0;
        #10
        EnableWrite <= 1; 
        write <= 17;
        DataWrite <= 420;
        #10
        write <= 18;
        DataWrite <= 670;
        #10
        EnableWrite <= 0;
        ReadZero <= 17;    
        ReadOne <= 18;     
    end
endmodule
