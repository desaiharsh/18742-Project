module mac(
    input [7:0] in,
    input signed [7:0] w,
    input signed [16:0] b,
    output signed [16:0] out
    );
wire signed [8:0] s_in;
assign s_in = in;
wire signed [16:0] d;
assign d = w * s_in;
assign out = d + b;

endmodule
