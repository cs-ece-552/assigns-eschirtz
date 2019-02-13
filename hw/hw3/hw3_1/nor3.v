/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    3 input NOR
*/
module nor3 (in1,in2,in3,out);
    input  in1,in2,in3;
    output out;
    assign out = ~(in1 | in2 | in3);
endmodule