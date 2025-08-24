module half_adder (
    input A, B,
    output Sum, Carry
);
    assign Sum = A ^ B;     // XOR for sum
    assign Carry = A & B;   // AND for carry
endmodule




Added Half Adder RTL
