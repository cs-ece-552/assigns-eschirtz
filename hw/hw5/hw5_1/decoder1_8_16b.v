/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    a 4-bit (quad) 4-1 Mux template
*/
module decoder1_8_16b(In, Out);

    // parameter N for length of inputs and outputs (to use with larger inputs/outputs)
    parameter N = 16;

    input [2:0]  In;
    output reg [7:0] Out;

    always @(*)
    begin
        case (In)
            3'b000: Out = 8'b00000001;
            3'b001: Out = 8'b00000010;
            3'b010: Out = 8'b00000100;
            3'b011: Out = 8'b00001000;
            3'b100: Out = 8'b00010000;
            3'b101: Out = 8'b00100000;
            3'b110: Out = 8'b01000000;
            3'b111: Out = 8'b10000000;
            // If we reach this state, it is not a hardware/logic issue.
            default: $error("Error in decoder!"); 
        endcase
    end
endmodule
