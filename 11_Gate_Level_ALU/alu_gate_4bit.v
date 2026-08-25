`timescale 1ns / 1ps

module alu_gate_4bit(
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] sel,
    output [3:0] result,
    output       carry
);

    wire [3:0] and_result;
    wire [3:0] or_result;
    wire [3:0] add_result;
    wire       add_cout;

    wire [3:0] b_invert;
    wire [3:0] sub_result;
    wire       sub_cout;

    // Logic operations
    and (and_result[0], a[0], b[0]);
    and (and_result[1], a[1], b[1]);
    and (and_result[2], a[2], b[2]);
    and (and_result[3], a[3], b[3]);

    or (or_result[0], a[0], b[0]);
    or (or_result[1], a[1], b[1]);
    or (or_result[2], a[2], b[2]);
    or (or_result[3], a[3], b[3]);

    // Addition
    ripple_adder_gate ADDER (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(add_result),
        .cout(add_cout)
    );

    // Two's-complement subtraction:
    // A - B = A + (~B) + 1

    xor (b_invert[0], b[0], 1'b1);
    xor (b_invert[1], b[1], 1'b1);
    xor (b_invert[2], b[2], 1'b1);
    xor (b_invert[3], b[3], 1'b1);

    ripple_adder_gate SUBTRACTOR (
        .a(a),
        .b(b_invert),
        .cin(1'b1),
        .sum(sub_result),
        .cout(sub_cout)
    );

    // 4-to-1 selection using conditional logic
    assign result =
        (sel == 2'b00) ? and_result :
        (sel == 2'b01) ? or_result  :
        (sel == 2'b10) ? add_result :
                         sub_result;

    assign carry =
        (sel == 2'b10) ? add_cout :
        (sel == 2'b11) ? sub_cout :
                         1'b0;

endmodule