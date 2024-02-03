module tb_accum;
    // Parameters
    localparam int n = 6;
    
    // Inputs
    logic clk;
    logic resetn;
    logic en;
    logic [n-1:0] data;
    
    // Outputs
    logic [n-1:0] q;
    
    // Instantiate Accum module
    Accum #(n) uut (
        .Clk(clk),
        .Resetn(resetn),
        .En(en),
        .Data(data),
        .Q(q)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Initial stimulus
    initial begin
        resetn = 0;
        en = 0;
        data = 4'b0000;
        
        #10 resetn = 1;
        #5 en = 1;
        data = 4'b0010; // Input data
        #10;
        data = 4'b0100; // Input data
        #10;
        data = 4'b0111; // Input data
        #10;
        en = 0;
        
        // Add more test cases as needed
        
        #10 $finish;
    end
    
    // Export signals for GTKWave
    initial begin
        $dumpfile("tb_accum.vcd");
        $dumpvars(0, tb_accum);
        #100 $finish;
    end
endmodule
