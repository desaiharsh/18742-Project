import numpy as np

import pickle

def unpickle(filename):
    with open(filename, 'rb') as pickled:
        return pickle.load(pickled)

conv1_b = unpickle("conv1_b.param")
conv1_md = unpickle("conv1_md.param")
conv1_mh = unpickle("conv1_mh.param")
conv1_mv = unpickle("conv1_mv.param")
conv1_wd = unpickle("conv1_wd.param")
conv1_wh = unpickle("conv1_wh.param")
conv1_wv = unpickle("conv1_wv.param")

conv1_w = [conv1_wd, conv1_wh, conv1_wv]
conv1_m = [conv1_md, conv1_mh, conv1_mv]

print conv1_b

for w, m in zip(conv1_w, conv1_m):
    pruned = w * m
    fixed = np.vectorize(lambda x: int(x*2**31))(pruned)
    print fixed
    print
