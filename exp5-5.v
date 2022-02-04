module BCDToExcess3(A, B, C, D, W, X, Y, Z);
    input A, B, C, D;
    output W, X, Y, Z;

    reg W, X, Y, Z;

    always @(A or B or C or D) begin
        W = A + B*C + B*D;
        if (A == 0 && B*C == 0 && B*D == 0) W = 0;
        else W = 1;

        X = !B*C + !B*D + B*!C*!D;
        if (!B*C == 0 && !B*D == 0 && B*!C*!D == 0) X = 0;
        else X = 1;

        Y = C*D + !C*!D;
        if (C*D == 0 && !C*!D == 0) Y = 0;
        else Y = 1;

        Z = !D;
    end
    
endmodule // BCDToExcess3

module tb_BCDToExcess3;
    reg [3:0] D;
    wire W, X, Y, Z;
    BCDToExcess3 converter (D[3], D[2], D[1], D[0], W, X, Y, Z);

    initial begin
        D = 4'b0000;
        repeat(16)
            #10 D = D + 1'b1; 
    end

    initial begin
        $monitor("%d : %b%b%b%b -> %b%b%b%b", D, D[3], D[2], D[1], D[0], W, X, Y, Z);
    end
    always @(D) begin
        $monitor("%d : %b%b%b%b -> %b%b%b%b", D, D[3], D[2], D[1], D[0], W, X, Y, Z);
    end
endmodule // tb_BCDToExcess3

