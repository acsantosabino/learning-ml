%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all;
%% Read Dataset
file = "../../data/car.csv";

x = readdataset(file, 7);
x = label_encode(x);
x = cell2mat(x);

%% Split train and test
slice = floor(length(x)*0.8);
y_train = x(1:slice,end);
x_train = x(1:slice,1:end-1)';

for n=1:size(x_train)(1)
  figure(n)
  b = unique(x_train(n,:));
  subplot(411)
  hist(x_train(n,y_train==1), b)
  subplot(412)
  hist(x_train(n,y_train==2), b)
  subplot(413)
  hist(x_train(n,y_train==3), b)
  subplot(414)
  hist(x_train(n,y_train==4), b)
end

y_test = x(slice+1:end,end);
x_test = x(slice+1:end,1:end-1)';

err = zeros(length(x_test),1);
ypred = zeros(length(x_test),1);

c = unique(y_train);

%% Estimate and Predict
model = estimator(x_train,y_train);  
ypred = predict(model, x_test);

%% Error Calcmodel.R
err = 0;
for i=1:length(c)
  err = err + sum(ypred(y_test==c(i))!=c(i));
endfor

%% Error Calcmodel.R
err = ypred!=y_test;

%% Results
printf ("Erro de %d em %d: %d%%\n", sum(err), length(y_test),
 100*(sum(err)/length(y_test)));
printf ("Acuracia de %d em %d: %d%%\n", length(y_test)-sum(err),
 length(y_test), 100*((length(y_test)-sum(err))/length(y_test)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all;
%% Read Dataset
file = "../../data/iris_rand.csv";

data = readdataset(file, 5);
x = zeros(size(data));
x(:,end) = cell2mat(label_encode(data(:,end)));

for i=1:size(data)(2)-1
  x(:,i) = str2double(data(:,i));
end

%% Split train and test
slice = floor(length(x)*0.8);
y_train = x(1:slice,end);
x_train = x(1:slice,1:end-1)';

for n=1:size(x_train)(1)
  figure(n)
  b = min(x_train(1,:));
  a = max(x_train(1,:));
  b = [b:(a-b)/10:a];
  subplot(311)
  hist(x_train(n,y_train==1), b)
  subplot(312)
  hist(x_train(n,y_train==2), b)
  subplot(313)
  hist(x_train(n,y_train==3), b)
end

y_test = x(slice+1:end,end);
x_test = x(slice+1:end,1:end-1)';

err = zeros(length(x_test),1);
ypred = zeros(length(x_test),1);

%% Estimate and Predict
model = estimator(x_train,y_train);  
ypred = predict(model, x_test);

%% Error Calcmodel.R
err = ypred!=y_test;

%% Results
printf ("Erro de %d em %d: %d%%\n", sum(err), length(y_test),
 100*(sum(err)/length(y_test)));
printf ("Acuracia de %d em %d: %d%%\n", length(y_test)-sum(err),
 length(y_test), 100*((length(y_test)-sum(err))/length(y_test)));
