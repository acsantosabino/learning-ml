%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function model = bayesian(x,y)
  c = unique(y)
  mu = cell(length(c),1);
  S = cell(length(c),1);
  R = cell(length(c),1);
  d = size(x)(2);
  
  for i=1:length(c)
    xi = x;
    xi(:,y!=c(i))=zeros(4,length(y(y!=c(i))));
    m = mean(xi,2);%(y==c(i), :));
    mu(i)= m;
    S(i) = (xi - m)*(xi- m)'/length(xi);
    R(i) = corrcoef(xi);
  endfor
  
  model = struct('mu',mu,'S',S,'R',R);
    
endfunction
