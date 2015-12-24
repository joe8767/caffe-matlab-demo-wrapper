#!/bin/bash
# Caffe matlab interface demo wrapper
# The matlab interface provided by caffe can not run directly
# Before running this scipt, make sure that you have Cuda, Caffe installed correctly, and matcaffe compiled successfully.
# bvlc_reference_caffenet.caffemodel should have downloaded.
# Feel free to change the $CUDA_LIB and $LD_PRELOAD according to your system environment.

matlab_exec=matlab

CUDA_LIB=/usr/local/cuda-7.5/lib64
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

LD_LIBRARY_PATH=$CUDA_LIB:$LD_PRELOAD:$LD_LIBRARY_PATH ${matlab_exec} -nojvm -nodesktop -nosplash -r "\
im = imread('../../examples/images/cat.jpg');\
scores = classification_demo(im, 1);\
[score, class] = max(scores); \
fprintf('score:%f\n', score);\
fprintf('class:%d\n', class);\
exit;"
