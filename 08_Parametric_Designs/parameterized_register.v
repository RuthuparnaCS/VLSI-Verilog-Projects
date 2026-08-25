`timescale 1ns / 1ps

module parameterized_register #(
    parameter WIDTH = 8
)(
    input                  clk,
    input                  reset,
    input                  load,
    input  [WIDTH-1:0]     d,
    output reg [WIDTH-1:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= {WIDTH{1'b0}};
        else if (load)
            q <= d;
    end

endmodule