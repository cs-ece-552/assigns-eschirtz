/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    2-1 mux template
*/
module mux2_1(InA, InB, S, Out);
    input   InA, InB;
    input   S;
    output  Out;

    wire S_n, As, Bs;

    not1 notSelect(.in1(S), .out(S_n));
    nand2 nandA(.in1(InA), .in2(S_n), .out(As));
    nand2 nandB(.in1(InB), .in2(S), .out(Bs));
    nand2 nandOut(.in1(As), .in2(Bs), .out(Out));
    
endmodule
