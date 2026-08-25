`timescale 1ns / 1ps

module ripple_adder_gate_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;

    wire [3:0] sum;
    wire       cout;

    ripple_adder_gate DUT (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        $dumpfile("ripple_adder_gate.vcd");
        $dumpvars(0, ripple_adder_gate_tb);

        $monitor("Time=%0t | A=%b | B=%b | Cin=%b | Sum=%b | Cout=%b",
                 $time, a, b, cin, sum, cout);

        // 5 + 3 = 8
        a = 4'b0101;
        b = 4'b0011;
        cin = 0;
        #10;

        // 15 + 1 = 16
        a = 4'b1111;
        b = 4'b0001;
        cin = 0;
        #10;

        // 7 + 8 = 15
        a = 4'b0111;
        b = 4'b1000;
        cin = 0;
        #10;

        // 10 + 5 + 1 = 16
        a = 4'b1010;
        b = 4'b0101;
        cin = 1;
        #10;

        // 0 + 0 + 0 = 0
        a = 4'b0000;
        b = 4'b0000;
        cin = 0;
        #10;

        $finish;

    end

endmodule