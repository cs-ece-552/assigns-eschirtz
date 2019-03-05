/*
   CS/ECE 552, Spring '19
   Homework #6, Problem #1

   This module determines all of the control logic for the processor.
*/
module control (/*AUTOARG*/
                // Outputs
                err,
                RegDst,
                SESel,
                RegWrite,
                DMemWrite,
                DMemEn,
                ALUSrc2,
                PCSrc,
                PCImm,
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
                PCImm, MemToReg, DMemDump, Jump;
   output [1:0] RegDst;
   output [2:0] SESel;

   //TODO: Handle Error
   wire is7_5, is10_8, is_R7, zext5bit, zext8bit, ext5bit, ext8bit, zext11bit, is10010, alu_op;

   assign is_10010 = (OpCode[4:0] == 5'b10010);
   // Assign 1 if there is a jump
   assign Jump = (OpCode[4:0] == 5'b00101) | (OpCode[4:0] == 5'b00111);

   assign PCImm = (OpCode[4:0] == 5'b00100) | (OpCode[4:0] == 5'b00110);

   // Assign 1 if writing to memory
   assign DMemWrite = (OpCode[4:0] == 5'b10011) | (OpCode[4:0] == 5'b10000);

   // Assign 1 if want to dump memory - only used in halt
   assign DMemDump = (OpCode[4:0] == 5'b00000);

   // Assign 1 if loading memory into a reg
   assign MemToReg = (OpCode[4:0] == 5'b10001);

   // Assign 1 if memory is used, ie if either MemToReg or DMemDump is needed
   assign DMemEn = (MemToReg | DMemWrite);

   // Assign 1 if PC change provided by Branch/Jump (if index 4 is 0 and index 2 is 1)
   assign PCSrc = (~OpCode[4] & OpCode[2]);

   // Assign 1 if ALU uses 2 registers as operands and 0 if an immediate is used
   assign ALUSrc2 = (OpCode[4:3] == 2'b11) & (|OpCode[2:1]);

   // Assign 1 if a reg is being written to and 0 elsewise
   assign RegWrite = (OpCode[4] & |OpCode[3:0]) | (OpCode[4:1] == 4'b0011) | (OpCode[4:2] == 3'b010);

   // Assign 1 if instruction specifies dest reg is in bits 7:5
   assign is7_5 = (OpCode[4:2] == 3'b010) | ((OpCode[4:3] == 2'b10) & (~OpCode[4:1] == 4'b1001));

   assign is10_8 = (OpCode[4:0] == 5'b11000) | (OpCode[4:1] == 4'b1001);

   assign is_R7 = (OpCode[4:1] == 4'b0011);

   // Assign 00 if bits 4:2 specify destination (same as ALUSrc2)
   assign RegDst = (ALUSrc2) ? 2'b00
                     // Assign 01 if bits 7:5 specify destination
                     : (is7_5) ? 2'b01
                     // Assign 10 if bits 10:8 specify destination
                     : (is10_8) ? 2'b10
                     // Otherwise assign 11 if JAL or JALR
                     : (is_R7) ? 2'b11
                     // Otherwise dont care
                     : 2'bxx;

   // Set immediate extension recognition bits
   assign zext5bit = (OpCode[4:2] == 3'b101) | (OpCode[4:1] == 4'b0101);
   assign ext5bit = (OpCode[4:1] == 4'b0100) | ((OpCode[4:2] == 3'b100) & (~is_10010));
   assign zext8bit = is_10010;
   assign ext8bit = (OpCode[4:2] == 3'b011) | (OpCode[4:0] == 5'b11000) | (OpCode[4:0] == 5'b00101) | (OpCode[4:0] == 5'b00111);
   assign zext11bit = (OpCode[4:0] == 5'b00100) | (OpCode[4:0] == 5'b00110);

   assign SESel = (zext5bit) ? 3'b000
                     : (ext5bit) ? 3'b01x
                     : (zext8bit) ? 3'b001
                     : (ext8bit) ? 3'b10x
                     : (zext11bit) ? 3'b11x
                     : 3'bxxx;

   // Check for any unknown vals
   assign err = (^OpCode === 1'bx) | // if any bits of opcode are unkown
                ((OpCode[4:1] === 4'b1101) & (^Funct === 1'bx)); // or if it's a function reliant opcode, and func bits unkown
endmodule
