module decoder2to4_tb;

  reg [1:0] in;
  reg en;
  wire [3:0] out;

  decoder2to4 uut (
    .in(in),
    .en(en),
    .out(out)
  );

  initial begin
    
    $monitor("en=%b | in=%b | out=%b", en, in, out);

    // Enable off (should always be 0000)
    en = 0; in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;

    // Enable on (should decode input)
    en = 1; in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;

    $finish;
  end
  
endmodule
