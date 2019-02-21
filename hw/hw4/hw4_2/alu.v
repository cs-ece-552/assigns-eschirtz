/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 2

    A 16-bit ALU module.  It is designed to choose
    the correct operation to perform on 2 16-bit numbers from rotate
    left, shift left, shift right arithmetic, shift right logical, add,
    or, xor, & and.  Upon doing this, it should output the 16-bit result
    of the operation, as well as output a Zero bit and an Overflow
    (OFL) bit.
*/
module alu (A, B, Cin, Op, invA, invB, sign, Out, Zero, Ofl);

  // declare constant for size of inputs, outputs (N),
  // and operations (O)
  parameter    N = 16;
  parameter    O = 3;

  input [N-1:0] A;
  input [N-1:0] B;
  input         Cin;
  input [O-1:0] Op;
  input         invA;
  input         invB;
  input         sign;
  output [N-1:0] Out;
  output         Ofl;
  output         Zero;

  wire [15:0] shift_out, and_out, or_out, xor_out, a_out, b_out, adder_out, other_op_out;
  wire overflow_unsigned, overflow_signed, same_sign, overflow_poss, is_overflow;
  assign a_out = (invA == 1'b1) ? ~A : A;
  assign b_out = (invB == 1'b1) ? ~B : B;
  assign and_out = a_out & b_out;
  assign or_out = a_out | b_out;
  assign xor_out = a_out ^ b_out;
  rca_16b alu_adder(.A(a_out), .B(b_out), .C_in(Cin), .S(adder_out), .C_out(overflow_unsigned));
  mux4_1_16b other_ops(.InA(adder_out), .InB(and_out), .InC(or_out), .InD(xor_out), .S(Op[1:0]), .Out(other_op_out));
  barrelShifter alu_shift(.In(a_out), .Cnt(b_out[3:0]), .Op(Op[1:0]), .Out(shift_out));
  assign same_sign = (a_out[15] == b_out[15]) ? 1 : 0;
  assign overflow_poss = (a_out[15] == Out[15]) ? 0 : 1;
  assign overflow_signed = ((same_sign & overflow_poss) == 1) ? 1 : 0;
  assign is_overflow = (sign) ? overflow_signed : overflow_unsigned;
  assign Ofl = (Op == 3'b100) ? is_overflow : 1'b0;
  assign Out = (Op[2] == 1'b1) ? other_op_out : shift_out;
  assign Zero = (|Out == 1'b0) ? 1'b1 : 1'b0;
  
endmodule
