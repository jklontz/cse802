% The main file

% The path of the WEKA jar
weka_path = '.\';

% Add the weka jar to the classpath
javaaddpath([weka_path 'weka.jar'],'-end');

% Import the necessities
import weka.classifiers.Classifier.*
import weka.classifiers.bayes.BayesNet.*
import weka.classifiers.Evaluation.*

% Classifier code
v1 = java.lang.String('-t');
v2 = java.lang.String([weka_path 'trainData.arff']);

v3 = java.lang.String('-T');
v4 = java.lang.String([weka_path 'testData.arff']);

prm = cat(1,v1,v2,v3,v4);

Evaluation.evaluateModel(javaObject('weka.classifiers.bayes.BayesNet'),prm);
