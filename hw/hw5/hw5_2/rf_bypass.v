/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #2

   This module creates a wrapper around the 8x16b register file, to do
   do the bypassing logic for RF bypassing.
*/
module rf_bypass (
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

   wire [15:0] w1, w2;
   rf rf1(.readData1(w1), .readData2(w2), .err(err), .clk(clk), .rst(rst), .readReg1Sel(readReg1Sel),
   .readReg2Sel(readReg2Sel), .writeRegSel(writeRegSel), .writeData(writeData), .writeEn(writeEn));

   assign readData1 = (readReg1Sel == writeRegSel) ? writeData : w1;
   assign readData2 = (readReg2Sel == writeRegSel) ? writeData : w2;
   // assign readData1 = (writeEn == 1'b0) ? w1
   //                      : (readReg1Sel == writeRegSel) ? writeData : w1;
   // assign readData2 = (writeEn == 1'b0) ? w2
   //                      : (readReg2Sel == writeRegSel) ? writeData : w2;
endmodule
