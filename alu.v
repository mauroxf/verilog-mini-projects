module alu(
    input [31:0] a, b,
    input [3:0] op_code,
    output reg [31:0] result
);

always @(*) begin
    case (op_code)
    4'b0000: result = a + b;
    4'b0001: result = a - b;
    4'b0010: result = a & b;
    4'b0011: result = a | b;
    4'b0100: result = a ^ b;
    4'b0101: result = ~a;
    4'b0110: result = a << b;
    4'b0111: result = a >> b;
    default: result = 32'hDEADBEEF;
    endcase

end

endmodule

