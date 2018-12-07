import numpy as np
# from PIL import Image

# filename = "train-images-idx3-ubyte"
kernel_size = 5
dim = 32
new_dim = dim - (kernel_size-1)
image_num = 0
# offset = 16 + dim*dim*image_num

# received = ""

# raw = [np.uint8(int(pixel, 10)) for pixel in received.strip().split()]
# raw = [np.uint8(0) for pixel in received.strip().split()]
# truncate until buffer is full.
# raw = raw[dim*(kernel_size-1) + kernel_size - 1:]
# raw = [raw[i] for i in range(len(raw)) if ((i % 28) <= (28-kernel_size))]
# raw_image = np.array(raw, dtype=np.uint8).reshape([new_dim,new_dim])
# im = Image.fromarray(raw_image)
# im.show()

out_bits = 8
out_mask = (1<<(out_bits)) - 1
weight_bits = 30
weight_mask = (1<<(weight_bits)) - 1

def conv_kernel(image_stream):
    buffer = [0] * (dim*(kernel_size-1) + kernel_size)
    output = []
    for pixel in image_stream:
        buffer[-1] = pixel
        conv = sum([
            buffer[0*dim + 1] * weight_mask
        ])
        conv = (conv >> weight_bits)
        conv &= conv & out_mask

        output += [conv]

        for i in range(len(buffer)-1):
            buffer[i] = buffer[i+1]

    return output

def max_pool(image, dim, stride=2):
    out_matrix = []
    for i in range(0,dim,stride):
        for j in range(0,dim,stride):
            out_matrix.append(max(
                [
                    image[(i+0)*dim + (j+0)],
                    image[(i+0)*dim + (j+1)],
                    image[(i+1)*dim + (j+0)],
                    image[(i+1)*dim + (j+1)]
                ]
            ))
    return out_matrix
#TODO: will need to pad input image from file to 32x32
# with open(filename, "rb") as image_file:
#     image_file.seek(offset)
#     raw = [np.uint8(pixel) for pixel in image_file.read(dim*dim)]
#
#     golden = conv_kernel(raw)
#
#     # import pdb; pdb.set_trace()
#     # truncate values to only after pixel buffer is full.
#     golden = golden[dim*(kernel_size-1) + kernel_size - 1:]
#     golden = [golden[i] for i in range(len(golden)) if ((i % 28) <= (28-kernel_size))]
#     image = np.array(golden, dtype=np.uint8).reshape([new_dim,new_dim])
#
#
#     for i in range(new_dim):
#         # print(" ".join([str(raw_image[i][j] - image[i][j]) for j in range(new_dim)]))
#         print(" ".join(["{:3}".format(image[i][j]) for j in range(new_dim)]))
#
#     # im = Image.fromarray(image)
#     # im.show()

golden = conv_kernel([x+1 for x in range(dim*dim)])
golden = golden[dim*(kernel_size-1) + kernel_size - 1:]
golden = [golden[i] for i in range(len(golden)) if ((i % dim) <= (dim-kernel_size))]

golden = max_pool(golden,new_dim,2)
new_dim = new_dim >> 1

image = np.array(golden, dtype=np.uint8).reshape([new_dim, new_dim])



for i in range(new_dim):
    # print(" ".join([str(raw_image[i][j] - image[i][j]) for j in range(new_dim)]))
    print(" ".join(["{:3}".format(image[i][j]) for j in range(new_dim)]))
