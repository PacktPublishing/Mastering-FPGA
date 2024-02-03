// Testbench for Add1 module
module tb_Add1;
// Parameters
localparam int n = 8;

// Signals
logic [n-1:0] X;
logic [n:0] S_expected, S_actual;

// Instantiate Add1 module
Add1 #(n) uut (
    .X(X),
    .S(S_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    X = 8'b01101110;
    S_expected = X + 1;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    X = 8'b11111111;
    S_expected = X + 1;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    X = 8'b00000000;
    S_expected = X + 1;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passes ");

    $finish;
end

initial begin
    $dumpfile("tb_Add1.vcd");
    $dumpvars(0, tb_Add1);
end 
endmodule
