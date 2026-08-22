\# 4-Bit Ripple Carry Adder



\## Overview



A 4-bit Ripple Carry Adder adds two 4-bit binary numbers along with an input carry.



The design is built using four 1-bit Full Adders connected in series.



\## Inputs



\- `a\[3:0]` - First 4-bit input

\- `b\[3:0]` - Second 4-bit input

\- `cin` - Input carry



\## Outputs



\- `sum\[3:0]` - 4-bit sum

\- `cout` - Final carry output



\## Working



Each Full Adder adds one bit of the two input numbers along with the carry from the previous stage.



```text

&#x20;       ┌─────────┐

a\[0] ──►│         │

b\[0] ──►│   FA0   │──► sum\[0]

cin ───►│         │

&#x20;       └────┬────┘

&#x20;            │ c1

&#x20;            ▼

&#x20;       ┌─────────┐

a\[1] ──►│   FA1   │──► sum\[1]

b\[1] ──►│         │

&#x20;       └────┬────┘

&#x20;            │ c2

&#x20;            ▼

&#x20;       ┌─────────┐

a\[2] ──►│   FA2   │──► sum\[2]

b\[2] ──►│         │

&#x20;       └────┬────┘

&#x20;            │ c3

&#x20;            ▼

&#x20;       ┌─────────┐

a\[3] ──►│   FA3   │──► sum\[3]

b\[3] ──►│         │

&#x20;       └────┬────┘

&#x20;            │

&#x20;           cout

The carry propagates from the least significant bit to the most significant bit. This propagation gives the circuit its name: Ripple Carry Adder.



Implementation



The design uses four instances of the previously implemented full\_adder module.



Example:

1111 + 0001 = 1 0000



Therefore:



sum  = 0000

cout = 1

