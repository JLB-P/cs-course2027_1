`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 04:56:45 PM
// Design Name: 
// Module Name: comp_eq_1b
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


module comp_eq_1b(
    input logic a,b,
    output logic eq
    );
    //signal declaration
    logic p0, p1;
    //Program body
    assign eq = p0 | p1;
    //product terms
    assign p0 = (~b & ~a);
    assign p1 = (b & a);
endmodule