`timescale 1ns / 1ps

module sync_counter_4bit(
    input clk,
    input reset,
    output reg [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= q + 1'b1;
    end

endmodule