/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #3
  
   Wrapper module for the saturating counter.

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
module sc_hier (/*AUTOARG*/
                // Outputs
                out, 
                // Inputs
                ctr_rst
                );

   input ctr_rst;

   output [2:0] out;
   
   wire         err;
   wire         clk;
   wire         rst;
   
   clkrst clk_generator(.clk(clk), .rst(rst), .err(err) );
   sc sc0(/*AUTOINST*/
          // Outputs
          .out                          (out[2:0]),
          .err                          (err),
          // Inputs
          .clk                          (clk),
          .rst                          (rst),
          .ctr_rst                      (ctr_rst));
   
endmodule
