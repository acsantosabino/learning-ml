%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% calc probs
function model = bayesian(x,y)

  p = zeros(1,max(y));
  l = zeros(size(x)(1),3);
  e = zeros(size(x)(1),1);

  for i=1:max(y)
    p(i) = sum(y==i)/size(y)(1);
  endfor

  for i=1:size(x)(1)
    for j=1:max(y)
      cond = ones(size(x)(1),1);
      for c=1:size(x)(2)
        cond = cond & x(:,c)==x(i,c);
      endfor
      l(i,j) = sum(y(cond)==j) / size(x)(1);
    endfor
  endfor
  
  for i=1:size(x)(1)
    e(i) = sum(p .* l(i,:));
  endfor
  
  model = struct('e',e,'l',l,'p',p,'x',x);
  
endfunction
