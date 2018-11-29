import numpy as np
from PIL import Image

filename = "train-images-idx3-ubyte"
outfile = "image0.png"
dim = 28

for image_num in range(20):
    offset = 16 + dim*dim*image_num
    with open(filename, "rb") as image_file:
        image_file.seek(offset)
        raw = [np.uint8(pixel) for pixel in image_file.read(dim*dim)]

        image = np.array(raw, dtype=np.uint8).reshape([dim,dim])

        with open("SendImages/image_{}.h".format(image_num), "w") as header_file:
            header_file.write("unsigned char image[28*28] = {{\n{}\n}};".format(
                "\n".join(["".join([str(pixel) + ", " +  " "*(3-len(str(pixel))) for pixel in row])for row in image])
            ))

        # im = Image.fromarray(image)
        # im.show()
