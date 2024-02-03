// Subtractor of two numbers of n bits (A - B)
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

// Library
`include "sv_stdlib.sv" // Assuming a SystemVerilog library with standard definitions

// Module
module AsubtractB #(parameter int n = 4)(
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [n:0] S
);

// Architecture
    always_comb begin
        S = ('0, A) - ('0, B); // Without the sign bit
        // S = '0, (A + B); // With sign bit
    end

endmodule
