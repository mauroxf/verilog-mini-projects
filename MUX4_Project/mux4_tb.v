module mux4_tb;

  reg [31:0] in0, in1, in2, in3;
  reg [1:0] sel;
  wire [31:0] out;

  // Instantiate the DUT 
  mux4 uut (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .sel(sel),
    .out(out)
  );

  initial begin
    
    $monitor("sel=%b | in0=%h in1=%h in2=%h in3=%h | out=%h", sel, in0, in1, in2, in3, out);

    // Initialize inputs
    in0 = 32'hAAAA0000;
    in1 = 32'hBBBB0000;
    in2 = 32'hCCCC0000;
    in3 = 32'hDDDD0000;

    // Test all select lines
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;

    $finish;
  end

endmodule
