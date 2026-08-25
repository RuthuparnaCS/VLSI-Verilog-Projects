`timescale 1ns / 1ps

module sram_6t(
    input  clk,
    input  wl,
    input  bl,
    input  blb,
    output reg q,
    output reg qb
);

    initial begin
        q  = 1'b0;
        qb = 1'b1;
    end

    always @(posedge clk) begin

        // Write operation
        if (wl) begin

            if (bl == 1'b1 && blb == 1'b0) begin
                q  <= 1'b1;
                qb <= 1'b0;
            end

            else if (bl == 1'b0 && blb == 1'b1) begin
                q  <= 1'b0;
                qb <= 1'b1;
            end

        end

        // When WL = 0, the cell holds its previous state.
    end

endmodule