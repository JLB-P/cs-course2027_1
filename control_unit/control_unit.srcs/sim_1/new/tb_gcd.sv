`timescale 1ns / 1ps

module tb_gcd;

    logic clk = 1'b0;
    logic clr = 1'b0;
    logic go_in = 1'b0;
    logic [7:0] xin = 8'd15;
    logic [7:0] yin = 8'd70;
    logic [7:0] gcd;

    gcd_top dut (
        .clk(clk),
        .clr(clr),
        .go_in(go_in),
        .xin(xin),
        .yin(yin),
        .gcd(gcd)
    );

    always #5 clk = ~clk;

    initial begin
        clr = 1'b1;
        repeat (2) @(negedge clk);
        clr = 1'b0;

        go_in = 1'b1;
        @(negedge clk);
        go_in = 1'b0;

        repeat (40) begin
            @(negedge clk);
            if (gcd === 8'd5) begin
                $display("OK: MCD(15, 70) = %0d", gcd);
                $finish;
            end
        end
    end

endmodule