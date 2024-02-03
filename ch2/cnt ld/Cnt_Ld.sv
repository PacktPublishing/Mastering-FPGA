// Counter up with Load
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

//Library
`include "sv_stdlib.sv"

//Module declaration
module Cnt_Ld #(parameter int n = 4) (
    input logic Clk,
    input logic resetn,
    input logic en,
    input logic ld,
    input logic [n-1:0] D,
    output logic [n-1:0] q
);

	// Signals, Constants, Variables, Components

	//Architecture
	always_ff @(posedge Clk or negedge resetn) begin
		if (!resetn) begin
			q <= '0;
		end else if (Clk'event && Clk) begin
			if (en && !ld) begin
				q <= q + 1;
			end else if (en && ld) begin
				q <= D;
			end
		end
	end

//Process #n...
endmodule
