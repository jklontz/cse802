#!/bin/bash
if [ ! -f evaluate1NN.sh ]; then
  echo "Run this script from the scripts folder!"
  exit
fi

# Trains and evaluate accuracy of a 1NN classifier using SIFT+BoW
# Note: For efficiency we only train on every 20th image (step=20).
#       Training should take less than ten minutes.
br -algorithm "Open+LimitSize(128)+Grid(19,19)+SIFTDescriptor(12)+KMeans(1024)+CvtFloat+Hist(1024):Dist(L1)" -train ~/cse802/images[step=20] -compare ~/cse802/images[step=20] . 1nn.eval

# If you have an R installation with the packages listed here (http://openbiometrics.org/doxygen/latest/group__c__sdk.html#gabec0aefff3b26efeb677b958bc4f554c) you can plot a ROC curve:
br -plot 1nn.csv 1nn.pdf
