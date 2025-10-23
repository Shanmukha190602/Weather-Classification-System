`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2025 07:42:21 AM
// Design Name: 
// Module Name: weather_classification_system
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


module weather_classification_system (
    input  wire        clk,
    input  wire        rst,
    input  wire [39:0] dht_frame,    // 40-bit DHT11 data frame

    output wire [7:0]  hum_int,
    output wire [7:0]  hum_dec,
    output wire [7:0]  temp_int,
    output wire [7:0]  temp_dec,
    output wire valid,
    output wire [2:0]  class_out
);

    // Internal wires for reader outputs
    wire [7:0] hum_int_w;
    wire [7:0] hum_dec_w;
    wire [7:0] temp_int_w;
    wire [7:0] temp_dec_w;
    wire       valid_w;

    // --------------------------
    // Instantiate DHT11 Reader
    // --------------------------
    dht11_reader u_reader (
        .clk       (clk),
        .rst       (rst),
        .dht_frame (dht_frame),

        .hum_int   (hum_int_w),
        .hum_dec   (hum_dec_w),
        .temp_int  (temp_int_w),
        .temp_dec  (temp_dec_w),
        .valid     (valid_w)
    );

    // --------------------------
    // Convert outputs for classifier
    // DHT11 gives integer + decimal.
    // Classifier expects 16-bit integer *100 format
    // Example: 77.45% humidity ? 7745
    // --------------------------
    wire [15:0] humidity_scaled;
    wire [15:0] temp_scaled;

    assign humidity_scaled = (hum_int_w * 100) + hum_dec_w;
    assign temp_scaled     = (temp_int_w * 100) + temp_dec_w;

    // --------------------------
    // Instantiate Weather Classifier
    // --------------------------
    weather_classifier u_classifier (
        .clk      (clk),
        .rst      (rst),
        .humidity (humidity_scaled),
        .temp     (temp_scaled),
        .class_out(class_out)
    );

    // --------------------------
    // Pass-through signals to outputs
    // --------------------------
    assign hum_int  = hum_int_w;
    assign hum_dec  = hum_dec_w;
    assign temp_int = temp_int_w;
    assign temp_dec = temp_dec_w;
    assign valid    = valid_w;

endmodule

