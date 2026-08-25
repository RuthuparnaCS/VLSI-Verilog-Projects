`timescale 1ns / 1ps

module cmos_inverter(
    input  a,
    output y
);

    supply1 VDD;
    supply0 GND;

    // PMOS pull-up network
    pmos p1(y, VDD, a);

    // NMOS pull-down network
    nmos n1(y, GND, a);

endmodule