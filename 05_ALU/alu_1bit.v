`timescale 1ns / 1ps

module alu_1bit(
    input  a,
    input  b,
    input cin,
    input [1:0] sel,
    output reg result,
    output reg cout
);

    always @(*) begin
        case (sel)

            2'b00: begin
                result = a & b;
                cout = 1'b0;
            end

            2'b01: begin
                result = a | b;
                cout = 1'b0;
            end

            2'b10: begin
                {cout, result} = a + b + cin;
            end

            2'b11: begin
                {cout, result} = a - b - cin;
            end

            default: begin
                result = 1'b0;
                cout = 1'b0;
            end

        endcase
    end

endmodule
