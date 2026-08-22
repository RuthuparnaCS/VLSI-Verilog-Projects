`timescale 1ns / 1ps

module demux_1to2_tb;

    reg d;
    reg s;

    wire y0;
    wire y1;

    demux_1to2 DUT (
        .d(d),
        .s(s),
        .y0(y0),
        .y1(y1)
    );

    initial begin

        $dumpfile("demux_1to2.vcd");
        $dumpvars(0, demux_1to2_tb);

        $monitor("Time=%0t | d=%b | s=%b | y0=%b | y1=%b",
                 $time, d, s, y0, y1);

        // Test 1
        d = 0;
        s = 0;
        #10;

        // Test 2
        d = 1;
        s = 0;
        #10;

        // Test 3
        d = 0;
        s = 1;
        #10;

        // Test 4
        d = 1;
        s = 1;
        #10;

        $finish;

    end

endmodule