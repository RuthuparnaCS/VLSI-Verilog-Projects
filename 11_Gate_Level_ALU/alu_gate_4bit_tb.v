`timescale 1ns / 1ps

module alu_gate_4bit_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg [1:0] sel;

    wire [3:0] result;
    wire carry;

    alu_gate_4bit DUT (
        .a(a),
        .b(b),
        .sel(sel),
        .result(result),
        .carry(carry)
    );

    initial begin

        $dumpfile("alu_gate_4bit.vcd");
        $dumpvars(0, alu_gate_4bit_tb);

        $monitor("Time=%0t | A=%b | B=%b | Sel=%b | Result=%b | Carry=%b",
                 $time, a, b, sel, result, carry);

        // AND: 1010 & 1100 = 1000
        a = 4'b1010;
        b = 4'b1100;
        sel = 2'b00;
        #10;

        // OR: 1010 | 1100 = 1110
        sel = 2'b01;
        #10;

        // ADD: 0101 + 0011 = 1000
        a = 4'b0101;
        b = 4'b0011;
        sel = 2'b10;
        #10;

        // ADD with carry: 1111 + 0001 = 1_0000
        a = 4'b1111;
        b = 4'b0001;
        sel = 2'b10;
        #10;

        // SUB: 0101 - 0011 = 0010
        a = 4'b0101;
        b = 4'b0011;
        sel = 2'b11;
        #10;

        // SUB negative: 0011 - 0101 = 1110 (-2)
        a = 4'b0011;
        b = 4'b0101;
        sel = 2'b11;
        #10;

        $finish;

    end

endmodule