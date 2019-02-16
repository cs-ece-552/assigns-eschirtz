/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 1
    
    The wrapper module around the barrel shifter to combine it with the clock and 
    reset.
 */
module barrelShifter_hier(In, Cnt, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   parameter N = 16;
   parameter C = 4;
   parameter O = 2;

   input [N-1:0]  In;
   input [C-1:0]  Cnt;
   input [O-1:0]  Op;
   output [N-1:0] Out;

   wire clk;
   wire rst;
   wire err;

   assign err = 1'b0;
 
   clkrst c0(
             // Outputs
             .clk                       (clk),
             .rst                       (rst),
             // Inputs
             .err                       (err)
            );

   barrelShifter s0(
                    // Outputs
                    .Out                      (Out),
                    // Inputs
                    .In                       (In),
                    .Cnt                      (Cnt),
                    .Op                       (Op)
                    );
   
endmodule // shifter_hier
