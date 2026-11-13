`timescale 1ns / 1ps


module registro(
    input logic clk, clr, ld,
    input logic [7:0] d,
    output logic [7:0] q
    );
    always_ff @(posedge clk, posedge clr)
    if (clr)
        q <= 0;
    else if (ld)
        q <= d; 
endmodule