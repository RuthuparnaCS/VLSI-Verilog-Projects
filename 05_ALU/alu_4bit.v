`timescale 1ns / 1ps

module alu_4bit(
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] sel,
    output reg [3:0] result,
    output reg carry
);

    reg [4:0] temp;

    always @(*) begin

        result = 4'b0000;
        carry = 1'b0;
        temp = 5'b00000;

        case (sel)

            // AND
            2'b00: begin
                result = a & b;
            end

            // OR
            2'b01: begin
                result = a | b;
            end

            // ADD
            2'b10: begin
                temp = a + b;
                result = temp[3:0];
                carry = temp[4];
            end

            // SUBTRACT
            2'b11: begin
                temp = {1'b0, a} + {1'b0, ~b} + 5'b00001;
                result = temp[3:0];
                carry = temp[4];
            end

        endcase

    end

endmodule