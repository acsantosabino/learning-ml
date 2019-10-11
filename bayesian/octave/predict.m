%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% calc prediction
function pred = predict(model, x)
  
  pred = zeros(size(x)(1),1);
  cond = zeros(size(model.x)(1),1);
  
  for i=1:size(x)(1)
    b = ones(size(model.x)(1),1);
    for c=1:size(x)(2)
      b = b & model.x(:,c)==x(i,c);
    endfor
    cond = cond | b;
  endfor
  l = model.l(cond,:);
  e = model.e(cond);
    
  for i=1:size(x)(1)
    [a,pred(i)] = max(model.p .* l(i,:)/e(i));
  endfor
endfunction
