/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    a 4-bit (quad) 4-1 Mux template
*/
module mux8_1_16b(InA, InB, InC, InD, InE, InF, InG, InH, S, Out);

    // parameter N for length of inputs and outputs (to use with larger inputs/outputs)
    parameter N = 16;

    input [N-1:0]   InA, InB, InC, InD, InE, InF, InG, InH;
    input [2:0]     S;
    output [N-1:0]  Out;

    wire [15:0] mux1out, mux2out;
    mux4_1_16b mux0(.InA(InA), .InB(InB), .InC(InC), .InD(InD), .S(S[1:0]), .Out(mux1out));
    mux4_1_16b mux1(.InA(InE), .InB(InF), .InC(InG), .InD(InH), .S(S[1:0]), .Out(mux2out));

    assign Out = (S[2] == 1'b0) ? mux1out : mux2out;
endmodule