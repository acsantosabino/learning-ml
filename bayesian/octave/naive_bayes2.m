%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         Naive Bayesian - Arthur Santos                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

function f = text_filter(a, t)
  f = cellfun(@(x) isequal(x, t ), a);
endfunction

%% Read Dataset
file = "../../data/iris_rand_cat.csv";
x = readdataset(file,5);

slice = floor(length(x)*0.8)
y_train = x(1:slice,end);
x_train = x(1:slice,1:end-1);

y_test = x(slice+1:end,end);
x_test = x(slice+1:end,1:end-1);

err = zeros(length(x_test),1);
ypred = zeros(length(x_test),1);

%% Predict
for k = 1:length(x_train)
  c = unique(y_train);
  p = zeros(1,length(c));

  for i=1:length(c)
    p(i) = sum(text_filter(y_train,c{i}))/length(y_train);

    for j=1:size(x_train)(2)
      p(i) = p(i) * sum(text_filter(x_train(text_filter(y_train,c{i}), j),x_train{k,j}))/sum(text_filter(y_train,c{i}));
    endfor
    
  endfor
  
  p = p/sum(p);
  
  [v,index] = max(p);
  ypred(k) = index;
  err(k) = ~isequal(y_train{k}, c{index});
endfor

%% Results
printf ("Erro de %d em %d: %d%%\n", sum(err), length(y_train), 100*(sum(err)/length(y_train)));
printf ("Acuracia de %d em %d: %d%%\n", length(y_train)-sum(err), length(y_train), 100*((length(y_train)-sum(err))/length(y_train)));

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
  if(sum(p)==0)
    k
    x_test(k)
  else
    p = p/sum(p);
  endif
  
  [v,index] = max(p);
  ypred(k) = index;
  err(k) = ~isequal(y_test{k}, c{index});
endfor

%% Results
printf ("Erro de %d em %d: %d%%\n", sum(err), length(y_test), 100*(sum(err)/length(y_test)));
printf ("Acuracia de %d em %d: %d%%\n", length(y_test)-sum(err), length(y_test), 100*((length(y_test)-sum(err))/length(y_test)));
