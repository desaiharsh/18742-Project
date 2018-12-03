module max(
    input signed [IP:0] in0,
    input signed [IP:0] in1,
    output signed [IP:0] out
);
parameter IP = 8;
assign out = in0 < in1 ? in1 : in0;
endmodule
