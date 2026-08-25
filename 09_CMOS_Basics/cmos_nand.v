`timescale 1ns / 1ps

module cmos_nand(
    input  a,
    input  b,
    output y
);

    supply1 VDD;
    supply0 GND;

    wire n1;

    // PMOS pull-up network: parallel
    pmos p1(y, VDD, a);
    pmos p2(y, VDD, b);

    // NMOS pull-down network: series
    nmos n1_inst(n1, GND, b);
    nmos n2_inst(y, n1, a);

endmodule