import numpy as np
from PIL import Image

filename = "train-images-idx3-ubyte"
kernel_size = 5
dim = 28
new_dim = dim - (kernel_size-1)
image_num = 0
offset = 16 + dim*dim*image_num

# received = ""

# raw = [np.uint8(int(pixel, 10)) for pixel in received.strip().split()]
# raw = [np.uint8(0) for pixel in received.strip().split()]
# truncate until buffer is full.
# raw = raw[dim*(kernel_size-1) + kernel_size - 1:]
# raw = [raw[i] for i in range(len(raw)) if ((i % 28) <= (28-kernel_size))]
# raw_image = np.array(raw, dtype=np.uint8).reshape([new_dim,new_dim])
# im = Image.fromarray(raw_image)
# im.show()

def conv_kernel(image_stream):
    buffer = [0] * (dim*(kernel_size-1) + kernel_size)
    output = []
    for pixel in image_stream:
        buffer[-1] = pixel
        conv = sum([

        # (buffer[0*dim + 0] % 256) * -1,
        # (buffer[0*dim + 1] % 256) * 1,
        # (buffer[0*dim + 1] % 256) * -1,
        # (buffer[0*dim + 2] % 256) * -1,
        # (buffer[0*dim + 3] % 256) * 1,
        # (buffer[0*dim + 4] % 256) * -1,
        # EDGE DETECTION
            (buffer[0*dim + 0] % 256) * -1,
            (buffer[1*dim + 1] % 256) * -2,
            (buffer[2*dim + 2] % 256) * 6,
            (buffer[3*dim + 3] % 256) * -2,
            (buffer[4*dim + 4] % 256) * -1,
        ])


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
#
#     # im = Image.fromarray(image)
#     # im.show()

# golden = conv_kernel([x+7 for x in range(dim*dim)])
# golden = golden[dim*(kernel_size-1) + kernel_size - 1:]
# golden = [golden[i] for i in range(len(golden)) if ((i % 28) <= (28-kernel_size))]
#
# image = np.array(golden, dtype=np.uint8).reshape([new_dim, new_dim])
#
# for i in range(new_dim):
#     # print(" ".join([str(raw_image[i][j] - image[i][j]) for j in range(new_dim)]))
#     print(" ".join(["{:3}".format(image[i][j]) for j in range(new_dim)]))
