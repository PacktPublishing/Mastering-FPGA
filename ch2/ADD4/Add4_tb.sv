// Testbench for Add4 module
module tb_Add4;
// Parameters
localparam int n = 4;

// Signals
logic [n-1:0] A, B, C, D;
logic [n+1:0] S_expected, S_actual;

// Instantiate Add4 module
Add4 #(n) uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .S(S_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    A = 4'b0101;
    B = 4'b0010;
    C = 4'b1100;
    D = 4'b1111;
    S_expected = A + B + C + D;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    A = 4'b1111;
    B = 4'b1111;
    C = 4'b1111;
    D = 4'b1111;
    S_expected = A + B + C + D;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    A = 4'b0000;
    B = 4'b0000;
    C = 4'b0000;
    D = 4'b0000;
    S_expected = A + B + C + D;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passed");
    $finish;
end

initial begin 
    $dumpfile("tb_Add4.vcd");
    $dumpvars(0, tb_Add4);
end 
endmodule
