%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all;
%% Read Dataset
file = "../../data/Iris.csv";

x = readdataset(file, 6)(2:end,:);
x = x(randperm(length(x)),:);
y = x(2:end,6);
y(cellfun(@(x) isequal(x, "Iris-setosa"), y))=1;
y(cellfun(@(x) isequal(x, "Iris-versicolor"), y))=2;
y(cellfun(@(x) isequal(x, "Iris-virginica"), y))=3;
x = str2double(x(2:end,2:5))';
y = cell2mat(y);
c = unique(y);

%% Split train and test
x_train = x(:,1:119);
y_train = y(1:119);

x_test = x(:,120:end);
y_test = y(120:end);

%% Estimate and Predict
model = estimator(x_train,y_train);
ypred = predict(model, x_test);

%% Error Calcmodel.R
err = 0;
for i=1:length(c)
  err = err + sum(ypred(y_test==c(i))!=c(i));
endfor

printf ("Erro de %d em %d: %d%%\n", err, length(y_test), 100*(err/length(y_test)));