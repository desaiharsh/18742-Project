import argparse
import numpy as np
from PIL import Image

def main(args):
	raw = None
	with open(args.img, 'r') as f:
		raw = map(lambda x: int(x) if len(x) > 0 else -1,
			f.read().replace('\n', ' ').split(' '))
		raw = filter(lambda x: x != -1, raw)

	data = np.array(raw, dtype=np.float32).reshape([28,28])
	data *= 255./4096
	print np.uint8(data)
	im = Image.fromarray(np.uint8(data))
	im.show()

if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument(
		'--img',
		type=str,
		help='Image to display')
	args = parser.parse_args()
	main(args)
