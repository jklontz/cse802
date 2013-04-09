function wekaClassifier = initWekaClassifier(type,options)
% Initialize a weka classifier.
%
% type    -  A string naming the type of classifier to train relative to
%            the weka.classifiers package. There are many options - see
%            below for a few. See the weka documentation for the rest. 
%
% options - an optional cell array of strings listing the options specific
%           to the classifier. See the weka documentation for details. 
%
% Example: 
% wekaClassifier = initWekaClassifier('bayes.NaiveBayes',{'-D'});
%
% List of a few selected weka classifiers - there are many many more:
% 
% bayes.BayesNet
% bayes.NaiveBayes
% bayes.NaiveBayesMultinomial
% bayes.HNB
% functions.GaussianProcesses
% functions.IsotonicRegression
% functions.Logistic
% functions.MultilayerPerceptron
% functions.RBFNetwork
% functions.SVMreg
% lazy.IBk
% lazy.LBR
% misc.HyperPipes
% trees.RandomForest
% ...
% Edited: Sunpreet Arora

    if(~wekaPathCheck),wekaClassifier = []; return,end
    wekaClassifier = javaObject(['weka.classifiers.',type]);
    if(nargin == 3 && ~isempty(options))
        wekaClassifier.setOptions(options);
    end
end