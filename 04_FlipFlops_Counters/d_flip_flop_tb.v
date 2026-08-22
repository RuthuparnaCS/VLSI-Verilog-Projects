`timescale 1ns / 1ps

module d_flip_flop_tb;

    reg clk;
    reg reset;
    reg d;

    wire q;

    d_flip_flop DUT (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        $dumpfile("d_flip_flop.vcd");
        $dumpvars(0, d_flip_flop_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | d=%b | q=%b",
                 $time, clk, reset, d, q);

        clk = 0;
        reset = 1;
        d = 0;

        #10;

        reset = 0;
        d = 1;

        #10;

        d = 0;

        #10;

        d = 1;

        #10;

        reset = 1;

        #10;

        reset = 0;
        d = 0;

        #10;

        $finish;

    end

endmodule