`timescale 1ns / 1ps

module unidad_control(
    input  logic clk, clr, go,
    input  logic x_mayor, igual,
    output logic x_sel, y_sel,
    output logic x_ld, y_ld, gdc_ld
);

    typedef enum logic [2:0] {
        ESPERA,
        CARGAR,
        COMPARAR,
        RESTAR,
        GUARDAR
    } estado_t;

    estado_t estado, siguiente;

    always_ff @(posedge clk or posedge clr) begin
        if (clr)
            estado <= ESPERA;
        else
            estado <= siguiente;
    end

    always_comb begin
        siguiente = estado;
        x_sel = 1'b0;
        y_sel = 1'b0;
        x_ld = 1'b0;
        y_ld = 1'b0;
        gdc_ld = 1'b0;

        case (estado)
            ESPERA: begin
                if (go)
                    siguiente = CARGAR;
            end

            CARGAR: begin
                x_sel = 1'b1;
                y_sel = 1'b1;
                x_ld = 1'b1;
                y_ld = 1'b1;
                siguiente = COMPARAR;
            end

            COMPARAR: begin
                if (igual)
                    siguiente = GUARDAR;
                else
                    siguiente = RESTAR;
            end

            RESTAR: begin
                if (x_mayor)
                    x_ld = 1'b1;
                else
                    y_ld = 1'b1;

                siguiente = COMPARAR;
            end

            GUARDAR: begin
                gdc_ld = 1'b1;
                siguiente = ESPERA;
            end

            default: siguiente = ESPERA;
        endcase
    end

endmodule