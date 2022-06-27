`timescale 1ns / 1ps


module camera_read_tb;

// inputs
reg p_clock;
reg vsync;
reg href;
reg [7:0] p_data;

//outputs
wire [15:0] pixel_data;
wire pixel_valid;
wire frame_done;

 camera_read camera_read_1 (
        .p_clock(p_clock),
        .vsync(vsync),
        .href(href),
        .p_data(p_data),
        .pixel_data(pixel_data),
        .pixel_valid(pixel_valid),
        .frame_done(frame_done)
    );
    
    always #5 p_clock = ~p_clock;
    
    initial begin
    
    p_clock = 0;
    vsync = 0;
    href = 0;
    p_data = 0;
    #5;
    #100;
    
    vsync = 1;
    #10;
    vsync = 0;
    #10;
    href = 1;
    p_data = 8'hFF;
    #10;
    p_data = 8'h0;
    #10;
    href = 0;
    #10;
    vsync = 0;
    
    
    end
    
    
endmodule
