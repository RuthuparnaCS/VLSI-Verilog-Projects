`timescale 1ns / 1ps

module t_ff(
    input clk,
    input reset,
    input t,
    output reg q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else if (t)
            q <= ~q;
    end

endmodule


module ripple_counter_4bit(
    input clk,
    input reset,
    output [3:0] q
);

    wire q0, q1, q2;

    t_ff ff0 (
        .clk(clk),
        .reset(reset),
        .t(1'b1),
        .q(q0)
    );

    t_ff ff1 (
        .clk(~q0),
        .reset(reset),
        .t(1'b1),
        .q(q1)
    );

    t_ff ff2 (
        .clk(~q1),
        .reset(reset),
        .t(1'b1),
        .q(q2)
    );

    t_ff ff3 (
        .clk(~q2),
        .reset(reset),
        .t(1'b1),
        .q(q[3])
    );

    assign q[0] = q0;
    assign q[1] = q1;
    assign q[2] = q2;

endmodule