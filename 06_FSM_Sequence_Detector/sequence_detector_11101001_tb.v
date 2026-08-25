`timescale 1ns / 1ps

module sequence_detector_11101001_tb;

    reg clk;
    reg reset;
    reg x;

    wire z;

    sequence_detector_11101001 DUT (
        .clk(clk),
        .reset(reset),
        .x(x),
        .z(z)
    );

    always #5 clk = ~clk;

    task send_bit(input reg bit_value);
        begin
            x = bit_value;
            #10;
        end
    endtask

    initial begin

        $dumpfile("sequence_detector_11101001.vcd");
        $dumpvars(0, sequence_detector_11101001_tb);

        $monitor("Time=%0t | clk=%b | reset=%b | x=%b | z=%b",
                 $time, clk, reset, x, z);

        clk = 0;
        reset = 1;
        x = 0;

        #10;
        reset = 0;

        // Input stream: 00111010011101001
        send_bit(0);
        send_bit(0);
        send_bit(1);
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(0);
        send_bit(1);

        // First 11101001 completed here

        send_bit(1);
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(0);
        send_bit(1);

        // Second 11101001 completed here

        $finish;

    end

endmodule