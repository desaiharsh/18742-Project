module mult(
    input signed [IP:0] in,
    input signed [WP:0] w,
    output signed [CP:0] out
);
parameter IP = 8;
parameter WP = 8;
parameter CP = WP + IP;

wire signed [IP:0] s_in;
assign s_in = in;
assign out = w * s_in;

endmodule
