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

filters = [
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
    for filter in filters:
        lines[0] = "\nmodule conv_{}(".format(filter_count)
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
        for filter_count in range(len(filters)):
            layer_out.write(text.replace('module layer_1(','module layer_1_{}('.format(filter_count)).replace('conv CONV(', 'conv_{} CONV('.format(filter_count)))
