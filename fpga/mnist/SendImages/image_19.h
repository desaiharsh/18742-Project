unsigned char image[28*28] = {
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   18,  105, 227, 253, 253, 122, 0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   57,  199, 253, 252, 252, 252, 252, 159, 0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   20,  211, 252, 232, 152, 73,  167, 252, 215, 6,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   197, 252, 182, 0,   0,   0,   37,  235, 243, 47,  0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   188, 252, 103, 0,   0,   0,   37,  235, 229, 27,  0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   189, 253, 86,  8,   43,  139, 190, 211, 45,  0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   232, 252, 200, 201, 252, 252, 84,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   213, 245, 252, 253, 252, 242, 42,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   56,  84,  253, 252, 160, 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   45,  253, 252, 38,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   89,  255, 253, 38,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   80,  253, 189, 32,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   41,  179, 232, 84,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   15,  225, 252, 115, 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   153, 252, 164, 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   68,  245, 243, 79,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   32,  237, 245, 82,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   9,   148, 252, 169, 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   106, 253, 196, 7,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   54,  228, 129, 28,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   
};