`timescale 1ns/1ps

module risc_processor_tb;

reg clk;
reg reset;
wire halted;

risc_processor uut(
    .clk(clk),
    .reset(reset),
    .halted(halted)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    uut.instruction_memory[0] = {4'b0101, 3'b001, 9'b000101001};
uut.instruction_memory[1] = {4'b0101, 3'b010, 9'b000000111};
uut.instruction_memory[2] = {4'b0000, 3'b011, 3'b001, 3'b010, 3'b000};
uut.instruction_memory[3] = {4'b0100, 3'b100, 3'b011, 3'b010, 3'b000};
uut.instruction_memory[4] = {4'b0011, 3'b101, 3'b011, 3'b100, 3'b000};
uut.instruction_memory[5] = {4'b0010, 3'b110, 3'b101, 3'b100, 3'b000};
uut.instruction_memory[6] = 16'b1111_0000_0000_0000;
    #10 reset = 0;

    #100;

    $display("R1 = %d", uut.registers[1]);
    $display("R2 = %d", uut.registers[2]);
    $display("R3 = %d", uut.registers[3]);
    $display("R4 = %d", uut.registers[4]);
    $display("R5 = %d", uut.registers[5]);
    $display("R6 = %d", uut.registers[6]);
    $display("HALTED = %b", halted);

    $finish;
end

initial begin
    $dumpfile("risc_processor.vcd");
    $dumpvars(0, risc_processor_tb);
end

endmodule