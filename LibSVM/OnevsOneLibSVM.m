% One-vs-One LibSVM
clc;
clear all;

g_value = 'default';
path = '../sift descriptors/Train Test Validate/gist.svm';

[species meas] = libsvmread(path);

% Majority voting based one-vs-one SVM (inbuilt)
 K = 5;
  
  indices = crossvalind('Kfold',species,K);
  
for i = 1:K
      
      test = (indices == i); train = ~test;
      
       model = svmtrain(species(train,:), meas(train,:),'-b 1');
       [~,~,p] = svmpredict(species(test,:), meas(test,:), model,'-b 1');
      
      [~,class_t] = sort(p,2,'descend');
      
      ctr = 0;
      test_d = species(test,:);
      for u = 1:1:length(class_t)
            if(class_t(u,1)== test_d(u,1) || class_t(u,2) == test_d(u,1) || class_t(u,3) == test_d(u,1) || class_t(u,4) == test_d(u,1) || class_t(u,5) == test_d(u,1))
            ctr = ctr + 1;
            end
      end
      
      acc_svm(i) = ctr/length(class_t);
end
  
  avg_acc_svm = mean(acc_svm);
  var_acc_svm = var(acc_svm);
  