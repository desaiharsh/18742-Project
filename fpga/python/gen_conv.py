import random
filters = [
    [
        [.1, .2, .3, .4, .5],
        [.6, .7, .8, .9, .10],
        [.11, .12, .13, .14, .15],
        [.16, .17, .18, .19, .20],
        [.21, .22, .23, .24, .25]
    ]
]

filters_0 = [
    [
        [random.random() for i in range(5)] for j in range(5)
    ] for f in range(6)
]

lines = []
with open('conv.v', 'r') as conv_file:
    lines = conv_file.readlines()

lines = [line.strip() for line in lines if not line.strip().startswith("//")]
start = 0
for line in lines:
    if line.startswith("reg signed [WP:0] weight_00 = "):
        break
    else:
        start += 1

weight_str = "reg signed [WP:0] weight_{}{} = 30'b{:030b}; "
with open('big_conv.v', 'w') as out_conv:
    filter_count = 0
    for filter in filters_0:
        lines[0] = "\nmodule conv0_{}(".format(filter_count)
        filter_count += 1
        for i in range(5):
            line = ""
            for j in range(5):
                w = int(filter[i][j] * 2**30)
                line += weight_str.format(i,j,w)
            lines[start+i] = line
        out_conv.write("\n".join(lines))

with open('layer_1.v','r') as layer:
    text = layer.read()
    with open('big_layer_1.v','w') as layer_out:
        for filter_count in range(len(filters_0)):
            layer_out.write(text.replace('module layer_1(','module layer_1_{}('.format(filter_count)).replace('conv CONV(', 'conv0_{} CONV('.format(filter_count)))

filters_1 = [
    [
        [random.random() for i in range(5)] for j in range(5)
    ] for f in range(16)
]

with open('big_conv.v', 'a') as out_conv:
    for layer1 in range(16):
        lines[0] = "\nmodule conv1_{}(".format(layer1)
        for i in range(5):
            line = ""
            for j in range(5):
                w = int(filters_1[layer1][i][j] * 2**30)
                line += weight_str.format(i,j,w)
            lines[start+i] = line
        out_conv.write("\n".join(lines))

layer_2 = """
module layer_2_{i}(
  input clk,
  input reset,
  input signed [PP:0] pxl_in,
  output signed [OP:0] pool1_{i}_out,
  output valid
);
  parameter PP = 8;
  parameter OP = 8;

  // parameterize output resolution between PP and CP (i.e. WP + PP)?
  wire signed [PP:0] conv1_{i}_out;
  wire conv1_{i}_valid;
  conv1_{i} #(.DIM(14)) CONV1_{i}(clk, reset, pxl_in, conv1_{i}_out, conv1_{i}_valid);

  wire pool1_{i}_clk;
  assign pool1_{i}_clk = clk && conv1_{i}_valid;
  wire pool1_{i}_valid;
  wire signed [PP:0] pool1_{i}_out;

  reg signed [5:0] pool1_{i}_row = -2;
  always @ (posedge clk) begin
    pool1_{i}_row <= pool1_{i}_row < 32-1 ? pool1_{i}_row + 1 : 0;
  end

  max_pool #(.DIM(10)) MAX_POOL(pool1_{i}_clk, reset, conv1_{i}_out, pool1_{i}_out, pool1_{i}_valid);

  wire pool1_{i}_out_clk;
  assign pool1_{i}_out_clk = pool1_{i}_clk && pool1_{i}_valid && (pool1_{i}_row >= 5-1);
  wire signed [PP:0] conv2_{i}_out;
endmodule // layer_1
"""

with open('layer_2.v','w') as layer:
    layer_2_out = ""
    for layer1 in range(16):
        layer_2_out += layer_2.format(i=layer1)

    layer.write(layer_2_out)
