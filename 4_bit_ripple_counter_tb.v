`timescale 1ns / 1ps

module ripple_counter_4bit_tb;

    reg clk;
    reg reset;

    wire [3:0] q;

    ripple_counter_4bit DUT (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // External clock
    always #5 clk = ~clk;

    initial begin

        $dumpfile("4_bit_ripple_counter.vcd");
        $dumpvars(0, ripple_counter_4bit_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | q=%b",
                 $time, clk, reset, q);

        clk = 0;
        reset = 1;

        #10;

        reset = 0;

        // Allow counter to run
        #160;

        $finish;

    end

endmodule