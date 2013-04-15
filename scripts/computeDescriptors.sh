#!/bin/bash
if [ ! -f computeDescriptors.sh ]; then
  echo "Run this script from the scripts folder!"
  exit
fi

# Outputs a Matlab compatible files
br -algorithm "Open+LimitSize(128)+Subdivide+Grid(7,7)+SIFTDescriptor(8)+KMeans(1024)+CvtFloat+Hist(1024)+Cat" -train ~/cse802/images[step=10] -enroll ~/cse802/images "4_7x7_8.matrix(mat)"
br -algorithm "Open+LimitSize(128)+Subdivide+Grid(4,4)+SIFTDescriptor(12)+KMeans(1024)+CvtFloat+Hist(1024)+Cat" -train ~/cse802/images[step=7] -enroll ~/cse802/images "4_4x4_12.matrix(mat)"
br -algorithm "Open+LimitSize(128)+Subdivide+Grid(2,2)+SIFTDescriptor(16)+KMeans(1024)+CvtFloat+Hist(1024)+Cat" -train ~/cse802/images[step=5] -enroll ~/cse802/images "4_2x2_16.matrix(mat)"
br -algorithm "Open+LimitSize(128)+Grid(20,20)+SIFTDescriptor(12)+KMeans(1024)+CvtFloat+Hist(1024)" -train ~/cse802/images[step=10] -enroll ~/cse802/images "1_20x20_12.matrix(mat)"
br -algorithm "Open+LimitSize(128)+Grid(10,10)+SIFTDescriptor(24)+KMeans(1024)+CvtFloat+Hist(1024)" -train ~/cse802/images[step=7] -enroll ~/cse802/images "1_10x10_24.matrix(mat)"
br -algorithm "Open+LimitSize(128)+Grid(5,5)+SIFTDescriptor(36)+KMeans(1024)+CvtFloat+Hist(1024)" -train ~/cse802/images[step=5] -enroll ~/cse802/images "1_5x5_36.matrix(mat)"
