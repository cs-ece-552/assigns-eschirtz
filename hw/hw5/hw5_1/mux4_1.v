/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    4-1 mux template
*/
module mux4_1(InA, InB, InC, InD, S, Out);
    input        InA, InB, InC, InD;
    input [1:0]  S;
    output       Out;

    wire AB, CD;

    mux2_1 muxAB(.InA(InA), .InB(InB), .S(S[0]), .Out(AB));
    mux2_1 muxCD(.InA(InC), .InB(InD), .S(S[0]), .Out(CD));
    mux2_1 muxOut(.InA(AB), .InB(CD), .S(S[1]), .Out(Out));

endmodule
