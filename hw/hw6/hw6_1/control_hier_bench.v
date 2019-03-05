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
              PCImm, MemToReg, DMemDump, Jump;         // From top of control_hier.v
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
   reg [5:0]  count;

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
                    .PCImm                        (PCImm),
                    .MemToReg                     (MemToReg),
                    .DMemDump                     (DMemDump),
                    .Jump                         (Jump),
                    // Inputs
                    .OpCode                       (OpCode),
                    .Funct                        (Funct));

   assign               clk = DUT.clk_generator.clk;
   assign               rst = DUT.clk_generator.rst;

   initial begin
      OpCode = 5'b00000;
      count = 6'b000000;
   end

   // Enumerate all possible opcodes
   always @ (posedge clk)begin
      $display("At Opcode: %b   ->   Error: %b, RegDst: %b, SESel: %b, RegWrite: %b, DMemWrite: %b, DMemEn: %b, ALUSrc2: %b, PCSrc: %b, MemToReg: %b, DMemDump: %b, Jump: %b \n", OpCode, err,
                RegDst,
                SESel,
                RegWrite,
                DMemWrite,
                DMemEn,
                ALUSrc2,
                PCSrc,
                MemToReg,
                DMemDump,
                Jump);
      OpCode = OpCode + 1;
      count = count + 1;
      if (count == 6'b100000) begin
         $finish;
      end
   end
endmodule // control_hier_bench
