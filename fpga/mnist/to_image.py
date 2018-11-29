import numpy as np
from PIL import Image

filename = "train-images-idx3-ubyte"
kernel_size = 5
dim = 28
new_dim = dim - (kernel_size-1)
image_num = 0
offset = 16 + dim*dim*image_num

received = """
0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	4	245	245	245	137	127	88	237	97	8	16	137	0	0	0	0
0	0	0	0	0	0	0	7	233	227	169	109	93	10	10	10	10	10	38	91	10	21	68	192	0	0	0	0
0	0	0	0	0	0	7	214	25	10	10	10	10	10	10	10	10	12	170	181	181	207	225	0	0	0	0	0
0	0	0	0	0	0	7	245	44	10	10	10	10	10	65	81	16	23	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	7	183	107	156	10	10	58	253	7	220	110	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	7	250	6	109	10	174	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	7	124	10	74	6	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	7	252	73	10	194	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	7	228	22	38	103	156	7	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	7	182	23	10	10	144	239	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	7	218	77	10	10	113	237	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	7	247	170	11	10	77	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	7	14	10	14	192	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	7	217	133	80	10	10	57	6	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	7	224	115	34	10	10	10	13	82	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	7	239	149	42	10	10	10	10	62	186	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	7	240	197	50	10	10	10	10	65	183	6	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	7	245	92	44	10	10	10	10	68	183	255	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	7	208	91	37	10	10	10	10	19	130	253	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	7	127	10	10	10	51	128	131	240	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	7


"""

raw = [np.uint8(int(pixel, 10)) for pixel in received.strip().split()]
# raw = [np.uint8(0) for pixel in received.strip().split()]
# truncate until buffer is full.
raw = raw[dim*(kernel_size-1) + kernel_size - 1:]
raw = [raw[i] for i in range(len(raw)) if ((i % 28) <= (28-kernel_size))]
raw_image = np.array(raw, dtype=np.uint8).reshape([new_dim,new_dim])
# im = Image.fromarray(raw_image)
# im.show()

def conv_kernel(image_stream):
    buffer = [0] * (dim*(kernel_size-1) + kernel_size)
    output = []
    for pixel in image_stream:
        conv = sum([
            buffer[0*28 + 0] * -1,
            buffer[1*28 + 1] * -2,
            buffer[2*28 + 2] * 6,
            buffer[3*28 + 3] * -2,
            buffer[4*28 + 4] * -1,
        ])
        # conv_out = max(
        #     min(
        #         conv,
        #         255
        #     ),
        #     0
        # )
        conv = 255 if conv > 255 else conv;
        conv_out = 0 if conv < 0 else conv;

        # conv_out = (buffer[2*28 + 2] * 6) % 256\
        #     - (buffer[1*28 + 1] << 1) % 256\
        #     - (buffer[3*28 + 3] << 1) % 256\
        #     - (buffer[0*28 + 0]) % 256\
        #     - (buffer[4*28 + 4]) % 256

        # conv_out = buffer[-1] * -1

        conv_out = conv_out % 256

        output += [conv_out]

        for i in range(len(buffer)-1):
            buffer[i] = buffer[i+1]

        buffer[-1] = pixel

    return output

with open(filename, "rb") as image_file:
    image_file.seek(offset)
    raw = [np.uint8(pixel) for pixel in image_file.read(dim*dim)]

    golden = conv_kernel(raw)

    # import pdb; pdb.set_trace()
    # truncate values to only after pixel buffer is full.
    golden = golden[dim*(kernel_size-1) + kernel_size - 1:]
    golden = [golden[i] for i in range(len(golden)) if ((i % 28) <= (28-kernel_size))]
    image = np.array(golden, dtype=np.uint8).reshape([new_dim,new_dim])


    for i in range(new_dim):
        # print(" ".join([str(raw_image[i][j] - image[i][j]) for j in range(new_dim)]))
        print(" ".join(["{:3}".format(image[i][j]) for j in range(new_dim)]))

    im = Image.fromarray(image)
    im.show()
