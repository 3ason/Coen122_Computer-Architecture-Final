module and_gate(A, B, out);
    input A, B;
    output out;
    and(out, A, B);
endmodule

module or_gate(A,B,C, out);
    input A, B, C;
    output out;
    or(out, A, B, C);
endmodule