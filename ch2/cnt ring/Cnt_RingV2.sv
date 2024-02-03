// Ring Counter version 2 of n bits
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

//Library
`include "sv_stdlib.sv"

//Module declaration
module Cnt_RingV2 (
    input logic Clk,
    input logic resetn,
    input logic en,
    output logic [3:0] q
);

// Signals, Constants, Variables, Components
// ...

//Architecture
always_ff @(posedge Clk or negedge resetn) begin
    if (!resetn) begin
        q <= 4'b0000;
    end else if (posedge Clk) begin
        if (en) begin
            case (q)
                4'b0000: q <= 4'b1000;
                4'b1000: q <= 4'b0100;
                4'b0100: q <= 4'b0010;
                4'b0010: q <= 4'b0001;
                default: q <= 4'b0000;
            endcase
        end
    end
end

//Process #n...
endmodule

