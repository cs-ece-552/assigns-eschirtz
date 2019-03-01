/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #1
  
   Wrapper module around 8x16b register file.

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
module rf_hier (
                // Outputs
                readData1, readData2, 
                // Inputs
                readReg1Sel, readReg2Sel, writeRegSel, writeData, writeEn
                );

   input [2:0]  readReg1Sel;
   input [2:0]  readReg2Sel;
   input [2:0]  writeRegSel;
   input [15:0] writeData;
   input        writeEn;

   output [15:0] readData1;
   output [15:0] readData2;

   wire          clk, rst;
   wire          err;

   // Ignore err for now
   clkrst clk_generator(.clk(clk), .rst(rst), .err(err) );
   rf rf0(
          // Outputs
          .readData1                    (readData1[15:0]),
          .readData2                    (readData2[15:0]),
          .err                          (err),
          // Inputs
          .clk                          (clk),
          .rst                          (rst),
          .readReg1Sel                  (readReg1Sel[2:0]),
          .readReg2Sel                  (readReg2Sel[2:0]),
          .writeRegSel                  (writeRegSel[2:0]),
          .writeData                    (writeData[15:0]),
          .writeEn                      (writeEn));

endmodule
