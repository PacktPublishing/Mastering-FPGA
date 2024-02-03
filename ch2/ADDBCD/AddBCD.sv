// 2-number adder BCD
// Repository: 
// https://github.com/vasanza/SystemVerilog
// Read more: 
// https://vasanza.blogspot.com

// Module
module AddBCD (
    input logic [3:0] A, B,
    output logic [3:0] D, U // Tens, Units
);
    // Signals, Constants, Variables
    logic [7:0] temp, temp2;

    // Combinational logic for BCD addition
    always_comb begin
        temp = {4'h00, A} + {4'h00, B};
        temp2 = (temp > 9) ? (temp + 8'h06) : temp;
        D = temp2[7:4]; // Tens
        U = temp2[3:0]; // Units
    end

endmodule