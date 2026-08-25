`timescale 1ns / 1ps

module sram_6t_tb;

    reg clk;
    reg wl;
    reg bl;
    reg blb;

    wire q;
    wire qb;

    sram_6t DUT (
        .clk(clk),
        .wl(wl),
        .bl(bl),
        .blb(blb),
        .q(q),
        .qb(qb)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("sram_6t.vcd");
        $dumpvars(0, sram_6t_tb);

        $monitor("Time=%0t | CLK=%b | WL=%b | BL=%b | BLB=%b | Q=%b | QB=%b",
                 $time, clk, wl, bl, blb, q, qb);

        clk = 0;
        wl  = 0;
        bl  = 0;
        blb = 1;

        // Initial state
        #10;

        // WRITE 1
        wl  = 1;
        bl  = 1;
        blb = 0;
        #10;

        // HOLD
        wl  = 0;
        bl  = 0;
        blb = 1;
        #10;

        // WRITE 0
        wl  = 1;
        bl  = 0;
        blb = 1;
        #10;

        // HOLD
        wl  = 0;
        bl  = 1;
        blb = 0;
        #10;

        $finish;

    end

endmodule