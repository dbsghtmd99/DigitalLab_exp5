module BCDToNinthComp(X3, X2, X1, X0, Y3, Y2, Y1, Y0, C);
    input X3, X2, X1, X0; // A, B, C, D
    output Y3, Y2, Y1, Y0, C; // W, X, Y, Z, Valid

    //W = A’B’C' X = B’C + BC’ Y = C Z = D’ Valid = AB+AC
    assign Y3 = ~X3 & ~X2 & ~X1;
    assign Y2 = X2 ^ X1;
    assign Y1 = X1;
    assign Y0 = ~X0;
    assign C = X3 & (X2 | X1);

endmodule // BCDToNinthComp

module tb_BCDToNinthComp;
    reg [3:0] D;
    wire Y3, Y2, Y1, Y0, C;
    BCDToNinthComp converter(D[3], D[2], D[1], D[0], Y3, Y2, Y1, Y0, C);

    initial begin
        D = 4'b0000;
        repeat(15)
            #10 D = D + 1'b1; 
    end

    initial begin
        $monitor("%d : %b%b%b%b -> %b%b%b%b, Valid : %b", D, D[3], D[2], D[1], D[0], Y3, Y2, Y1, Y0, C);
    end
    always @(D) begin
        $monitor("%d : %b%b%b%b -> %b%b%b%b, Valid : %b", D, D[3], D[2], D[1], D[0], Y3, Y2, Y1, Y0, C);
    end
endmodule // tb_BCDToNinthComp
