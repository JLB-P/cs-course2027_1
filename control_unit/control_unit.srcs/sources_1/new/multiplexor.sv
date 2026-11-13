module multiplexor #(
    parameter WIDTH = 8
)(
    input  logic [WIDTH-1:0] in,
    input  logic [WIDTH-1:0] resta,
    input  logic             sel,
    output logic [WIDTH-1:0] salida_mux
);

    assign salida_mux = sel ? in : resta;

endmodule