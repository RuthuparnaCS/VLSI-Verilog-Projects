\# 2:1 Multiplexer (MUX)



\## Overview



A 2:1 Multiplexer is a combinational circuit that selects one of two input signals and connects the selected input to a single output.



Boolean Expression

y = (\~s \& i0) | (s \& i1)



The selection is controlled by a select signal.



\## Inputs



\- `i0` - Input 0

\- `i1` - Input 1

\- `s` - Select signal



\## Output



\- `y` - MUX output



\## Working



The select signal determines which input is connected to the output:



```text

s = 0 → y = i0

s = 1 → y = i1



Design



The 2:1 MUX was implemented using Verilog HDL with a continuous assignment.



Verification



The design was verified using a Verilog testbench with different combinations of:



Input i0

Input i1

Select signal s



The simulation was performed using Icarus Verilog, and the resulting waveform was verified using GTKWave.



All test cases produced the expected output.



Example



For:



i0 = 1

i1 = 0

s  = 0



The output is:



y = 1



When:



s = 1



the output follows i1.

