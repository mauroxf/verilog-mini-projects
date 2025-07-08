`timescale 1ns/1ps

module fsm_tb;

  reg clock; // In testbench inputs are made reg
  wire [2:0] light;

  // Instantiate the FSM
  fsm dut (
    .clock(clock),
    .light(light)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // clock period forever
  end

  // Monitor output
  initial begin
    $display("Time\tState (light)"); // Initial display
    $monitor("%0t\t%b", $time, light);
    $dumpfile("wave.vcd"); // For wave view
    $dumpvars(0, fsm_tb);
  end

  // Run the simulation
  initial begin
    #100 $finish; // Run for 100ns
  end

endmodule
