`timescale 1ns / 1ps

module register_4bit(
    input clk,
    input reset,
    input load,
    input [3:0] d,
    output reg [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else if (load)
            q <= d;
    end

endmodule