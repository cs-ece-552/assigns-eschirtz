/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #1

   This module creates a 16-bit register file with 8 registers.
   It has 1 write port, 2 read ports, 3 register select inputs,
   a write enable, a reset, and a clock input.
   All register state changes occur on the rising edge of the clock.
*/
module rf (
           // Outputs
           readData1, readData2, err,
           // Inputs
           clk, rst, readReg1Sel, readReg2Sel, writeRegSel, writeData, writeEn
           );

   input        clk, rst;
   input [2:0]  readReg1Sel;
   input [2:0]  readReg2Sel;
   input [2:0]  writeRegSel;
   input [15:0] writeData;
   input        writeEn;

   output [15:0] readData1;
   output [15:0] readData2;
   output        err;

   wire [15:0] reg0out, reg1out, reg2out, reg3out, reg4out, reg5out, reg6out, reg7out;

   wire[7:0] writeSel, tempSel;

   reg_ind reg0(.q(reg0out), .d(writeData), .clk(clk), .rst(rst), .writeNew(writeSel[0]));
   reg_ind reg1(.q(reg1out), .d(writeData), .clk(clk), .rst(rst), .writeNew(writeSel[1]));
   reg_ind reg2(.q(reg2out), .d(writeData), .clk(clk), .rst(rst), .writeNew(writeSel[2]));
   reg_ind reg3(.q(reg3out), .d(writeData), .clk(clk), .rst(rst), .writeNew(writeSel[3]));
   reg_ind reg4(.q(reg4out), .d(writeData), .clk(clk), .rst(rst), .writeNew(writeSel[4]));
   reg_ind reg5(.q(reg5out), .d(writeData), .clk(clk), .rst(rst), .writeNew(writeSel[5]));
   reg_ind reg6(.q(reg6out), .d(writeData), .clk(clk), .rst(rst), .writeNew(writeSel[6]));
   reg_ind reg7(.q(reg7out), .d(writeData), .clk(clk), .rst(rst), .writeNew(writeSel[7]));

   mux8_1_16b read1Sel(.InA(reg0out), .InB(reg1out), .InC(reg2out), .InD(reg3out), .InE(reg4out),
    .InF(reg5out), .InG(reg6out), .InH(reg7out), .S(readReg1Sel), .Out(readData1));
   mux8_1_16b read2Sel(.InA(reg0out), .InB(reg1out), .InC(reg2out), .InD(reg3out), .InE(reg4out),
    .InF(reg5out), .InG(reg6out), .InH(reg7out), .S(readReg2Sel), .Out(readData2));
   decoder1_8_16b decoder(.In(writeRegSel), .Out(tempSel));

   assign writeSel = (writeEn == 1'b1) ? tempSel: 8'b00000000;

   assign err = (^clk === 1'bx) | (^rst === 1'bx) | (^readReg1Sel === 1'bx) | (^readReg2Sel === 1'bx) | (^writeRegSel === 1'bx)
                  | (^writeData === 1'bx) | (^writeEn === 1'bx);

endmodule
