/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 1
    
    A barrel shifter module.  It is designed to shift a number via rotate
    left, shift left, shift right arithmetic, or shift right logical based
    on the Op() value that is passed in (2 bit number).  It uses these
    shifts to shift the value any number of bits between 0 and 15 bits.
 */
module barrelShifter (In, Cnt, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   parameter   N = 16;
   parameter   C = 4;
   parameter   O = 2;

   input [N-1:0]   In;
   input [C-1:0]   Cnt;
   input [O-1:0]   Op;
   output [N-1:0]  Out;

   /* YOUR CODE HERE */
   
endmodule

