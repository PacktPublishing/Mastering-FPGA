// Parameterized Queue in SystemVerilog with For Generate
// Repository: https://github.com/vasanza/SystemVerilog
// Read more: https://vasanza.blogspot.com

// Module: ParamQueue_fg
// Description: This module implements a parameterized queue in SystemVerilog
//              using For Generate construct. It allows generating a queue
//              of different sizes based on the provided depth parameter.
//              It supports enqueue and dequeue operations.

module ParamQueue_fg #(int WIDTH = 8, int DEPTH = 16)
                 (input logic clk,
                  input logic rst,
                  input logic [WIDTH-1:0] data_in,
                  input logic enqueue,
                  input logic dequeue,
                  output logic [WIDTH-1:0] data_out,
                  output logic full,
                  output logic empty);

    // Parameters:
    // - WIDTH: Data width of the queue elements (default is 8 bits).
    // - DEPTH: Depth or size of the queue (default is 16 elements).

    // Internal data structure for the queue
    logic [WIDTH-1:0] queue [DEPTH-1:0];
    int front = 0;
    int rear = 0;
    logic queue_full;
    logic queue_empty;

    // For Generate loop to instantiate the queue
    generate
        genvar i;
        for (i = 0; i < DEPTH; i = i + 1) begin : queue_instances
            always_ff @(posedge clk or posedge rst) begin
                if (rst) begin
                    front <= 0;
                    rear <= 0;
                    queue_full <= 0;
                    queue_empty <= 1;
                end else if (enqueue && !queue_full) begin
                    queue[i] <= data_in;
                    rear <= (rear == DEPTH-1) ? 0 : (rear + 1);
                    queue_empty <= 0;
                    queue_full <= (front == rear);
                end
            end

            always_ff @(posedge clk or posedge rst) begin
                if (rst) begin
                    front <= 0;
                    rear <= 0;
                    queue_full <= 0;
                    queue_empty <= 1;
                end else if (dequeue && !queue_empty) begin
                    data_out <= queue[front];
                    front <= (front == DEPTH-1) ? 0 : (front + 1);
                    queue_full <= 0;
                    queue_empty <= (front == rear);
                end
            end
        end
    endgenerate

    // Output signals
    assign full = queue_full;
    assign empty = queue_empty;

endmodule