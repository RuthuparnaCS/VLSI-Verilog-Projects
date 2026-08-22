`timescale 1ns / 1ps

module mux_2to1_tb;

    reg i0;
    reg i1;
    reg s;

    wire y;

    mux_2to1 DUT (
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y)
    );

    initial begin
	$dumpfile("mux_2to1.vcd");
	$dumpvars(0, mux_2to1_tb);

        $monitor("Time=%0t | i0=%b | i1=%b | s=%b | y=%b",
                 $time, i0, i1, s, y);

        // Test 1
        i0 = 0;
        i1 = 0;
        s  = 0;
        #10;

        // Test 2
        i0 = 1;
        i1 = 0;
        s  = 0;
        #10;

        // Test 3
        i0 = 0;
        i1 = 1;
        s  = 0;
        #10;

        // Test 4
        i0 = 1;
        i1 = 0;
        s  = 1;
        #10;

        // Test 5
        i0 = 0;
        i1 = 1;
        s  = 1;
        #10;

        // Test 6
        i0 = 1;
        i1 = 1;
        s  = 1;
        #10;

        $finish;

    end

endmodule