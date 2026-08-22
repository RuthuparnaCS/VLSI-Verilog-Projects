`timescale 1ns / 1ps

module encoder_4to2_tb;

    reg  [3:0] d;
    wire [1:0] y;

    encoder_4to2 DUT (
        .d(d),
        .y(y)
    );

    initial begin

        $dumpfile("encoder_4to2.vcd");
        $dumpvars(0, encoder_4to2_tb);

        $monitor("Time=%0t | d=%b | y=%b",
                 $time, d, y);

        // Test 1: d0 active
        d = 4'b0001;
        #10;

        // Test 2: d1 active
        d = 4'b0010;
        #10;

        // Test 3: d2 active
        d = 4'b0100;
        #10;

        // Test 4: d3 active
        d = 4'b1000;
        #10;

        $finish;

    end

endmodule