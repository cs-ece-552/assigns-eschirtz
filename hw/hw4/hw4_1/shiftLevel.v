/*
  Shift level is one full 16-bit level of the barrel shifter
  - Takes in all inputs for the current level and outputs a bus
 */
module shiftLevel (inputVal, opcode, d0, d1, d2, d3, cnt, out);

  input [15:0] inputVal; // data passed from previous level, or the input
  input [1:0] opcode;
  input [15:0] d0, d1, d2, d3; // data busses for passing values based on op
  input cnt; // count, from top level, will be one bit of the count bus
  output [15:0] out;    // output

  //// Bits 15 to 12 ////
  opSel b15(.dSelect(opcode), .opEn(cnt),
    .d0(d0[15]), .d1(d1[15]), .d2(d2[15]), .d3(d3[15]),
    .passVal(inputVal[15]), .out(out[15]));

  opSel b14(.dSelect(opcode), .opEn(cnt),
    .d0(d0[14]), .d1(d1[14]), .d2(d2[14]), .d3(d3[14]),
    .passVal(inputVal[14]), .out(out[14]));

  opSel b13(.dSelect(opcode), .opEn(cnt),
    .d0(d0[13]), .d1(d1[13]), .d2(d2[13]), .d3(d3[13]),
    .passVal(inputVal[13]), .out(out[13]));

  opSel b12(.dSelect(opcode), .opEn(cnt),
    .d0(d0[12]), .d1(d1[12]), .d2(d2[12]), .d3(d3[12]),
    .passVal(inputVal[12]), .out(out[12]));

  //// Bits 11 to 8 ////
  opSel b11(.dSelect(opcode), .opEn(cnt),
    .d0(d0[11]), .d1(d1[11]), .d2(d2[11]), .d3(d3[11]),
    .passVal(inputVal[11]), .out(out[11]));

  opSel b10(.dSelect(opcode), .opEn(cnt),
    .d0(d0[10]), .d1(d1[10]), .d2(d2[10]), .d3(d3[10]),
    .passVal(inputVal[10]), .out(out[10]));

  opSel b9(.dSelect(opcode), .opEn(cnt),
    .d0(d0[9]), .d1(d1[9]), .d2(d2[9]), .d3(d3[9]),
    .passVal(inputVal[9]), .out(out[9]));

  opSel b8(.dSelect(opcode), .opEn(cnt),
    .d0(d0[8]), .d1(d1[8]), .d2(d2[8]), .d3(d3[8]),
    .passVal(inputVal[8]), .out(out[8]));

  //// Bits 7 to 4 ////
  opSel b7(.dSelect(opcode), .opEn(cnt),
    .d0(d0[7]), .d1(d1[7]), .d2(d2[7]), .d3(d3[7]),
    .passVal(inputVal[7]), .out(out[7]));

  opSel b6(.dSelect(opcode), .opEn(cnt),
    .d0(d0[6]), .d1(d1[6]), .d2(d2[6]), .d3(d3[6]),
    .passVal(inputVal[6]), .out(out[6]));

  opSel b5(.dSelect(opcode), .opEn(cnt),
    .d0(d0[5]), .d1(d1[5]), .d2(d2[5]), .d3(d3[5]),
    .passVal(inputVal[5]), .out(out[5]));

  opSel b4(.dSelect(opcode), .opEn(cnt),
    .d0(d0[4]), .d1(d1[4]), .d2(d2[4]), .d3(d3[4]),
    .passVal(inputVal[4]), .out(out[4]));

  //// Bits 3 to 0 ////
  opSel b3(.dSelect(opcode), .opEn(cnt),
    .d0(d0[3]), .d1(d1[3]), .d2(d2[3]), .d3(d3[3]),
    .passVal(inputVal[3]), .out(out[3]));

  opSel b2(.dSelect(opcode), .opEn(cnt),
    .d0(d0[2]), .d1(d1[2]), .d2(d2[2]), .d3(d3[2]),
    .passVal(inputVal[2]), .out(out[2]));

  opSel b1(.dSelect(opcode), .opEn(cnt),
    .d0(d0[1]), .d1(d1[1]), .d2(d2[1]), .d3(d3[1]),
    .passVal(inputVal[1]), .out(out[1]));

  opSel b0(.dSelect(opcode), .opEn(cnt),
    .d0(d0[0]), .d1(d1[0]), .d2(d2[0]), .d3(d3[0]),
    .passVal(inputVal[0]), .out(out[0]));


endmodule
