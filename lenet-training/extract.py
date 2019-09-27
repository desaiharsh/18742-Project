import sys

import numpy as np
import random
import matplotlib.pyplot as plt
import tensorflow as tf
import matplotlib.image as mpimg

from sklearn.utils import shuffle
from tensorflow.examples.tutorials.mnist import input_data
from tensorflow.contrib.layers import flatten
from PIL import Image

mnist = input_data.read_data_sets("MNIST_data/", reshape=False)
X_train, y_train           = mnist.train.images, mnist.train.labels
X_validation, y_validation = mnist.validation.images, mnist.validation.labels
X_test, y_test             = mnist.test.images, mnist.test.labels

assert(len(X_train) == len(y_train))
assert(len(X_validation) == len(y_validation))
assert(len(X_test) == len(y_test))

print()
print("Image Shape: {}".format(X_train[0].shape))
print()
print("Training Set:   {} samples".format(len(X_train)))
print("Validation Set: {} samples".format(len(X_validation)))
print("Test Set:       {} samples".format(len(X_test)))

# Pad images with 0s
X_train      = np.pad(X_train, ((0,0),(2,2),(2,2),(0,0)), 'constant')
X_validation = np.pad(X_validation, ((0,0),(2,2),(2,2),(0,0)), 'constant')
X_test       = np.pad(X_test, ((0,0),(2,2),(2,2),(0,0)), 'constant')
    
print("Updated Image Shape: {}".format(X_train[0].shape))

X_train, y_train = shuffle(X_train, y_train)

EPOCHS = 10
BATCH_SIZE = 128

def LeNet(x):	
	# Hyperparameters
	mu = 0
	sigma = 0.1
	layer_depth = {
		'layer_1' : 6,
		'layer_2' : 16,
		'layer_3' : 120,
		'layer_f1' : 84
	}
															
	# TODO: Layer 1: Convolutional. Input = 32x32x1. Output = 28x28x6.
	conv1_w = tf.Variable(tf.truncated_normal(shape = [5,5,1,6],mean = mu, stddev = sigma))
	conv1_b = tf.Variable(tf.zeros(6))
	conv1 = tf.nn.conv2d(x,conv1_w, strides = [1,1,1,1], padding = 'VALID') + conv1_b 
	# TODO: Activation.
	conv1 = tf.nn.relu(conv1)

	# TODO: Pooling. Input = 28x28x6. Output = 14x14x6.
	pool_1 = tf.nn.max_pool(conv1,ksize = [1,2,2,1], strides = [1,2,2,1], padding = 'VALID')
																								
	# TODO: Layer 2: Convolutional. Output = 10x10x16.
	conv2_w = tf.Variable(tf.truncated_normal(shape = [5,5,6,16], mean = mu, stddev = sigma))
	conv2_b = tf.Variable(tf.zeros(16))
	conv2 = tf.nn.conv2d(pool_1, conv2_w, strides = [1,1,1,1], padding = 'VALID') + conv2_b
	# TODO: Activation.
	conv2 = tf.nn.relu(conv2)

	# TODO: Pooling. Input = 10x10x16. Output = 5x5x16.
	pool_2 = tf.nn.max_pool(conv2, ksize = [1,2,2,1], strides = [1,2,2,1], padding = 'VALID') 
																																	
	# TODO: Flatten. Input = 5x5x16. Output = 400.
	fc1 = flatten(pool_2)
																																			
	# TODO: Layer 3: Fully Connected. Input = 400. Output = 120.
	fc1_w = tf.Variable(tf.truncated_normal(shape = (400,120), mean = mu, stddev = sigma))
	fc1_b = tf.Variable(tf.zeros(120))
	fc1 = tf.matmul(fc1,fc1_w) + fc1_b
																																
	# TODO: Activation.
	fc1 = tf.nn.relu(fc1)

	# TODO: Layer 4: Fully Connected. Input = 120. Output = 84.
	fc2_w = tf.Variable(tf.truncated_normal(shape = (120,84), mean = mu, stddev = sigma))
	fc2_b = tf.Variable(tf.zeros(84))
	fc2 = tf.matmul(fc1,fc2_w) + fc2_b
	# TODO: Activation.
	fc2 = tf.nn.relu(fc2)
																																				
	# TODO: Layer 5: Fully Connected. Input = 84. Output = 10.
	fc3_w = tf.Variable(tf.truncated_normal(shape = (84,10), mean = mu , stddev = sigma))
	fc3_b = tf.Variable(tf.zeros(10))
	logits = tf.matmul(fc2, fc3_w) + fc3_b
	return logits

x = tf.placeholder(tf.float32, (None, 32, 32, 1))
y = tf.placeholder(tf.int32, (None))
one_hot_y = tf.one_hot(y, 10)

rate = 0.001

logits1 = LeNet(x)
cross_entropy = tf.nn.softmax_cross_entropy_with_logits_v2(logits=logits1, labels=one_hot_y)
loss_operation = tf.reduce_mean(cross_entropy)
optimizer = tf.train.AdamOptimizer(learning_rate = rate)
training_operation = optimizer.minimize(loss_operation)

correct_prediction = tf.equal(tf.argmax(logits1, 1), tf.argmax(one_hot_y, 1))
accuracy_operation = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
saver = tf.train.Saver()

def evaluate(X_data, y_data):
	num_examples = len(X_data)
	total_accuracy = 0
	sess = tf.get_default_session()
	for offset in range(0, num_examples, BATCH_SIZE):
		batch_x, batch_y = X_data[offset:offset+BATCH_SIZE], y_data[offset:offset+BATCH_SIZE]
		accuracy = sess.run(accuracy_operation, feed_dict={x: batch_x, y: batch_y})
		total_accuracy += (accuracy * len(batch_x))
	return total_accuracy / num_examples


with tf.Session() as sess:
	saver = tf.train.import_meta_graph('lenet.meta')
	saver.restore(sess, tf.train.latest_checkpoint('./'))
	print("Model restored.\n")

	raw = None
	with open('test7.txt', 'r') as f:
		raw = map(lambda x: int(x) if len(x) > 0 else -1, 
			f.read().replace('\n', ' ').split(' '))
		raw = filter(lambda x: x != -1, raw)

	data = np.array(raw, dtype=np.float32).reshape([32, 32])
	data /= 16
	data = data.reshape([32,32,1])
	for i in range(32):
		for j in range(32):
			data[i][j][0] = 0 if data[i][j][0] > 128 else 255
			if i<2 or i>29 or j<2 or j>29:
				data[i][j][0] = 0

	im = Image.fromarray(np.uint8(data.reshape([32,32])))
	im.show()

	#x_load = mpimg.imread('test6.txt')
	y_load = 5
	for i in range(10):
		test_accuracy = evaluate([data], [i])
		print("Test Accuracy {}  = {:.3f}".format(i,test_accuracy))

	#data1 = data
	#import pdb; pdb.set_trace()	
	print()	
