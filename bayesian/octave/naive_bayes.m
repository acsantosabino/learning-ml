%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% calc probs
function ypred = naive_bayes(x_test)

  %% Read Dataset
  file = "../../data/weather.csv";
  x = readdataset(file,5);
  y = x(2:end,end);
  x = x(2:end,1:end-1);
   
  c = unique(y);
  p = zeros(1,length(c));

  for i=1:length(c)
    p(i) = sum(text_filter(y,c{i}))/length(y);
    
    for j=1:size(x)(2)
      p(i) = p(i) * sum(text_filter(x(text_filter(y,c{i}), j),x_test{j}))/sum(text_filter(y,c{i}));
    endfor
    
  endfor

  p = p/sum(p);
  
  [v,index] = max(p);
  ypred = c{index};
endfunction

function f = text_filter(a, t)
  f = cellfun(@(x) isequal(x, t ), a);
endfunction
