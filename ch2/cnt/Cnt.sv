// Counter up
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

module Cnt #(parameter integer n = 4) (
    input logic Clk,
    input logic resetn,
    input logic en,
    output logic [n-1:0] q
);

    // Signals, Constants, Variables, Components

    // Process #1
    always_ff @(posedge Clk or negedge resetn) begin
        if (!resetn) begin
            q <= '0;
        end else if (Clk) begin
            if (en) begin
                q <= q + 1;
            end
        end
    end

    // Process #n...
endmodule