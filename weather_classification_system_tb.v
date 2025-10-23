`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2025 07:42:51 AM
// Design Name: 
// Module Name: weather_classification_system_tb
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


module weather_classification_system_tb();

    // DUT ports
    reg clk;
    reg rst;
    reg [39:0] dht_frame;

    wire [7:0] hum_int;
    wire [7:0] hum_dec;
    wire [7:0] temp_int;
    wire [7:0] temp_dec;
    wire       valid;
    wire [2:0] class_out;

    // Instantiate DUT
    weather_classification_system uut (
        .clk(clk),
        .rst(rst),
        .dht_frame(dht_frame),
        .hum_int(hum_int),
        .hum_dec(hum_dec),
        .temp_int(temp_int),
        .temp_dec(temp_dec),
        .valid(valid),
        .class_out(class_out)
    );

    // Clock generator: 100 MHz (10 ns period)
    always #15 clk = ~clk;

    // Task to apply a valid frame
    task apply_valid_frame;
        input [7:0] h_int;
        input [7:0] h_dec;
        input [7:0] t_int;
        input [7:0] t_dec;
        reg   [7:0] checksum;
        begin
            checksum  = h_int + h_dec + t_int + t_dec;
            dht_frame = {h_int, h_dec, t_int, t_dec, checksum};
            @(posedge clk);
        end
    endtask

    initial begin
        // Init signals
        clk = 0;
        rst = 1;
        dht_frame = 0;

        // Reset pulse
        #20 rst = 0;

        // ------------------------------------------------
        // Test case 1: 45.00%, 20.00 C
        @(posedge clk); #5; apply_valid_frame(8'd45, 8'd0, 8'd20, 8'd0);
        $display("Humidity=%0d.%0d%% Temp=%0d.%0dC Valid=%b Class=%0d",
                 hum_int, hum_dec, temp_int, temp_dec, valid, class_out);

        // ------------------------------------------------
        // Test case 2: 47.00%, 27.00 C
       @(posedge clk); #5; apply_valid_frame(8'd47, 8'd0, 8'd27, 8'd0);
        #20;
        $display("Humidity=%0d.%0d%% Temp=%0d.%0dC Valid=%b Class=%0d",
                 hum_int, hum_dec, temp_int, temp_dec, valid, class_out);

        // ------------------------------------------------
        // Test case 3: 81.70%, 25.24 C
       @(posedge clk); #5; apply_valid_frame(8'd81, 8'd7, 8'd25, 8'd24);
        #20;
        $display("Humidity=%0d.%0d%% Temp=%0d.%0dC Valid=%b Class=%0d",
                 hum_int, hum_dec, temp_int, temp_dec, valid, class_out);

        // ------------------------------------------------
        // Test case 4: 87.49%, 20.21 C
       @(posedge clk); #5; apply_valid_frame(8'd87, 8'd49, 8'd20, 8'd21);
        #20;
        $display("Humidity=%0d.%0d%% Temp=%0d.%0dC Valid=%b Class=%0d",
                 hum_int, hum_dec, temp_int, temp_dec, valid, class_out);

        // ------------------------------------------------
        $display("=== Simulation complete ===");
    end

endmodule
