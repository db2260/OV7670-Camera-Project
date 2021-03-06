`timescale 1ns / 1ps


module SCCB_interface_tb;

    //inputs
    reg clk;
    reg start;
    reg [7:0] address;
    reg [7:0] data;
    
    //outputs
    wire ready;
    wire SIOC_oe;
    wire SIOD_oe;
    
    SCCB_interface
    #(.CLK_FREQ(800), .SCCB_FREQ(20))
    dut1
    (
    .clk(clk),
    .start(start),
    .address(address),
    .data(data),
    .ready(ready),
    .SIOC_oe(SIOC_oe),
    .SIOD_oe(SIOD_oe)
    );
    
    always #5 clk=~clk;
    
    initial begin
        clk = 0;
        start = 0;
        address = 0;
        data = 0;
        #100;
        address = 8'hAA;
        data = 8'h77;
        start = 1;
        #10;
        start = 0;
        address = 0;
        data = 0;
    end
    
endmodule