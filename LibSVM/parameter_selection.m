clear all;
clc;

path = 'training_20X20_12.svm';

[TrainVec TrainLabel] = libsvmread(path);

% Number of folds
folds = 5; 

bestcv = 0;
for log2c = -5:2:15,
  for log2g = -5:-2:-10,
    cmd = ['-v 5 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
    cv = svmtrain(TrainLabel, TrainVec, cmd);
    if (cv >= bestcv),
      bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
    end
    fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
  end
end