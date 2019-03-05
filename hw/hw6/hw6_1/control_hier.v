/*
   CS/ECE 552, Spring '19
   Homework #6, Problem #1
  
   Wrapper module around global control logic.

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
module control_hier (/*AUTOARG*/
                     // Outputs
                     err, 
                     RegDst,
                     SESel,
                     RegWrite,
                     DMemWrite,
                     DMemEn,
                     ALUSrc2,
                     PCSrc,
                     MemToReg,
                     DMemDump,
                     Jump,
                     // Inputs
                     OpCode,
                     Funct
                     );

   // inputs
   input [4:0]  OpCode;
   input [1:0]  Funct;
   
   // outputs
   output       err;
   output       RegWrite, DMemWrite, DMemEn, ALUSrc2, PCSrc, 
                MemToReg, DMemDump, Jump;
   output [1:0] RegDst;
   output [2:0] SESel;

   wire         clk, rst, errClkRst;

   // Ignore errClkRst for now
   clkrst clk_generator(.clk(clk), .rst(rst), .err(errClkRst) );
   control c0(
              // Outputs
              .err                          (err),
              .RegDst                       (RegDst),
              .SESel                        (SESel),
              .RegWrite                     (RegWrite),
              .DMemWrite                    (DMemWrite),
              .DMemEn                       (DMemEn),
              .ALUSrc2                      (ALUSrc2),
              .PCSrc                        (PCSrc),
              .MemToReg                     (MemToReg),
              .DMemDump                     (DMemDump),
              .Jump                         (Jump),
              // Inputs
              .OpCode                       (OpCode),
              .Funct                        (Funct));

endmodule
