// Three-state buffer
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

module Buffer_3s #(int n = 4)(
    input logic [n-1:0] ent,
    input logic en,
    output logic [n-1:0] sal
);
    // Signals, Constants, Variables, Components
    assign sal = (en == 0) ? 'Z : ent;
endmodule
