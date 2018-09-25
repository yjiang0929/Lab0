// Adder circuit

`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input A, 
    input B, 
    input carryin
);
    wire AxorB;
    wire AxorBandC;
    wire AandB;

    `XOR AxorBgate(AxorB, A, B);
    `XOR AxorBxorCgate(sum, AxorB, carryin);
    `AND AandBgate(AandB,A,B);
    `AND AxorBandCgate(AxorBandC, AxorB, carryin);
    `OR  orgate(carryout, AxorBandC, AandB);

endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    wire carry1in;
    wire carry2in;
    wire carry3in;

    structuralFullAdder adder0(sum[0],carry1in,a[0],b[0],1'b0);
    structuralFullAdder adder1(sum[1],carry2in,a[1],b[1],carry1in);
    structuralFullAdder adder2(sum[2],carry3in,a[2],b[2],carry2in);
    structuralFullAdder adder3(sum[3],carryout,a[3],b[3],carry3in);

    `XOR overflowXor(overflow,carryout,sum[3]);
endmodule