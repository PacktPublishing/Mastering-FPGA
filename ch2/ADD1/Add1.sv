// Adder 1 of number of n bits
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

// Module declaration
module Add1 #(parameter int n = 8) (
    input logic [n-1:0] X,
    output logic [n:0] S
);
    // Signals, Constants, Variables, Components
    always_comb begin
        S = '0 + {1'b0, X} + 1'b1; // with sign bit
    end
endmodule