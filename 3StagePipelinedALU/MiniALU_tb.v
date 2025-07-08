`timescale 1ns/1ps

module MiniALU_tb;

    reg [3:0] a, b;
    reg [1:0] ctrl;
    reg clk, rst;
    wire [3:0] z;
    wire zero;

    MiniALU uut (
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .clk(clk),
        .rst(rst),
        .z(z),
        .zero(zero)
    );

    initial begin
        // Initial values
        clk = 0;
        rst = 1;
        a = 0; b = 0; ctrl = 2'b00;
        #5 rst = 0;

        // Test case 1: ADD 2 + 3
        a = 4'd2; b = 4'd3; ctrl = 2'b00;
        #10 clk = 1; #10 clk = 0;

        // Test case 2: SUB 7 - 5
        a = 4'd7; b = 4'd5; ctrl = 2'b01;
        #10 clk = 1; #10 clk = 0;

        // Test case 3: AND 6 & 3
        a = 4'd6; b = 4'd3; ctrl = 2'b10;
        #10 clk = 1; #10 clk = 0;

        // Test case 4: XOR 9 ^ 5
        a = 4'd9; b = 4'd5; ctrl = 2'b11;
        #10 clk = 1; #10 clk = 0;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | a=%d b=%d ctrl=%b => z=%b zero=%b",
                 $time, a, b, ctrl, z, zero);
        $dumpfile("wave.vcd"); // For wave view
        $dumpvars(0, MiniALU_tb);
    end

endmodule
