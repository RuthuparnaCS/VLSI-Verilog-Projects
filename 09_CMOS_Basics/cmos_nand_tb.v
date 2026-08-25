`timescale 1ns / 1ps

module cmos_nand_tb;

    reg a;
    reg b;
    wire y;

    cmos_nand DUT (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin

        $dumpfile("cmos_nand.vcd");
        $dumpvars(0, cmos_nand_tb);

        $monitor("Time=%0t | A=%b | B=%b | Y=%b",
                 $time, a, b, y);

        // 00 → 1
        a = 0;
        b = 0;
        #10;

        // 01 → 1
        a = 0;
        b = 1;
        #10;

        // 10 → 1
        a = 1;
        b = 0;
        #10;

        // 11 → 0
        a = 1;
        b = 1;
        #10;

        $finish;

    end

endmodule