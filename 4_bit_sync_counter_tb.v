`timescale 1ns / 1ps

module sync_counter_4bit_tb;

    reg clk;
    reg reset;

    wire [3:0] q;

    sync_counter_4bit DUT (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("4_bit_sync_counter.vcd");
        $dumpvars(0, sync_counter_4bit_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | q=%b",
                 $time, clk, reset, q);

        clk = 0;
        reset = 1;

        #10;

        reset = 0;

        #160;

        $finish;

    end

endmodule