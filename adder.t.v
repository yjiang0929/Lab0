// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"
`define DELAY 5000

module testFullAdder();
    reg[3:0] a;
    reg[3:0] b;
    wire[3:0] sum;
    wire overflow, carryout;

    FullAdder4bit adder(sum, carryout, overflow, a, b);
// We can add -8 through +7
initial begin
  $dumpfile("adder.vcd");
  $dumpvars();
  $display("Four Bit Full Adder positive + positive Tests");
  $display(" A   |  B   | Sum  | Carryout | Overflow | Sum Exp | Carryout Exp | Overflow Exp");            // Prints header for truth table
  a = 4'b0000; b = 4'b0000; #`DELAY                                 // Set A and B, wait for update (#1)
$display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0001; b = 4'b0000; #`DELAY                                 // Set A and B, wait for update (#1)
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0000; b = 4'b0001; #`DELAY                                 // Set A and B, wait for update (#1)
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0001; b = 4'b0001; #`DELAY                                 // Set A and B, wait for update (#1)
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0010; b = 4'b0010; #`DELAY                                 // Set A and B, wait for update (#1)
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0100; b = 4'b0011; #`DELAY                                 // Set A and B, wait for update (#1)
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);

  $display("\n\nFour Bit Full Adder negative + negative Tests");
  $display(" A   |  B   | Sum  | Carryout | Overflow");
  a = 4'b1000; b = 4'b1000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b1000; b = 4'b1001; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b1001; b = 4'b1000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b1011; b = 4'b1011; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);

  $display("Four Bit Full Adder negative + positive Tests");
  $display(" A   |  B   | Sum  | Carryout | Overflow");
  a = 4'b1000; b = 4'b0000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b1000; b = 4'b0001; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b1001; b = 4'b0000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b1111; b = 4'b0111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);


  $display("Four Bit Full Adder Overflow Tests");
  $display(" A   |  B   | Sum  | Carryout | Overflow");
  a = 4'b1001; b = 4'b1111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0111; b = 4'b0001; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b1001; b = 4'b0000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b1111; b = 4'b0111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0000   | 0            | 0", a, b, sum, carryout, overflow);


end


endmodule
