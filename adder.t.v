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
  $display("%b | %b | %b |   %b      |    %b     |  0001   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0000; b = 4'b0001; #`DELAY                                 // Set A and B, wait for update (#1)
  $display("%b | %b | %b |   %b      |    %b     |  0001   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0100; b = 4'b0011; #`DELAY                                 // Set A and B, wait for update (#1)
  $display("%b | %b | %b |   %b      |    %b     |  0111   | 0            | 0", a, b, sum, carryout, overflow);
  a = 4'b0111; b = 4'b0111; #`DELAY                                 // Set A and B, wait for update (#1)
  $display("%b | %b | %b |   %b      |    %b     |  1110   | 0            | 1", a, b, sum, carryout, overflow);


  $display("\n\nFour Bit Full Adder negative + negative Tests");
  $display(" A   |  B   | Sum  | Carryout | Overflow | Sum Exp | Carryout Exp | Overflow Exp");            // Prints header for truth table
  a = 4'b1111; b = 4'b1111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1110   | 1            | 0", a, b, sum, carryout, overflow);
  a = 4'b1101; b = 4'b1101; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1010   | 1            | 0", a, b, sum, carryout, overflow);
  a = 4'b1001; b = 4'b1000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0001   | 1            | 1", a, b, sum, carryout, overflow);
  a = 4'b1011; b = 4'b1011; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0110   | 1            | 1", a, b, sum, carryout, overflow);

  $display("\n\nFour Bit Full Adder negative + positive Tests");
  $display(" A   |  B   | Sum  | Carryout | Overflow | Sum Exp | Carryout Exp | Overflow Exp");            // Prints header for truth table
  a = 4'b1001; b = 4'b0111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1000   | 1            | 1", a, b, sum, carryout, overflow);
  a = 4'b1000; b = 4'b0001; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1001   | 0            | 1", a, b, sum, carryout, overflow);
  a = 4'b1001; b = 4'b0000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1001   | 0            | 1", a, b, sum, carryout, overflow);
  a = 4'b1111; b = 4'b0111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0110   | 1            | 1", a, b, sum, carryout, overflow);


  $display("\n\nFour Bit Full Adder Overflow Tests");
  $display(" A   |  B   | Sum  | Carryout | Overflow | Sum Exp | Carryout Exp | Overflow Exp");            // Prints header for truth table
  a = 4'b1001; b = 4'b1111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1000   | 1            | 0", a, b, sum, carryout, overflow);
  a = 4'b1111; b = 4'b0111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0110   | 1            | 1", a, b, sum, carryout, overflow);
  a = 4'b1001; b = 4'b0000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1001   | 0            | 1", a, b, sum, carryout, overflow);
  a = 4'b0110; b = 4'b0001; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0111   | 0            | 0", a, b, sum, carryout, overflow);

  $display("\n\nFour Bit Full Adder Carryout Tests");
  $display(" A   |  B   | Sum  | Carryout | Overflow | Sum Exp | Carryout Exp | Overflow Exp");            // Prints header for truth table
  a = 4'b1001; b = 4'b1111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1000   | 1            | 0", a, b, sum, carryout, overflow);
  a = 4'b1111; b = 4'b0111; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0110   | 1            | 1", a, b, sum, carryout, overflow);
  a = 4'b0111; b = 4'b0001; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  1000   | 0            | 1", a, b, sum, carryout, overflow);
  a = 4'b0101; b = 4'b0000; #`DELAY
  $display("%b | %b | %b |   %b      |    %b     |  0101   | 0            | 0", a, b, sum, carryout, overflow);


end
//For hte 16 test cases, we want:
// two positive numbers added with and w/out overflow
// two negative numbers added with and w/out overflow
// A positive number added with and w/out overflow and Carryout
// There will always be overflow with positive and negative?



endmodule
