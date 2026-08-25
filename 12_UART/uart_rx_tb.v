`timescale 1ns / 1ps

module uart_rx_tb;

    reg clk;
    reg reset;
    reg rx;

    wire [7:0] rx_data;
    wire rx_valid;

    uart_rx #(
        .CLKS_PER_BIT(4)
    ) DUT (
        .clk(clk),
        .reset(reset),
        .rx(rx),
        .rx_data(rx_data),
        .rx_valid(rx_valid)
    );

    always #5 clk = ~clk;

    // Send one UART bit for 4 clock cycles
    task send_bit;
        input bit_value;
        begin
            rx = bit_value;
            #40;
        end
    endtask

    initial begin

        $dumpfile("uart_rx.vcd");
        $dumpvars(0, uart_rx_tb);

        $monitor("Time=%0t | CLK=%b | RX=%b | DATA=%b | VALID=%b",
                 $time, clk, rx, rx_data, rx_valid);

        clk = 0;
        reset = 1;
        rx = 1;

        #20;

        reset = 0;

        // Idle
        #20;

        // START bit
        send_bit(0);

        // 10101010 transmitted LSB first
        send_bit(0);  // bit 0
        send_bit(1);  // bit 1
        send_bit(0);  // bit 2
        send_bit(1);  // bit 3
        send_bit(0);  // bit 4
        send_bit(1);  // bit 5
        send_bit(0);  // bit 6
        send_bit(1);  // bit 7

        // STOP bit
        send_bit(1);

        // Idle
        rx = 1;
        #40;

        $finish;

    end

endmodule