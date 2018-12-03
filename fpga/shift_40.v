// Shifts data by a fixed depth.
// Optimize in future by finding a way to create 2-d arrays

module shift_40
(
  input clk,
  input reset,
  input signed [39:0] data_in,
  output signed [39:0] data_out
);

// Depth = D = n-k;
parameter IMAGE_WIDTH = 28;
parameter KERNEL_WIDTH = 5;
parameter D = IMAGE_WIDTH - KERNEL_WIDTH;

// Define holding register for each bit
reg [D-1:0] hr_0;
reg [D-1:0] hr_1;
reg [D-1:0] hr_2;
reg [D-1:0] hr_3;
reg [D-1:0] hr_4;
reg [D-1:0] hr_5;
reg [D-1:0] hr_6;
reg [D-1:0] hr_7;
reg [D-1:0] hr_8;
reg [D-1:0] hr_9;
reg [D-1:0] hr_10;
reg [D-1:0] hr_11;
reg [D-1:0] hr_12;
reg [D-1:0] hr_13;
reg [D-1:0] hr_14;
reg [D-1:0] hr_15;
reg [D-1:0] hr_16;
reg [D-1:0] hr_17;
reg [D-1:0] hr_18;
reg [D-1:0] hr_19;
reg [D-1:0] hr_20;
reg [D-1:0] hr_21;
reg [D-1:0] hr_22;
reg [D-1:0] hr_23;
reg [D-1:0] hr_24;
reg [D-1:0] hr_25;
reg [D-1:0] hr_26;
reg [D-1:0] hr_27;
reg [D-1:0] hr_28;
reg [D-1:0] hr_29;
reg [D-1:0] hr_30;
reg [D-1:0] hr_31;
reg [D-1:0] hr_32;
reg [D-1:0] hr_33;
reg [D-1:0] hr_34;
reg [D-1:0] hr_35;
reg [D-1:0] hr_36;
reg [D-1:0] hr_37;
reg [D-1:0] hr_38;
reg [D-1:0] hr_39;

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
    hr_9 <= 0;
    hr_10 <= 0;
    hr_11 <= 0;
    hr_12 <= 0;
    hr_13 <= 0;
    hr_14 <= 0;
    hr_15 <= 0;
    hr_16 <= 0;
    hr_17 <= 0;
    hr_18 <= 0;
    hr_19 <= 0;
    hr_20 <= 0;
    hr_21 <= 0;
    hr_22 <= 0;
    hr_23 <= 0;
    hr_24 <= 0;
    hr_25 <= 0;
    hr_26 <= 0;
    hr_27 <= 0;
    hr_28 <= 0;
    hr_29 <= 0;
    hr_30 <= 0;
    hr_31 <= 0;
    hr_32 <= 0;
    hr_33 <= 0;
    hr_34 <= 0;
    hr_35 <= 0;
    hr_36 <= 0;
    hr_37 <= 0;
    hr_38 <= 0;
    hr_39 <= 0;
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
    hr_9 [D-1:0] <= {hr_9[D-2:0], data_in[9]};
    hr_10 [D-1:0] <= {hr_10[D-2:0], data_in[10]};
    hr_11 [D-1:0] <= {hr_11[D-2:0], data_in[11]};
    hr_12 [D-1:0] <= {hr_12[D-2:0], data_in[12]};
    hr_13 [D-1:0] <= {hr_13[D-2:0], data_in[13]};
    hr_14 [D-1:0] <= {hr_14[D-2:0], data_in[14]};
    hr_15 [D-1:0] <= {hr_15[D-2:0], data_in[15]};
    hr_16 [D-1:0] <= {hr_16[D-2:0], data_in[16]};
    hr_17 [D-1:0] <= {hr_17[D-2:0], data_in[17]};
    hr_18 [D-1:0] <= {hr_18[D-2:0], data_in[18]};
    hr_19 [D-1:0] <= {hr_19[D-2:0], data_in[19]};
    hr_20 [D-1:0] <= {hr_20[D-2:0], data_in[20]};
    hr_21 [D-1:0] <= {hr_21[D-2:0], data_in[21]};
    hr_22 [D-1:0] <= {hr_22[D-2:0], data_in[22]};
    hr_23 [D-1:0] <= {hr_23[D-2:0], data_in[23]};
    hr_24 [D-1:0] <= {hr_24[D-2:0], data_in[24]};
    hr_25 [D-1:0] <= {hr_25[D-2:0], data_in[25]};
    hr_26 [D-1:0] <= {hr_26[D-2:0], data_in[26]};
    hr_27 [D-1:0] <= {hr_27[D-2:0], data_in[27]};
    hr_28 [D-1:0] <= {hr_28[D-2:0], data_in[28]};
    hr_29 [D-1:0] <= {hr_29[D-2:0], data_in[29]};
    hr_30 [D-1:0] <= {hr_30[D-2:0], data_in[30]};
    hr_31 [D-1:0] <= {hr_31[D-2:0], data_in[31]};
    hr_32 [D-1:0] <= {hr_32[D-2:0], data_in[32]};
    hr_33 [D-1:0] <= {hr_33[D-2:0], data_in[33]};
    hr_34 [D-1:0] <= {hr_34[D-2:0], data_in[34]};
    hr_35 [D-1:0] <= {hr_35[D-2:0], data_in[35]};
    hr_36 [D-1:0] <= {hr_36[D-2:0], data_in[36]};
    hr_37 [D-1:0] <= {hr_37[D-2:0], data_in[37]};
    hr_38 [D-1:0] <= {hr_38[D-2:0], data_in[38]};
    hr_39 [D-1:0] <= {hr_39[D-2:0], data_in[39]};
  end
end

assign data_out[0] = hr_0[D-1];
assign data_out[1] = hr_1[D-1];
assign data_out[2] = hr_2[D-1];
assign data_out[3] = hr_3[D-1];
assign data_out[4] = hr_4[D-1];
assign data_out[5] = hr_5[D-1];
assign data_out[6] = hr_6[D-1];
assign data_out[7] = hr_7[D-1];
assign data_out[8] = hr_8[D-1];
assign data_out[9] = hr_9[D-1];
assign data_out[10] = hr_10[D-1];
assign data_out[11] = hr_11[D-1];
assign data_out[12] = hr_12[D-1];
assign data_out[13] = hr_13[D-1];
assign data_out[14] = hr_14[D-1];
assign data_out[15] = hr_15[D-1];
assign data_out[16] = hr_16[D-1];
assign data_out[17] = hr_17[D-1];
assign data_out[18] = hr_18[D-1];
assign data_out[19] = hr_19[D-1];
assign data_out[20] = hr_20[D-1];
assign data_out[21] = hr_21[D-1];
assign data_out[22] = hr_22[D-1];
assign data_out[23] = hr_23[D-1];
assign data_out[24] = hr_24[D-1];
assign data_out[25] = hr_25[D-1];
assign data_out[26] = hr_26[D-1];
assign data_out[27] = hr_27[D-1];
assign data_out[28] = hr_28[D-1];
assign data_out[29] = hr_29[D-1];
assign data_out[30] = hr_30[D-1];
assign data_out[31] = hr_31[D-1];
assign data_out[32] = hr_32[D-1];
assign data_out[33] = hr_33[D-1];
assign data_out[34] = hr_34[D-1];
assign data_out[35] = hr_35[D-1];
assign data_out[36] = hr_36[D-1];
assign data_out[37] = hr_37[D-1];
assign data_out[38] = hr_38[D-1];
assign data_out[39] = hr_39[D-1];

endmodule
