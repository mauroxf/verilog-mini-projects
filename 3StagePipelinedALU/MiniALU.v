module MiniALU #(
    parameter ADD = 2'b00,
              SUB = 2'b01, 
              AND = 2'b10, 
              XOR = 2'b11
)(
    input [3:0] a,b,
    input [1:0] ctrl,
    input clk, rst,
    output reg [3:0] z,
    output reg zero
);

    // 1: Latch inputs
    reg [3:0] a_reg, b_reg, alu_result;
    reg [1:0] ctrl_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin // If rst = 1, registers are cleared
            a_reg <= 0; // Initialize registers 
            b_reg <= 0;
            ctrl_reg <= 0; // Use non-blocking b/c it's sequential
        end else begin // Only other option is rst = 0 
            a_reg <= a;
            b_reg <= b;
            ctrl_reg <= ctrl;
        end
    end

    // 2: Combinational logic 
    always @(*) begin
        case (ctrl_reg)
            ADD: alu_result = a_reg + b_reg;
            SUB: alu_result = a_reg - b_reg;
            AND: alu_result = a_reg & b_reg;
            XOR: alu_result = a_reg ^ b_reg;
            default: alu_result = 4'hF; //Invalid ctrl signal
        endcase
    end

    // 3. Latch output result and zero flag
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            z <= 0; // Non-blocking b/c sequential
            zero <= 0;
        end else begin
            z <= alu_result;
            zero <= (alu_result == 4'b0000) ? 1'b1 : 1'b0; // zero flag if alu_resul = 0
        end
    end

endmodule
