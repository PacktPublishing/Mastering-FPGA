// Add
// Adder of 2 numbers of n bits
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

// Module declaration
module Add #(parameter int n=4) (
    input logic signed [n-1:0] X, Y,
    output logic signed [n:0] S
);
    // Signals, Constants, Variables, Components
    
    // Logic for adding inputs X and Y
    always_comb begin
        S = X + Y;
    end

endmodule