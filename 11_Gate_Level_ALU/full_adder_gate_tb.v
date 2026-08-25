`timescale 1ns / 1ps

module full_adder_gate_tb;

    reg a;
    reg b;
    reg cin;

    wire sum;
    wire cout;

    full_adder_gate DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        $dumpfile("full_adder_gate.vcd");
        $dumpvars(0, full_adder_gate_tb);

        $monitor("Time=%0t | A=%b | B=%b | Cin=%b | Sum=%b | Cout=%b",
                 $time, a, b, cin, sum, cout);

        // 000 -> 00
        a = 0; b = 0; cin = 0;
        #10;

        // 001 -> 01
        a = 0; b = 0; cin = 1;
        #10;

        // 010 -> 01
        a = 0; b = 1; cin = 0;
        #10;

        // 011 -> 10
        a = 0; b = 1; cin = 1;
        #10;

        // 100 -> 01
        a = 1; b = 0; cin = 0;
        #10;

        // 101 -> 10
        a = 1; b = 0; cin = 1;
        #10;

        // 110 -> 10
        a = 1; b = 1; cin = 0;
        #10;

        // 111 -> 11
        a = 1; b = 1; cin = 1;
        #10;

        $finish;

    end

endmodule