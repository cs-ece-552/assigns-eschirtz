/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    a single 16-bit register
*/
module reg_ind (
            // Output
            q,
            // Inputs
            d, clk, rst, writeNew
            );

    output [15:0] q; // value stored in the ff
    input [15:0]  d; // value sitting at input of ff
    input          clk;
    input          writeNew; // write enable
    input          rst; // synchronus reset

    wire [15:0] newVal;

    // if write enable is not set, feedback old value to input of ff
    assign newVal = (writeNew == 1'b1) ? d : q;
    // newVal is the conditional input to the register
    dff dff1(.q(q[0]), .d(newVal[0]), .clk(clk), .rst(rst));
    dff dff2(.q(q[1]), .d(newVal[1]), .clk(clk), .rst(rst));
    dff dff3(.q(q[2]), .d(newVal[2]), .clk(clk), .rst(rst));
    dff dff4(.q(q[3]), .d(newVal[3]), .clk(clk), .rst(rst));
    dff dff5(.q(q[4]), .d(newVal[4]), .clk(clk), .rst(rst));
    dff dff6(.q(q[5]), .d(newVal[5]), .clk(clk), .rst(rst));
    dff dff7(.q(q[6]), .d(newVal[6]), .clk(clk), .rst(rst));
    dff dff8(.q(q[7]), .d(newVal[7]), .clk(clk), .rst(rst));
    dff dff9(.q(q[8]), .d(newVal[8]), .clk(clk), .rst(rst));
    dff dff10(.q(q[9]), .d(newVal[9]), .clk(clk), .rst(rst));
    dff dff11(.q(q[10]), .d(newVal[10]), .clk(clk), .rst(rst));
    dff dff12(.q(q[11]), .d(newVal[11]), .clk(clk), .rst(rst));
    dff dff13(.q(q[12]), .d(newVal[12]), .clk(clk), .rst(rst));
    dff dff14(.q(q[13]), .d(newVal[13]), .clk(clk), .rst(rst));
    dff dff15(.q(q[14]), .d(newVal[14]), .clk(clk), .rst(rst));
    dff dff16(.q(q[15]), .d(newVal[15]), .clk(clk), .rst(rst));

endmodule
