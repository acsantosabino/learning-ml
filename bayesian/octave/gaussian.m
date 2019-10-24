%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all;
%% Read Dataset
file = "../../data/iris_rand.csv"

data = readdataset(file, 5);
x = zeros(size(data));
x(:,end) = cell2mat(label_encode(data(:,end)));
var_labels = {"SepalLengthCm","SepalWidthCm","PetalLengthCm","PetalWidthCm"};

for i=1:size(data)(2)-1
  x(:,i) = str2double(data(:,i));
end

%% Split train and test
slice = floor(length(x)*0.8) 
y_train = x(1:slice,end);
x_train = x(1:slice,1:end-1)';

y_test = x(slice+1:end,end);
x_test = x(slice+1:end,1:end-1)';

for n=1:size(x_train)(1)
  figure(n)
  b = min(x_train(n,:));
  a = max(x_train(n,:));
  b = [b:(a-b)/10:a];
  subplot(311)
  hist(x_train(n,y_train==1), b)
  ylabel("Numero de Iris-setosa")
  title(["Histograma ", var_labels{n}])
  subplot(312)
  hist(x_train(n,y_train==2), b)
  ylabel("Numero de Iris-versicolor")
  subplot(313)
  hist(x_train(n,y_train==3), b)
  ylabel("Numero de Iris-virginica")
  xlabel(["valor de ", var_labels{n}])
end

%% Estimate and Predict
model = estimator(x_train,y_train);
err = zeros(length(y_train),1);
ypred = predict(model, x_train);

%% Error Calcmodel.R
err = ypred!=y_train;

%% Results
printf ("Erro de %d em %d: %d%%\n", sum(err), length(y_train),
 100*(sum(err)/length(y_test)));
printf ("Acuracia de %d em %d: %d%%\n", length(y_train)-sum(err),
 length(y_train), 100*((length(y_train)-sum(err))/length(y_train)));

%% Error Calcmodel.R
err = zeros(length(x_test),1);
ypred = predict(model, x_test);

%% Error Calcmodel.R
err = ypred!=y_test;

%% Results
printf ("Erro de %d em %d: %d%%\n", sum(err), length(y_test),
 100*(sum(err)/length(y_test)));
printf ("Acuracia de %d em %d: %d%%\n", length(y_test)-sum(err),
 length(y_test), 100*((length(y_test)-sum(err))/length(y_test)));
