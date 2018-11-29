
header = 16 # bytes before the first image
num_images = 20 # images to dump
dim = 28 # images input dimension, HxW
for index in range(num_images):
    with open('train-images-idx3-ubyte', 'rb') as images:
        images.seek(header + index*dim*dim)
        image = images.read(dim*dim)
        with open('image_{}.hex'.format(index), 'w') as image_out:
            for i in range(dim):
                # image_out.write('{:02x} '.format(image[i]))
                # print(" ".join(['{:02x}'.format(ord(pixel)) for pixel in image[i*dim:(i+1)*dim]]))
                image_out.write(" ".join(['{:02x}'.format(ord(pixel)) for pixel in image[i*dim:(i+1)*dim]]))
                image_out.write('\n')
