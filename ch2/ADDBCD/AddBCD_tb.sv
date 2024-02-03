// Testbench for AddBCD module
module tb_AddBCD;
// Signals
logic [3:0] A, B;
logic [3:0] D_expected, U_expected, D_actual, U_actual;

// Instantiate AddBCD module
AddBCD uut (
    .A(A),
    .B(B),
    .D(D_actual),
    .U(U_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    A = 4'b0010;
    B = 4'b0001;
    D_expected = 4'b0000;
    U_expected = 4'b0011;
    #10 if ((D_actual !== D_expected) || (U_actual !== U_expected)) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    A = 4'b1001;
    B = 4'b0110;
    D_expected = 4'b0001;
    U_expected = 4'b0101;
    #10 if ((D_actual !== D_expected) || (U_actual !== U_expected)) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    A = 4'b1010;
    B = 4'b1001;
    D_expected = 4'b0001;
    U_expected = 4'b1001;
    #10 if ((D_actual !== D_expected) || (U_actual !== U_expected)) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passed");
    $finish;
end
initial begin 
    $dumpfile("tb_AddBCD.vcd");
    $dumpvars(0, tb_AddBCD);
end 

endmodule
