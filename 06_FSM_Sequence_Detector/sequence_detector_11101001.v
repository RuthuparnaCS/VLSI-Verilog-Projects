`timescale 1ns / 1ps

module sequence_detector_11101001(
    input  clk,
    input  reset,
    input  x,
    output reg z
);

    reg [3:0] state, next_state;

    localparam S0    = 4'd0;
    localparam S1    = 4'd1;
    localparam S11   = 4'd2;
    localparam S111  = 4'd3;
    localparam S1110 = 4'd4;
    localparam S11101 = 4'd5;
    localparam S111010 = 4'd6;
    localparam S1110100 = 4'd7;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin

        next_state = S0;
        z = 1'b0;

        case (state)

            S0: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (x)
                    next_state = S11;
                else
                    next_state = S0;
            end

            S11: begin
                if (x)
                    next_state = S111;
                else
                    next_state = S0;
            end

            S111: begin
                if (x)
                    next_state = S111;
                else
                    next_state = S1110;
            end

            S1110: begin
                if (x)
                    next_state = S11101;
                else
                    next_state = S0;
            end

            S11101: begin
                if (x)
                    next_state = S0;
                else
                    next_state = S111010;
            end

            S111010: begin
                if (x)
                    next_state = S0;
                else
                    next_state = S1110100;
            end

            S1110100: begin
                if (x) begin
                    next_state = S1;
                    z = 1'b1;
                end
                else begin
                    next_state = S0;
                end
            end

            default: begin
                next_state = S0;
                z = 1'b0;
            end

        endcase

    end

endmodule
