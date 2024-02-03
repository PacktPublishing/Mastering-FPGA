//Accum
// Repository: 
// https://github.com/vasanza/SystemVerilog
// Read more: 
// https://vasanza.blogspot.com

// Module
module Accum #(parameter int n=4) (
    // Inputs
    input logic Clk,  // Clock signal
    input logic Resetn,  // Active-low reset signal
    input logic En,  // Enable signal
    input logic [n-1:0] Data,  // Input data (n bits)
    
    // Outputs
    output logic [n-1:0] Q  // Accumulated result (n bits)a
);
    // Assignments
    // always_ff block triggered on positive clock edge or negative Resetn edge
    always_ff @(posedge Clk or negedge Resetn) begin
        if (~Resetn) begin
            // When Resetn is low, reset Q to 0
            Q <= '0;
        end else if (En) begin
            // When En is high, accumulate Data into Q
            Q <= Q + Data;
        end
    end
endmodule
