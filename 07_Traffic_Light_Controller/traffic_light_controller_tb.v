`timescale 1ns / 1ps

module traffic_light_controller_tb;

    reg clk;
    reg reset;

    wire red;
    wire yellow;
    wire green;

    traffic_light_controller DUT (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("traffic_light_controller.vcd");
        $dumpvars(0, traffic_light_controller_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | RED=%b | YELLOW=%b | GREEN=%b",
                 $time, clk, reset, red, yellow, green);

        clk = 0;
        reset = 1;

        #10;

        reset = 0;

        // RED → GREEN → YELLOW → RED...
        #40;

        $finish;

    end

endmodule