/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    a 4-bit (quad) 4-1 Mux template
*/
module mux4_1_16b(InA, InB, InC, InD, S, Out);

  // parameter N for length of inputs and outputs (to use with larger inputs/outputs)
  parameter N = 16;

  input [N-1:0]   InA, InB, InC, InD;
  input [1:0]     S;
  output [N-1:0]  Out;

  mux4_1_4b mux0(.InA(InA[3:0]), .InB(InB[3:0]), .InC(InC[3:0]), .InD(InD[3:0]), .S(S), .Out(Out[3:0]));
  mux4_1_4b mux1(.InA(InA[7:4]), .InB(InB[7:4]), .InC(InC[7:4]), .InD(InD[7:4]), .S(S), .Out(Out[7:4]));
  mux4_1_4b mux2(.InA(InA[11:8]), .InB(InB[11:8]), .InC(InC[11:8]), .InD(InD[11:8]), .S(S), .Out(Out[11:8]));
  mux4_1_4b mux3(.InA(InA[15:12]), .InB(InB[15:12]), .InC(InC[15:12]), .InD(InD[15:12]), .S(S), .Out(Out[15:12]));
  
endmodule
