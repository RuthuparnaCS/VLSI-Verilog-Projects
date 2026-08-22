`timescale 1ns / 1ps

module jk_flip_flop_tb;

    reg clk;
    reg reset;
    reg j;
    reg k;

    wire q;

    jk_flip_flop DUT (
        .clk(clk),
        .reset(reset),
        .j(j),
        .k(k),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("jk_flip_flop.vcd");
        $dumpvars(0, jk_flip_flop_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | J=%b | K=%b | Q=%b",
                 $time, clk, reset, j, k, q);

        clk = 0;
        reset = 1;
        j = 0;
        k = 0;

        #10;

        reset = 0;

        // 00 → Hold
        j = 0;
        k = 0;
        #10;

        // 10 → Set
        j = 1;
        k = 0;
        #10;

        // 00 → Hold
        j = 0;
        k = 0;
        #10;

        // 01 → Reset
        j = 0;
        k = 1;
        #10;

        // 11 → Toggle
        j = 1;
        k = 1;
        #10;

        // 11 → Toggle again
        j = 1;
        k = 1;
        #10;

        $finish;

    end

endmodule