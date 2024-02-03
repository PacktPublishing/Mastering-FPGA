// Adder of 4 numbers of n bits
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

module Add4 #(parameter int n = 4) (
    input logic [n-1:0] A, B, C, D,
    output logic [n+1:0] S
);
    // Signals, Constants, Variables, Components
    always_comb begin
        S = {2'b00, A} + {2'b00, B} + {2'b00, C} + {2'b00, D};
        // Without the sign bit
    end
endmodule