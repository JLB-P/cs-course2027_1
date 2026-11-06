`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 09:23:57 AM
// Design Name: 
// Module Name: eq_comp_1bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module eq_comp_1bit(
    //Port declaration
    input logic a,b,
    output logic eq
    );
    //signal declaration
    logic p0,p1;
    //program body
    assign eq = p0 | p1;
    //product terms
    assign p0 = (~b & ~a);
    assign p1 = (b & a);
endmodule
