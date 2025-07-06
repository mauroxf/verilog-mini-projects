`timescale 1ns / 1ps

module alu_tb;

  reg [31:0] a, b;
  reg [3:0] op_code;

  wire [31:0] result;

  alu uut (
    .a(a),
    .b(b),
    .op_code(op_code),
    .result(result)
  );

  initial begin
    $display("Time\tOpcode\t\tA\t\tB\t\tResult");
    $monitor("%0dns\t%b\t%h\t%h\t%h", $time, op_code, a, b, result);

    // Test case 1: ADD
    a = 32'h0000000A;
    b = 32'h00000005;
    op_code = 4'b0000; 
    #10;

    // Test case 2: SUB
    op_code = 4'b0001; 
    #10;

    // Test case 3: AND
    op_code = 4'b0010; 
    #10;

    // Test case 4: OR
    op_code = 4'b0011; 
    #10;

    // Test case 5: XOR
    op_code = 4'b0100;
    #10;

    // Test case 6: NOT
    op_code = 4'b0101; 
    #10;

    // Test case 7: SHIFT LEFT
    op_code = 4'b0110; 
    #10;

    // Test case 8: SHIFT RIGHT
    op_code = 4'b0111; 
    #10;

    $finish;
  end
endmodule

