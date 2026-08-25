`timescale 1ns / 1ps

module uart_tx #(
    parameter CLKS_PER_BIT = 4
)(
    input        clk,
    input        reset,
    input        tx_start,
    input  [7:0] tx_data,
    output reg   tx,
    output reg   busy
);

    reg [2:0] bit_index;
    reg [7:0] data_reg;
    reg [2:0] state;
    reg [15:0] clk_count;

    localparam IDLE  = 3'd0;
    localparam START = 3'd1;
    localparam DATA  = 3'd2;
    localparam STOP  = 3'd3;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            tx        <= 1'b1;
            busy      <= 1'b0;
            bit_index <= 3'd0;
            data_reg  <= 8'd0;
            clk_count <= 16'd0;
            state     <= IDLE;
        end

        else begin

            case (state)

                IDLE: begin
                    tx        <= 1'b1;
                    busy      <= 1'b0;
                    clk_count <= 16'd0;
                    bit_index <= 3'd0;

                    if (tx_start) begin
                        data_reg <= tx_data;
                        busy     <= 1'b1;
                        state    <= START;
                    end
                end

                START: begin
                    tx <= 1'b0;

                    if (clk_count == CLKS_PER_BIT-1) begin
                        clk_count <= 16'd0;
                        state     <= DATA;
                    end
                    else begin
                        clk_count <= clk_count + 1'b1;
                    end
                end

                DATA: begin
                    tx <= data_reg[bit_index];

                    if (clk_count == CLKS_PER_BIT-1) begin
                        clk_count <= 16'd0;

                        if (bit_index == 3'd7) begin
                            bit_index <= 3'd0;
                            state     <= STOP;
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
                    tx <= 1'b1;

                    if (clk_count == CLKS_PER_BIT-1) begin
                        clk_count <= 16'd0;
                        busy      <= 1'b0;
                        state     <= IDLE;
                    end
                    else begin
                        clk_count <= clk_count + 1'b1;
                    end
                end

                default: begin
                    tx    <= 1'b1;
                    busy  <= 1'b0;
                    state <= IDLE;
                end

            endcase

        end

    end

endmodule