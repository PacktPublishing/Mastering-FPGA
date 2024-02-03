//N-bit single and gate
// Repository: 
// https://github.com/vasanza/SystemVerilog
// Read more: 
// https://vasanza.blogspot.com

// Module
module Gate_and #(parameter n = 1) (
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [n-1:0] F
);
    // Output assignment
    assign F = A & B;
endmodule
