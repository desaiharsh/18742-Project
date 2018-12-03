// Shifts data by a fixed depth.
// Optimize in future by finding a way to create 2-d arrays

module shift_9
(
  input clk,
  input reset,
  input signed [8:0] data_in,
  output signed [8:0] data_out
);

// Depth = D = n-k;
parameter IMAGE_WIDTH = 28;
parameter KERNEL_WIDTH = 5;
parameter D = IMAGE_WIDTH - KERNEL_WIDTH;

// Define holding register for each bit
reg [D-1:0] hr_0; reg [D-1:0] hr_1; reg [D-1:0] hr_2; reg [D-1:0] hr_3;
reg [D-1:0] hr_4; reg [D-1:0] hr_5; reg [D-1:0] hr_6; reg [D-1:0] hr_7;
reg [D-1:0] hr_8;

always @ (posedge clk or posedge reset) begin
  if (reset) begin
    hr_0 <= 0;
    hr_1 <= 0;
    hr_2 <= 0;
    hr_3 <= 0;
    hr_4 <= 0;
    hr_5 <= 0;
    hr_6 <= 0;
    hr_7 <= 0;
    hr_8 <= 0;
  end else begin
    hr_0 [D-1:0] <= {hr_0[D-2:0], data_in[0]};
    hr_1 [D-1:0] <= {hr_1[D-2:0], data_in[1]};
    hr_2 [D-1:0] <= {hr_2[D-2:0], data_in[2]};
    hr_3 [D-1:0] <= {hr_3[D-2:0], data_in[3]};
    hr_4 [D-1:0] <= {hr_4[D-2:0], data_in[4]};
    hr_5 [D-1:0] <= {hr_5[D-2:0], data_in[5]};
    hr_6 [D-1:0] <= {hr_6[D-2:0], data_in[6]};
    hr_7 [D-1:0] <= {hr_7[D-2:0], data_in[7]};
    hr_8 [D-1:0] <= {hr_8[D-2:0], data_in[8]};
  end
end

assign data_out[0] = hr_0[D-1]; assign data_out[1] = hr_1[D-1];
assign data_out[2] = hr_2[D-1]; assign data_out[3] = hr_3[D-1];
assign data_out[4] = hr_4[D-1]; assign data_out[5] = hr_5[D-1];
assign data_out[6] = hr_6[D-1]; assign data_out[7] = hr_7[D-1];
assign data_out[8] = hr_8[D-1];

endmodule
