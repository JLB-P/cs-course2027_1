`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 05:16:20 PM
// Design Name: 
// Module Name: comp_eq_1b_tb
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


module comp_eq_1b_tb;
//signal declaration
logic test_a, test_b;
logic test_eq;
//instantiate circuit under test
comp_eq_1b uut (.a(test_a), .b(test_b), .eq(test_eq));
initial
begin
    //test vector 1
    test_a = 1'b0;
    test_b = 1'b0;
    #10;
    //test vector 2
    test_a = 1'b1;
    test_b = 1'b0;
    #10; 
    //stop simulation
    $stop;
end
endmodule
