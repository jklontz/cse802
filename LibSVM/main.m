 clc;
 clear all;

 path = '../sift descriptors/Train Test Validate/';
% path = '../lbp descriptors/';
% path = '../gist descriptors/';
% path = '../color descriptors/';

[train_labels train_data] = libsvmread([path 'normalized_multiscale_sift_train.svm']);
[validate_labels validate_data] = libsvmread([path 'normalized_multiscale_sift_validate.svm']);

% Train the SVM 
  model = svmtrain(train_labels, train_data,'-c 2 -g 0.25 -b 1');

[~,~,p] = svmpredict(validate_labels, validate_data, model,'-b 1');
      
[~,class_t] = sort(p,2,'descend');
      
 ctr = 0;
 test_d = validate_labels;
 for u = 1:1:length(class_t)
       if(class_t(u,1)== test_d(u,1) || class_t(u,2) == test_d(u,1) || class_t(u,3) == test_d(u,1) || class_t(u,4) == test_d(u,1) || class_t(u,5) == test_d(u,1))
            ctr = ctr + 1;
       end
 end
      
 acc_svm = ctr/length(class_t);
