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

    initial begin
    	$dumpfile("adder.vcd");
    	$dumpvars();
        $display("Four Bit Full Adder");
	    $display(" A   |  B   | Sum  | Carryout | Overflow");            // Prints header for truth table
	    a = 4'b0101; b = 4'b0010; #`DELAY                                 // Set A and B, wait for update (#1)
	    $display("%b | %b | %b |   %b      |    %b", a, b, sum, carryout, overflow);
	    
	    
    end
endmodule
