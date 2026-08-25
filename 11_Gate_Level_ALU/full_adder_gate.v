`timescale 1ns / 1ps

module full_adder_gate(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire x1;
    wire a1;
    wire a2;

    xor (x1, a, b);
    xor (sum, x1, cin);

    and (a1, a, b);
    and (a2, x1, cin);

    or (cout, a1, a2);

endmodule