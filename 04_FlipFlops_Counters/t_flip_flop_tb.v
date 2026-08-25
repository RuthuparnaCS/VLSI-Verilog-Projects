`timescale 1ns / 1ps

module t_flip_flop_tb;

    reg clk;
    reg reset;
    reg t;

    wire q;

    t_flip_flop DUT (
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("t_flip_flop.vcd");
        $dumpvars(0, t_flip_flop_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | T=%b | Q=%b",
                 $time, clk, reset, t, q);

        clk = 0;
        reset = 1;
        t = 0;

        #10;

        reset = 0;

        // T = 0 → Hold
        t = 0;
        #10;

        // T = 1 → Toggle
        t = 1;
        #10;

        // T = 1 → Toggle again
        t = 1;
        #10;

        // T = 0 → Hold
        t = 0;
        #10;

        // T = 1 → Toggle
        t = 1;
        #10;

        $finish;

    end

endmodule
