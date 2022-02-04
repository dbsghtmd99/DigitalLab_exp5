module BCDToExcess3(A, B, C, D, W, X, Y, Z);
    input A, B, C, D;
    output W, X, Y, Z;
    wire e1, e2, e3, e4, e5, e6, e7;

    not (Z, D);
    and (e1, C, D);
    or (e2, C, D);
    not (e3, e2);
    or (Y, e1, e3);
    and (e4, e3, B);
    not (e5, B);
    and (e6, e2, e5);
    or (X, e4, e6);
    and (e7, e2, B);
    or (W, e7, A);
    
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

