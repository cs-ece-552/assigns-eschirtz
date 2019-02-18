/*
  Operation selection module
  - Selects between barrel shifter options, per bit, per shift level
 */
module opSel (dSelect, opEn, d0, d1, d2, d3, passVal, out);

   input [1:0] dSelect;  // Data select choses which 'd' to pass through
   input opEn;           // Selects to perform 'operation', or to pass through
   input d0, d1, d2, d3; // 'Operation data', values coming from shift logic
   input passVal;        // the default value, no operation
   output out;           // output

   wire data;

   mux4_1 dataSelector(.InA(d0), .InB(d1), .InC(d2), .InD(d3), .S(dSelect), .Out(data));
   mux2_1 enSelector(.InA(passVal), .InB(data), .S(opEn), .Out(out));
   
endmodule
