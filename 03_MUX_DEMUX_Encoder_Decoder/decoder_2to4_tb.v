`timescale 1ns / 1ps

module decoder_2to4_tb;

    reg  [1:0] a;
    wire [3:0] y;

    decoder_2to4 DUT (
        .a(a),
        .y(y)
    );

    initial begin

        $dumpfile("decoder_2to4.vcd");
        $dumpvars(0, decoder_2to4_tb);

        $monitor("Time=%0t | a=%b | y=%b",
                 $time, a, y);

        // Test 1
        a = 2'b00;
        #10;

        // Test 2
        a = 2'b01;
        #10;

        // Test 3
        a = 2'b10;
        #10;

        // Test 4
        a = 2'b11;
        #10;

        $finish;

    end

endmodule