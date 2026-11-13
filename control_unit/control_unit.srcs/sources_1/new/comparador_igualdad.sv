`timescale 1ns / 1ps


module comparador_igualdad(
        input logic [7:0] x, y,
        output logic res
    );
    
    assign res = (x == y);
endmodule