/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2

    a 1-bit full adder
*/
module fullAdder_1b(A, B, C_in, S, C_out);
    input  A, B;
    input  C_in;
    output S;
    output C_out;

    wire AnorB, BnorC, AnorC;

    // Sum logic
    xor3 SumXor(.in1(A),.in2(B),.in3(C_in),.out(S));
    // Carry logic
    nor2 CAB(.in1(A),.in2(B),.out(AnorB));
    nor2 CBC(.in1(B),.in2(C_in),.out(BnorC));
    nor2 CAC(.in1(A),.in2(C_in),.out(AnorC));
    nor3 CarryOut(.in1(AnorB), .in2(BnorC), .in3(AnorC), .out(C_out));

endmodule
