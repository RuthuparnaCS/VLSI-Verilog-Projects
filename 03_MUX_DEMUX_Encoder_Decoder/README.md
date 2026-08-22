# MUX / DEMUX / Encoder / Decoder

This folder contains basic combinational logic designs implemented in Verilog HDL.

## Completed Designs

### 1. 2:1 Multiplexer

A 2:1 MUX selects one of two inputs based on a select signal.

```text
s = 0 → y = i0
s = 1 → y = i1

2. 1:2 Demultiplexer

A 1:2 DEMUX routes a single input to one of two outputs based on the select signal.

s = 0 → y0 = d, y1 = 0
s = 1 → y0 = 0, y1 = d