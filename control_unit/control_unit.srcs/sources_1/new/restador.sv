`timescale 1ns / 1ps


module restador(
        input logic [7:0] x, y,
        output logic [7:0] abs_diff
    );
    assign abs_diff = (x > y) ? (x - y) : (y - x);
endmodule