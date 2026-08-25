`timescale 1ns / 1ps

module register_4bit_tb;

    reg clk;
    reg reset;
    reg load;
    reg [3:0] d;

    wire [3:0] q;

    register_4bit DUT (
        .clk(clk),
        .reset(reset),
        .load(load),
        .d(d),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("4_bit_register.vcd");
        $dumpvars(0, register_4bit_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | load=%b | d=%b | q=%b",
                 $time, clk, reset, load, d, q);

        clk = 0;
        reset = 1;
        load = 0;
        d = 4'b0000;

        #10;

        // Load 1010
        reset = 0;
        load = 1;
        d = 4'b1010;
        #10;

        // Load 0101
        d = 4'b0101;
        #10;

        // Hold previous value
        load = 0;
        d = 4'b1111;
        #10;

        // Load 1111
        load = 1;
        #10;

        // Reset
        reset = 1;
        load = 0;
        #10;

        $finish;

    end

endmodule