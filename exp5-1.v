module BinaryToGray(X3, X2, X1, X0, Y3, Y2, Y1, Y0);
    input X3, X2, X1, X0;
    output Y3, Y2, Y1, Y0;

    assign Y3 = X3;
    xor g1(Y2, X3, X2);
    xor g2(Y1, X2, X1);
    xor g3(Y0, X1, X0);
endmodule // BinaryToGray

module GrayToBinary(X3, X2, X1, X0, Y3, Y2, Y1, Y0);
    input X3, X2, X1, X0;
    output Y3, Y2, Y1, Y0;

    assign Y3 = X3;
    xor g1(Y2, X3, X2);
    xor g2(Y1, Y2, X1);
    xor g3(Y0, Y1, X0);
endmodule // GrayToBinary

module tb_GrayToBinary;
    wire[3:0] D; // GrayToBinary
    reg[3:0] E; // BinaryToGray

    wire Y3, Y2, Y1, Y0;
    BinaryToGray temp(E[3], E[2], E[1], E[0], D[3], D[2], D[1], D[0]);
    GrayToBinary converter(D[3], D[2], D[1], D[0], Y3, Y2, Y1, Y0);

    initial begin
        E = 4'b0000;
            repeat(16)
            #10 E = E + 1'b1;
    end

    always @(E) begin
        $display("%d : %b%b%b%b -> %b%b%b%b", E-1, D[3], D[2], D[1], D[0], Y3, Y2, Y1, Y0);
    end
endmodule // tb_GrayToBinary
