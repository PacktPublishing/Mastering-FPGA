//ALU
// Repository: 
// https://github.com/vasanza/SystemVerilog
// Read more: 
// https://vasanza.blogspot.com

// Library
`include "sv_stdlib.sv"
	
// Module
module ALU #(parameter int n = 8) (
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    input logic [2:0] sel,
    input logic en,
    output logic [n:0] Q
);
    // Signals
    logic [n-1:0] X;

    // Assignments
    always_comb begin
        if (en) begin
            case (sel)
                3'b000: X = A + B;
                3'b001: X = A - B;
                3'b010: X = A * B;
                3'b011: X = A / B;
                3'b100: X = A & B;
                3'b101: X = A | B;
                3'b110: X = A ^ B;
                3'b111: X = A ~| B;
                default: X = 0;
            endcase
        end else begin
            X = 0;
        end
    end

    // Output assignment
    assign Q = en ? X : 0;
endmodule
