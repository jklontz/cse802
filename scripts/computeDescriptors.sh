#!/bin/bash
if [ ! -f computeDescriptors.sh ]; then
  echo "Run this script from the scripts folder!"
  exit
fi

# Outputs Matlab compatible files

br -algorithm "Open+LimitSize(128)+(Grid(15,15)+SIFTDescriptor(16))/(Grid(10,10)+SIFTDescriptor(24))/(Grid(5,5)+SIFTDescriptor(48))+CatRows+KMeans(1024)+CvtFloat+Hist(1024)" -train ~/cse802/images[step=5] -enroll ~/cse802/images "multiscale_sift_train.matrix(mat)" -enroll ~/cse802/validation "multiscale_sift_validate.matrix(mat)" -enroll ~/cse802/test "multiscale_sift_test.matrix(mat)"

#br -algorithm "Open+LimitSize(130)+Cvt(Gray)+Blur(1.1)+Gamma(0.2)+DoG(1,2)+ContrastEq(0.1,10)+LBP(1,2)+Crop(1,1,-1,-1)+RectRegions(16,16,8,8)+Hist(59)+CatRows+KMeans(1024)+CvtFloat+Hist(1024)+Normalize(L1)" -train ~/cse802/images[step=5] -enroll ~/cse802/images "normalized_lbp_train.matrix(mat)" -enroll ~/cse802/validation "normalized_lbp_validate.matrix(mat)" -enroll ~/cse802/test "normalized_lbp_test.matrix(mat)"

#br -algorithm "Open+LimitSize(130)+Cvt(Gray)+LBP(1,2)+Crop(1,1,-1,-1)+RectRegions(16,16,8,8)+Hist(59)+CatRows+KMeans(1024)+CvtFloat+Hist(1024)+Normalize(L1)" -train ~/cse802/images[step=5] -enroll ~/cse802/images "lbp_train.matrix(mat)" -enroll ~/cse802/validation "lbp_validate.matrix(mat)" -enroll ~/cse802/test "lbp_test.matrix(mat)"

#br -algorithm "Open+LimitSize(128)+Grid(10,10)+SIFTDescriptor(24)+KMeans(1024)+CvtFloat+Hist(1024)" -train ~/cse802/images[step=5] -enroll ~/cse802/images "1_10x10_24_train.matrix(mat)" -enroll ~/cse802/validation "1_10x10_24_validate.matrix(mat)" -enroll ~/cse802/test "1_10x10_24_test.matrix(mat)"
#br -algorithm "Open+LimitSize(128)+Grid(12,12)+SIFTDescriptor(20)+KMeans(1024)+CvtFloat+Hist(1024)" -train ~/cse802/images[step=5] -enroll ~/cse802/images "1_12x12_20_train.matrix(mat)" -enroll ~/cse802/validation "1_12x12_20_validate.matrix(mat)" -enroll ~/cse802/test "1_12x12_20_test.matrix(mat)"
#br -algorithm "Open+LimitSize(128)+Grid(8,8)+SIFTDescriptor(28)+KMeans(1024)+CvtFloat+Hist(1024)" -train ~/cse802/images[step=5] -enroll ~/cse802/images "1_8x8_28_train.matrix(mat)" -enroll ~/cse802/validation "1_8x8_28_validate.matrix(mat)" -enroll ~/cse802/test "1_8x8_28_test.matrix(mat)"
