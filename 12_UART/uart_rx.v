`timescale 1ns / 1ps

module uart_rx #(
    parameter CLKS_PER_BIT = 4
)(
    input        clk,
    input        reset,
    input        rx,
    output reg [7:0] rx_data,
    output reg   rx_valid
);

    reg [2:0] bit_index;
    reg [15:0] clk_count;
    reg [2:0] state;

    localparam IDLE  = 3'd0;
    localparam START = 3'd1;
    localparam DATA  = 3'd2;
    localparam STOP  = 3'd3;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            rx_data  <= 8'd0;
            rx_valid <= 1'b0;
            bit_index <= 3'd0;
            clk_count <= 16'd0;
            state <= IDLE;
        end

        else begin

            rx_valid <= 1'b0;

            case (state)

                IDLE: begin
                    clk_count <= 16'd0;
                    bit_index <= 3'd0;

                    if (rx == 1'b0)
                        state <= START;
                end

                START: begin
                    if (clk_count == (CLKS_PER_BIT/2)-1) begin
                        clk_count <= 16'd0;

                        if (rx == 1'b0)
                            state <= DATA;
                        else
                            state <= IDLE;
                    end
                    else begin
                        clk_count <= clk_count + 1'b1;
                    end
                end

                DATA: begin
                    if (clk_count == CLKS_PER_BIT-1) begin
                        clk_count <= 16'd0;

                        rx_data[bit_index] <= rx;

                        if (bit_index == 3'd7) begin
                            bit_index <= 3'd0;
                            state <= STOP;
                        end
                        else begin
                            bit_index <= bit_index + 1'b1;
                        end
                    end
                    else begin
                        clk_count <= clk_count + 1'b1;
                    end
                end

                STOP: begin
                    if (clk_count == CLKS_PER_BIT-1) begin
                        clk_count <= 16'd0;
                        rx_valid <= 1'b1;
                        state <= IDLE;
                    end
                    else begin
                        clk_count <= clk_count + 1'b1;
                    end
                end

                default: begin
                    state <= IDLE;
                end

            endcase

        end

    end

endmodule