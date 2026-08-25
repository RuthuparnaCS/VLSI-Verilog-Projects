`timescale 1ns / 1ps

module cmos_nor(
    input  a,
    input  b,
    output y
);

    supply1 VDD;
    supply0 GND;

    wire n1;

    // PMOS pull-up network: series
    pmos p1(n1, VDD, a);
    pmos p2(y, n1, b);

    // NMOS pull-down network: parallel
    nmos n1_inst(y, GND, a);
    nmos n2_inst(y, GND, b);

endmodule