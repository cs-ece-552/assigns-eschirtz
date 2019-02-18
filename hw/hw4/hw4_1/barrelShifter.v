/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 1

    A barrel shifter module.  It is designed to shift a number via rotate
    left, shift left, shift right arithmetic, or shift right logical based
    on the Op() value that is passed In (2 bit number).  It uses these
    shifts to shift the value any number of bits between 0 and 15 bits.
 */
module barrelShifter (In, Cnt, Op, Out);

  // declare constant for size of inputs, outputs (N) and # bits to shift (C)
  parameter   N = 16;
  parameter   CT = 4;
  parameter   O = 2;

  input [N-1:0]   In;
  input [CT-1:0]   Cnt;
  input [O-1:0]   Op;
  output [N-1:0]  Out;

  // P is the select value between zero or MSB of operand
  // Used In the arithmetic vs logical cases
  wire P;
  mux2_1 pSel(.InA(In[15]), .InB(1'b0), .S(Op[0]), .Out(P));

  // D busses are routed to the 4-1 muxes inside of opSel
  wire [15:0] a0, a1, a2, a3,b0,b1,b2,b3,c0,c1,c2,c3,i0,i1,i2,i3;
  //outputs are either the passed through or shifted set of 16bits
  wire [15:0] A,B,C;

  // Inputs to the 4-1 muxes for the first level of logic
  //Rotate Left
  assign i0 = {In[14],In[13],In[12],In[11],In[10],In[9],In[8],In[7],In[6],In[5],
    In[4],In[3],In[2],In[1],In[0], In[15]};
  //Shift Left
  assign i1 = {In[14],In[13],In[12],In[11],In[10],In[9],In[8],In[7],In[6],In[5],
    In[4],In[3],In[2],In[1],In[0], P};
  //Shift Right arithmetic
  assign i2 = {P,In[15],In[14],In[13],In[12],In[11],In[10],In[9],In[8],In[7],In[6],In[5],
    In[4],In[3],In[2],In[1]};
  //Shift Right Logical
  assign i3 = {P,In[15],In[14],In[13],In[12],In[11],In[10],In[9],In[8],In[7],In[6],In[5],
    In[4],In[3],In[2],In[1]};

  // Inputs to the 4-1 muxes for the second level of logic
  assign a0 = {A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],
    A[4],A[3],A[2],A[1],A[0],A[15],A[14]};
  assign a1 = {A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],
    A[4],A[3],A[2],A[1],A[0],P,P};
  assign a2 = {P,P,A[15],A[14],A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],
    A[4],A[3],A[2]};
  assign a3 = {P,P,A[15],A[14],A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],
    A[4],A[3],A[2]};

  // Inputs to the 4-1 muxes for the third level of logic
  assign b0 = {B[11],B[10],B[9],B[8],B[7],B[6],B[5],B[4],B[3],B[2],B[1],B[0],
    B[15],B[14],B[13],B[12]};
  assign b1 = {B[11],B[10],B[9],B[8],B[7],B[6],B[5],B[4],B[3],B[2],B[1],B[0],
    P,P,P,P};
  assign b2 = {P,P,P,P,B[15],B[14],B[13],B[12],B[11],B[10],B[9],B[8],B[7],B[6],
    B[5],B[4]};
  assign b3 = {P,P,P,P,B[15],B[14],B[13],B[12],B[11],B[10],B[9],B[8],B[7],B[6],
    B[5],B[4]};

  // Inputs to the 4-1 muxes for the forth level of logic
  assign c0 = {C[7],C[6],C[5],C[4],C[3],C[2],C[1],C[0],
    C[15],C[14],C[13],C[12],C[11],C[10],C[9],C[8]};
  assign c1 = {C[7],C[6],C[5],C[4],C[3],C[2],C[1],C[0],
    P,P,P,P,P,P,P,P};
  assign c2 = {P,P,P,P,P,P,P,P,C[15],C[14],C[13],C[12],C[11],C[10],C[9],C[8]};
  assign c3 = {P,P,P,P,P,P,P,P,C[15],C[14],C[13],C[12],C[11],C[10],C[9],C[8]};

  //shiftLevels handle 16 bits of shifting for one level of 'shift logic'
  shiftLevel shiftA (.inputVal(In),.opcode(Op),.d0(i0),.d1(i1),.d2(i2),.d3(i3),
  .cnt(Cnt[0]),.out(A));
  shiftLevel shiftB (.inputVal(A),.opcode(Op),.d0(a0),.d1(a1),.d2(a2),.d3(a3),
  .cnt(Cnt[1]),.out(B));
  shiftLevel shiftC (.inputVal(B),.opcode(Op),.d0(b0),.d1(b1),.d2(b2),.d3(b3),
  .cnt(Cnt[2]),.out(C));
  shiftLevel shiftD (.inputVal(C),.opcode(Op),.d0(c0),.d1(c1),.d2(c2),.d3(c3),
  .cnt(Cnt[3]),.out(Out));
endmodule
