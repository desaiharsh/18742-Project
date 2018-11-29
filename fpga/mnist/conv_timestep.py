
dim = 28
kernel_size = 5
buffer = [None] * (dim * (kernel_size-1) + kernel_size)

def shift_insert(in_pixel):
    for i in range(len(buffer)-1):
        buffer[i] = buffer[i+1]
    buffer[-1] = in_pixel

def print_buffer():
    for i in range(kernel_size-1):
        print(" ".join([str(pixel) for pixel in buffer[i*dim:(i+1)*dim]]))

    print(" ".join([str(pixel) for pixel in buffer[(kernel_size-1)*dim:]]))

for i in range(28*4+5):
    shift_insert((int(i/28),i%28))
print_buffer()
