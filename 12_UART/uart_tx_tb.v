`timescale 1ns / 1ps

module uart_tx_tb;

    reg clk;
    reg reset;
    reg tx_start;
    reg [7:0] tx_data;

    wire tx;
    wire busy;

    uart_tx #(
        .CLKS_PER_BIT(4)
    ) DUT (
        .clk(clk),
        .reset(reset),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .busy(busy)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("uart_tx.vcd");
        $dumpvars(0, uart_tx_tb);

        $monitor("Time=%0t | CLK=%b | START=%b | DATA=%b | TX=%b | BUSY=%b",
                 $time, clk, tx_start, tx_data, tx, busy);

        clk = 0;
        reset = 1;
        tx_start = 0;
        tx_data = 8'b10101010;

        #10;

        // Release reset
        reset = 0;

        // Start transmission
        tx_start = 1;
        #10;

        // Start pulse ends
        tx_start = 0;

        // Wait for complete UART frame
        #400;

        $finish;

    end

endmodule