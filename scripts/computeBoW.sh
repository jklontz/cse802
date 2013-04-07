#!/bin/bash
if [ ! -f computeBoW.sh ]; then
  echo "Run this script from the scripts folder!"
  exit
fi

# Outputs a Weka compatible ARFF file
# Note: For efficiency we only train on every 20th image (step=20).
#       Training should take less than ten minutes.
br -algorithm "Open+LimitSize(128)+Grid(20,20)+SIFTDescriptor(12)+KMeans(1024)+CvtFloat+Hist(1024)" -train ~/cse802/images[step=20] -enroll ~/cse802/images bow.arff
