#!/bin/bash
if [ ! -f computeDescriptors.sh ]; then
  echo "Run this script from the scripts folder!"
  exit
fi

# Outputs a Weka compatible ARFF file
# Warning: Each template is 20*20*128 dimensions so this will take a long time and produce a huge file!
br -algorithm "Open+LimitSize(128)+Grid(20,20)+SIFTDescriptor(12)" -enroll ../images descriptors.arff
