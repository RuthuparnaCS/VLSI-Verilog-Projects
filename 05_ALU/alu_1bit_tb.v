`timescale 1ns / 1ps

module alu_1bit_tb;

    reg a;
    reg b;
    reg cin;
    reg [1:0] sel;

    wire result;
    wire cout;

    alu_1bit DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .sel(sel),
        .result(result),
        .cout(cout)
    );

    initial begin

        $dumpfile("alu_1bit.vcd");
        $dumpvars(0, alu_1bit_tb);

        $monitor("Time=%0t | A=%b | B=%b | Cin=%b | Sel=%b | Result=%b | Cout=%b",
                 $time, a, b, cin, sel, result, cout);

        // AND
        sel = 2'b00;
        a = 1;
        b = 1;
        cin = 0;
        #10;

        // OR
        sel = 2'b01;
        a = 1;
        b = 0;
        cin = 0;
        #10;

        // ADD: 1 + 1 + 0 = 10
        sel = 2'b10;
        a = 1;
        b = 1;
        cin = 0;
        #10;

        // ADD: 1 + 1 + 1 = 11
        cin = 1;
        #10;

        // SUB: 1 - 0 - 0 = 1
        sel = 2'b11;
        a = 1;
        b = 0;
        cin = 0;
        #10;

        // SUB: 0 - 1 - 0
        a = 0;
        b = 1;
        cin = 0;
        #10;

        $finish;

    end

endmodule