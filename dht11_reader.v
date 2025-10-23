`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2025 07:41:32 AM
// Design Name: 
// Module Name: dht11_reader
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module dht11_reader (
    input  wire        clk,         // clock
    input  wire        rst,         // active high reset
    input  wire [39:0] dht_frame,   // 40-bit frame

    output reg  [7:0]  hum_int,     // integer humidity
    output reg  [7:0]  hum_dec,     // decimal humidity
    output reg  [7:0]  temp_int,    // integer temperature
    output reg  [7:0]  temp_dec,    // decimal temperature
    output reg         valid        // checksum valid flag
);

    // Internal registers
    reg [7:0] checksum;
    reg [7:0] sum;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            hum_int   <= 8'd0;
            hum_dec   <= 8'd0;
            temp_int  <= 8'd0;
            temp_dec  <= 8'd0;
            checksum  <= 8'd0;
            valid     <= 1'b0;
        end 
        else begin
            // Extract bytes from 40-bit frame
            hum_int   <= dht_frame[39:32];
            hum_dec   <= dht_frame[31:24];
            temp_int  <= dht_frame[23:16];
            temp_dec  <= dht_frame[15:8];
            checksum  <= dht_frame[7:0];

            // Calculate checksum
            sum       <= dht_frame[39:32] + dht_frame[31:24] +
                         dht_frame[23:16] + dht_frame[15:8];

            // Update valid flag
            valid     <= (dht_frame[7:0] == 
                         (dht_frame[39:32] + dht_frame[31:24] +
                          dht_frame[23:16] + dht_frame[15:8]));
        end
    end

endmodule


