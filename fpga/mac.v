module mac(
    input signed [IP:0] in,
    input signed [WP:0] w,
    input signed [BP:0] b,
    output signed [CP:0] out
);
parameter IP = 8;
parameter WP = 8;
parameter BP = WP + IP;
parameter CP = WP + IP;

wire signed [16:0] d;
assign d = w * in;
assign out = d + b;
endmodule

// module mac(
//     input signed [IP:0] in,
//     input signed [WP:0] w,
//     input signed [BP:0] b,
//     output signed [CP:0] out
// );
// parameter IP = 8;
// parameter WP = 7;
// parameter BP = WP + IP + 1;
// parameter CP = WP + IP + 1;
//
// wire signed [CP:0] d;
// assign d = w * in;
// assign out = d + b;
//
// endmodule
