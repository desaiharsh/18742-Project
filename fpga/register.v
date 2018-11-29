module register(
  clk, reset, D, Q
);
input clk;
input reset;
input signed [16:0] D;
output signed [16:0] Q;
reg signed [16:0] Q;

  always @ (posedge clk or posedge reset) begin
    if (reset)
      Q = 0;
    else
      Q = D;
  end
endmodule
