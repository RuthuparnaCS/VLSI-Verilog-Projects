`timescale 1ns / 1ps

module parameterized_register_tb;

    parameter WIDTH = 8;

    reg clk;
    reg reset;
    reg load;
    reg [WIDTH-1:0] d;

    wire [WIDTH-1:0] q;

    parameterized_register #(
        .WIDTH(WIDTH)
    ) DUT (
        .clk(clk),
        .reset(reset),
        .load(load),
        .d(d),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("parameterized_register.vcd");
        $dumpvars(0, parameterized_register_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | load=%b | d=%b | q=%b",
                 $time, clk, reset, load, d, q);

        clk = 0;
        reset = 1;
        load = 0;
        d = 8'b00000000;

        #10;

        // Load 8-bit value
        reset = 0;
        load = 1;
        d = 8'b10101010;
        #10;

        // Load another value
        d = 8'b11001100;
        #10;

        // Hold previous value
        load = 0;
        d = 8'b11111111;
        #10;

        // Load new value
        load = 1;
        #10;

        // Reset
        reset = 1;
        load = 0;
        #10;

        $finish;

    end

endmodule