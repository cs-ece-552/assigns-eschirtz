/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #1
  
   Random testbench for the 8x16b register file.
*/
module control_hier_bench(/*AUTOARG*/);
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire       err;
   wire       RegWrite, DMemWrite,              // From top of control_hier.v
              DMemEn, ALUSrc2, PCSrc,           // From top of control_hier.v
              MemToReg, DMemDump, Jump;         // From top of control_hier.v
   wire [1:0] RegDst;                           // From top of control_hier.v
   wire [2:0] SESel;                            // From top of control_hier.v
   // End of automatics
   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg [4:0]  OpCode;                           // To top of control_hier.v
   reg [1:0]  Funct;                            // To top of control_hier.v
   // End of automatics

   integer    cycle_count;

   wire       clk;
   wire       rst;

   reg        fail;

   // Instantiate the module we want to verify

   control_hier DUT(/*AUTOINST*/
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

   /* YOUR CODE HERE */

endmodule // control_hier_bench
