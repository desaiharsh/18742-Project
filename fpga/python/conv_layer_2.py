template = """
wire layer_2_0_clk = pixel_clock && layer_1_0_valid; // TODO: is this right?
wire signed [8:0] layer_2_0_out;
wire signed [8:0] layer_2_0_0_out;
wire signed [8:0] layer_2_0_1_out;
wire signed [8:0] layer_2_0_2_out;
layer_2_0 LAYER_2_0_0 (layer_2_0_clk, ~SSEL_active, layer_1_0_out, layer_2_0_0_out, layer_2_0_0_valid);
layer_2_0 LAYER_2_0_1 (layer_2_0_clk, ~SSEL_active, layer_1_1_out, layer_2_0_1_out, layer_2_0_1_valid);
layer_2_0 LAYER_2_0_2 (layer_2_0_clk, ~SSEL_active, layer_1_2_out, layer_2_0_2_out, layer_2_0_2_valid);
assign layer_2_0_out = layer_2_0_0_out + layer_2_0_1_out + layer_2_0_2_out;
"""

table = [
    [0,1,2],
    [1,2,3],
    [2,3,4],
    [3,4,5],
    [0,4,5],
    [0,1,5],
    [0,1,2,3],
    [1,2,3,4],
    [2,3,4,5],
    [3,4,5,0],
    [4,5,0,1],
    [5,0,1,2],
    [0,1,3,4],
    [1,2,4,5],
    [0,2,3,5],
    [0,1,2,3,4,5]
]
build = ""
for filter in range(len(table)):
    # TODO: fix this
    build += "wire layer_2_{i}_clk = pixel_clock && layer_1_0_valid;\n".format(i=filter)
    build += "wire signed [8:0] layer_2_{i}_out;\n".format(i=filter)
    build += "\n".join(["wire signed [8:0] layer_2_{i}_{j}_out; wire layer_2_{i}_{j}_valid;".format(j=j,i=filter) for j in table[filter]])
    build += "\n"
    build += "\n".join(["layer_2_{i} LAYER_2_{i}_{j} (layer_2_{i}_clk, ~SSEL_active, layer_1_{j}_out, layer_2_{i}_{j}_out, layer_2_{i}_{j}_valid);".format(j=j,i=filter) for j in table[filter]])
    build += "\n"
    build += "assign layer_2_{i}_out = ".format(i=filter) + " + ".join(["layer_2_{i}_{j}_out".format(j=j,i=filter) for j in table[filter]])
    build += ";\nwire pool2_{i}_clk;\nassign pool2_{i}_clk = layer_2_{i}_clk && layer_2_{i}_{j}_valid;\n".format(i=filter, j=table[filter][0])
    build += "wire signed [8:0] pool2_{i}_out;\n".format(i=filter)
    build += "wire pool2_{i}_valid;\nmax_pool #(.DIM(10)) MAX_POOL_2_{i}(pool2_{i}_clk, ~SSEL_active, layer_2_{i}_out, pool2_{i}_out, pool2_{i}_valid);\n\n".format(i=filter)

with open('layer_2_stuff.txt','w') as out:
    out.write(build)
# print(build)
