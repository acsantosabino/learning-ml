%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Naive Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Avaliação de carros
%
% Categorias: unacc, acc, good, vgood
%
% Variaveis:
%   buying: vhigh, high, med, low.
%   maint: vhigh, high, med, low.
%   doors: 2, 3, 4, 5more.
%   persons: 2, 4, more.
%   lug_boot: small, med, big.
%   safety: low, med, high.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

function f = text_filter(a, t)
  f = cellfun(@(x) isequal(x, t ), a);
endfunction

%% Read Dataset
file = "../../data/car.csv";
x = readdataset(file,7);

slice = floor(length(x)*0.8)
y_train = x(1:slice,end);
x_train = x(1:slice,1:end-1);

y_test = x(slice+1:end,end);
x_test = x(slice+1:end,1:end-1);

err = zeros(length(x_test),1);
ypred = zeros(length(x_test),1);

%% Predict
for k = 1:length(x_test)
  c = unique(y_train);
  p = zeros(1,length(c));

  for i=1:length(c)
    p(i) = sum(text_filter(y_train,c{i}))/length(y_train);

    for j=1:size(x_train)(2)
      p(i) = p(i) * sum(text_filter(x_train(text_filter(y_train,c{i}), j),x_test{k,j}))/sum(text_filter(y_train,c{i}));
    endfor
    
  endfor

  p = p/sum(p);
  
  [v,index] = max(p);
  ypred(k) = index;
  err(k) = ~isequal(y_test{k}, c{index});
endfor

%% Results
printf ("Erro de %d em %d: %d%%\n", sum(err), length(y_test), 100*(sum(err)/length(y_test)));
printf ("Acuracia de %d em %d: %d%%\n", length(y_test)-sum(err), length(y_test), 100*((length(y_test)-sum(err))/length(y_test)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear -v;

%% Read Dataset
file = "../../data/iris_rand.csv";
x = readdataset(file,5);

slice = floor(length(x)*0.8)
y_train = x(1:slice,end);
x_train = x(1:slice,1:end-1);

y_test = x(slice+1:end,end);
x_test = x(slice+1:end,1:end-1);

err = zeros(length(x_test),1);
ypred = zeros(length(x_test),1);

%% Predict
for k = 1:length(x_test)
  c = unique(y_train);
  p = zeros(1,length(c));

  for i=1:length(c)
    p(i) = sum(text_filter(y_train,c{i}))/length(y_train);

    for j=1:size(x_train)(2)
      p(i) = p(i) * sum(text_filter(x_train(text_filter(y_train,c{i}), j),x_test{k,j}))/sum(text_filter(y_train,c{i}));
    endfor
    
  endfor

  p = p/sum(p);
  
  [v,index] = max(p);
  ypred(k) = index;
  err(k) = ~isequal(y_test{k}, c{index});
endfor

%% Results
printf ("Erro de %d em %d: %d%%\n", sum(err), length(y_test), 100*(sum(err)/length(y_test)));
printf ("Acuracia de %d em %d: %d%%\n", length(y_test)-sum(err), length(y_test), 100*((length(y_test)-sum(err))/length(y_test)));
