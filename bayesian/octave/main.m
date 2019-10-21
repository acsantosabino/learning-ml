%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all;
%% Read Dataset
file = "../../data/car.csv";

x = readdataset(file, 7);
x = lable_encode(x);
x = cell2mat(x);

%% Split train and test
slice = floor(length(x)*0.8)
y_train = x(1:slice,end);
x_train = x(1:slice,1:end-1)';

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
x(:,end) = cell2mat(lable_encode(data(:,end)));

for i=1:size(data)(2)-1
  x(:,i) = str2double(data(:,i));
end

%% Split train and test
slice = floor(length(x)*0.8);
y_train = x(1:slice,end);
x_train = x(1:slice,1:end-1)';

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
