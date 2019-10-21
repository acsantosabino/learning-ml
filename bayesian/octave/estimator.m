%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function model = estimator(x,y)
  c = unique(y);
  mu = cell(length(c),1);
  S = cell(length(c),1);
  P = cell(length(c),1);
  d = size(x)(2);
  
  for i=1:length(c)
    ri = y==c(i);
    m = x*ri/sum(ri);
    mu(i)= m;
    S(i) = (x(:,ri) - m)*(x(:,ri)- m)'/sum(ri);
    P(i) = sum(y==c(i))/length(y);
  endfor
  
  model = struct('mu',mu,'S',S,'P',P);
    
endfunction
