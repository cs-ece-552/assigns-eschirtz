/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    2 input NOR
*/
module nor2 (in1,in2,out);
    input in1,in2;
    output out;
    assign out = ~(in1 | in2);
endmodule
