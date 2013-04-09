clear all;
clc;

javaaddpath('weka.jar');

trainPath = 'descriptors.arff';
% train = loadARFF(trainPath);

% test = loadArff('testing.arff');

% Initialize the classifier
classifierOptions = {'-D'};
wekaClassifier = initWekaClassifier('bayes.NaiveBayes', classifierOptions);
% nb = trainWekaClassifier(train,'bayes.NaiveBayes');

% Initialize the evaluation class and evaluate the classifier
evaluateOptions = {'-t',trainPath};
s = weka.classifiers.Evaluation.evaluateModel(wekaClassifier,evaluateOptions);

% Display the results
disp(s);

%Test the classifier
% predicted = wekaClassify(test,wekaClassifier);