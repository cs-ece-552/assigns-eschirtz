/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #3
  
   This module creates a six state saturating counter.  The counter takes
   the clock as an input.  It's reset is synchronous and active-high.  The output
   should increment every clock cycle until it reaches its saturation value (5 in
   this case); once it reaches the maximum value, it maintains its value until it
   is reset by ctr_rst.  The rst initializes the states to the first state, then is
   not used again.
*/
module sc(
          // Inputs
          clk, rst, ctr_rst,
          // Outputs
          out, err
          );

   input clk;
   input rst;
   input ctr_rst;

   output [2:0] out;
   output err;

   /* YOUR CODE HERE */

endmodule
