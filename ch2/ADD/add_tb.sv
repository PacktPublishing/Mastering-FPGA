// Testbench for Add module
module tb_Add;
// Parameters
localparam int n = 4;

// Signals
logic signed [n-1:0] X, Y;
logic signed [n:0] S_expected, S_actual;

// Instantiate Add module
Add #(n) uut (
    .X(X),
    .Y(Y),
    .S(S_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    X = 4; Y = 3;
    S_expected = X + Y;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    X = -2; Y = 5;
    S_expected = X + Y;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    X = 0; Y = 0;
    S_expected = X + Y;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passed");
    $finish;
end

initial begin
    $dumpfile("tb_Add.vcd");
    $dumpvars(0, tb_Add);
end

endmodule
