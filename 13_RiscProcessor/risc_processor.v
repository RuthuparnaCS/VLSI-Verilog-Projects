module risc_processor(
    input clk,
    input reset,
    output reg halted
);

reg [7:0] pc;
reg [7:0] registers [0:7];
reg [15:0] instruction_memory [0:255];
reg [7:0] data_memory [0:255];

wire [15:0] instruction;
wire [3:0] opcode;
wire [2:0] rd;
wire [2:0] rs1;
wire [2:0] rs2;
wire [7:0] immediate;

assign instruction = instruction_memory[pc];
assign opcode = instruction[15:12];
assign rd = instruction[11:9];
assign rs1 = instruction[8:6];
assign rs2 = instruction[5:3];
assign immediate = instruction[7:0];

integer i;

always @(posedge clk) begin
    if (reset) begin
        pc <= 8'd0;
        halted <= 1'b0;

        for (i = 0; i < 8; i = i + 1)
            registers[i] <= 8'd0;
    end
    else if (!halted) begin

        case (opcode)

            4'b0000: begin
                registers[rd] <= registers[rs1] + registers[rs2];
                pc <= pc + 1;
            end

            4'b0001: begin
                registers[rd] <= registers[rs1] - registers[rs2];
                pc <= pc + 1;
            end

            4'b0010: begin
                registers[rd] <= registers[rs1] & registers[rs2];
                pc <= pc + 1;
            end

            4'b0011: begin
                registers[rd] <= registers[rs1] | registers[rs2];
                pc <= pc + 1;
            end

            4'b0100: begin
                registers[rd] <= registers[rs1] ^ registers[rs2];
                pc <= pc + 1;
            end

            4'b0101: begin
                registers[rd] <= immediate;
                pc <= pc + 1;
            end

            4'b0110: begin
                registers[rd] <= data_memory[immediate];
                pc <= pc + 1;
            end

            4'b0111: begin
                data_memory[immediate] <= registers[rd];
                pc <= pc + 1;
            end

            4'b1000: begin
                pc <= immediate;
            end

            4'b1001: begin
                if (registers[rs1] == registers[0])
                    pc <= pc + immediate;
                else
                    pc <= pc + 1;
            end

            4'b1010: begin
                pc <= pc + 1;
            end

            4'b1111: begin
                halted <= 1'b1;
            end

            default: begin
                pc <= pc + 1;
            end

        endcase
    end
end

endmodule