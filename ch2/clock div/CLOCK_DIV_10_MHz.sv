// Pseudorandom number generator
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

// Library
`include "sv_stdlib.sv"

// Module
module CLOCK_DIV_10_MHz (
    input logic CLOCK_10MHz,
    output logic CLOCK_1MHz,
    output logic CLOCK_100KHz,
    output logic CLOCK_10KHz,
    output logic CLOCK_1KHz,
    output logic CLOCK_100Hz,
    output logic CLOCK_10Hz,
    output logic CLOCK_1Hz
);

// Signals
logic [3:0] count_1Mhz;
logic [2:0] count_100Khz, count_10Khz, count_1Khz;
logic [2:0] count_100hz, count_10hz, count_1hz;
logic clock_1Mhz_int, clock_100Khz_int, clock_10Khz_int, clock_1Khz_int;
logic clock_100hz_int, clock_10hz_int, clock_1hz_int;

// Divide by 10 Process
always_ff @(posedge CLOCK_10MHz) begin
    if (count_1Mhz < 4'd9) begin
        count_1Mhz <= count_1Mhz + 1;
    end else begin
        count_1Mhz <= 4'b0000;
    end

    if (count_1Mhz < 4'd4) begin
        clock_1Mhz_int <= 1'b0;
    end else begin
        clock_1Mhz_int <= 1'b1;
    end

    // Ripple clocks are used in this code to save prescalar hardware
    // Sync all clock prescalar outputs back to the master clock signal
    CLOCK_1MHz <= clock_1Mhz_int;
    CLOCK_100KHz <= clock_100Khz_int;
    CLOCK_10KHz <= clock_10Khz_int;
    CLOCK_1KHz <= clock_1Khz_int;
    CLOCK_100Hz <= clock_100hz_int;
    CLOCK_10Hz <= clock_10hz_int;
    CLOCK_1Hz <= clock_1hz_int;
end

// Divide by 10 Processes
always_ff @(posedge clock_1Mhz_int) begin
    if (count_100Khz != 3'd4) begin
        count_100Khz <= count_100Khz + 1;
    end else begin
        count_100Khz <= 3'b000;
        clock_100Khz_int <= ~clock_100Khz_int;
    end
end

always_ff @(posedge clock_100Khz_int) begin
    if (count_10Khz != 3'd4) begin
        count_10Khz <= count_10Khz + 1;
    end else begin
        count_10Khz <= 3'b000;
        clock_10Khz_int <= ~clock_10Khz_int;
    end
end

always_ff @(posedge clock_10Khz_int) begin
    if (count_1Khz != 3'd4) begin
        count_1Khz <= count_1Khz + 1;
    end else begin
        count_1Khz <= 3'b000;
        clock_1Khz_int <= ~clock_1Khz_int;
    end
end

always_ff @(posedge clock_1Khz_int) begin
    if (count_100hz != 3'd4) begin
        count_100hz <= count_100hz + 1;
    end else begin
        count_100hz <= 3'b000;
        clock_100hz_int <= ~clock_100hz_int;
    end
end

always_ff @(posedge clock_100hz_int) begin
    if (count_10hz != 3'd4) begin
        count_10hz <= count_10hz + 1;
    end else begin
        count_10hz <= 3'b000;
        clock_10hz_int <= ~clock_10hz_int;
    end
end

always_ff @(posedge clock_10hz_int) begin
    if (count_1hz != 3'd4) begin
        count_1hz <= count_1hz + 1;
    end else begin
        count_1hz <= 3'b000;
        clock_1hz_int <= ~clock_1hz_int;
    end
end

endmodule
