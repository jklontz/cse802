% One-vs-One LibSVM
clc;
clear all;

[species meas] = libsvmread('training_5X5_36.svm');

K = 5;
  
  indices = crossvalind('Kfold',species,K);
  
%% One-vs-all SVM (custom)

 for i=1:K
     
      test = (indices == i); train = ~test;
      
      % one vs all logic
      u=unique(species(train,:)); 
      N=length(u);
      if(N>2)    
          itr=1;    
          classes=0;   
          while((classes~=1)&&(itr<=length(u)))   
            c1=(species(train,:)==u(itr));    
            newClass=double(c1); 
            tst = double((species(test,:) == itr));
            model = svmtrain(newClass, meas(train,:),'-b 1 -g 1');
            [~,~,p] = svmpredict(tst, meas(test,:), model,'-b 1');
            prob(:,itr) = p(:,model.Label==1);    %# probability of class==k
            itr=itr+1;
          end
          itr=itr-1;
      end
     
      [~,class_t] = sort(prob,2,'descend');
      
      ctr = 0;
      test_d = species(test,:);
      for u = 1:1:4207
            if(class_t(u,1)== test_d(u,1) || class_t(u,2) == test_d(u,1) || class_t(u,3) == test_d(u,1) || class_t(u,4) == test_d(u,1) || class_t(u,5) == test_d(u,1))
            ctr = ctr + 1;
            end
      end
      
      acc_svm(i) = ctr/length(class);
 end
 
    avg_acc_svm = mean(acc_svm);
    var_acc_svm = var(acc_svm);
