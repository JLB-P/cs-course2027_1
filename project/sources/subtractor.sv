`timescale 1ns / 1ps


module subtractor
    #(parameter N=8)
    (
        input logic [N-1:0] A,B,
        output logic [N-1:0] R
    );
    
    always_comb
        R <= A - B;
    
endmodule
