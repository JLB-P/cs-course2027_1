`timescale 1ns / 1ps

module gcd_top(
    input  logic       go_in, clk, clr,
    input  logic [7:0] xin, yin,
    output logic [7:0] gcd
);

    logic [7:0] x_d, y_d;
    logic [7:0] x_q, y_q;
    logic [7:0] resta;

    logic x_mayor, igual;
    logic x_sel, y_sel, x_ld, y_ld, gdc_ld;

    multiplexor mux_x(
        .in(xin), .resta(resta), .sel(x_sel), .salida_mux(x_d)
    );

    multiplexor mux_y(
        .in(yin), .resta(resta), .sel(y_sel), .salida_mux(y_d)
    );

    registro reg_x(
        .clk(clk), .clr(clr), .ld(x_ld), .d(x_d), .q(x_q)
    );

    registro reg_y(
        .clk(clk), .clr(clr), .ld(y_ld), .d(y_d), .q(y_q)
    );

    restador resta_xy(
        .x(x_q), .y(y_q), .abs_diff(resta)
    );

    comparador cmp_mayor(
        .x(x_q), .y(y_q), .res(x_mayor)
    );

    comparador_igualdad cmp_igual(
        .x(x_q), .y(y_q), .res(igual)
    );

    unidad_control control(
        .clk(clk), .clr(clr), .go(go_in),
        .x_mayor(x_mayor), .igual(igual),
        .x_sel(x_sel), .y_sel(y_sel),
        .x_ld(x_ld), .y_ld(y_ld), .gdc_ld(gdc_ld)
    );

    registro reg_gcd(
        .clk(clk), .clr(clr), .ld(gdc_ld), .d(x_q), .q(gcd)
    );

endmodule