`timescale 1ns / 1ps

module cmos_inverter_tb;

    reg a;
    wire y;

    cmos_inverter DUT (
        .a(a),
        .y(y)
    );

    initial begin

        $dumpfile("cmos_inverter.vcd");
        $dumpvars(0, cmos_inverter_tb);

        $monitor("Time=%0t | A=%b | Y=%b",
                 $time, a, y);

        // Input LOW → Output HIGH
        a = 1'b0;
        #10;

        // Input HIGH → Output LOW
        a = 1'b1;
        #10;

        // Input LOW → Output HIGH
        a = 1'b0;
        #10;

        $finish;

    end

endmodule