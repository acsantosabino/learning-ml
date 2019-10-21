%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             Bayesian - Arthur Santos                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% calc prediction
function pred = predict(model, x)
  
  mu = struct2cell(model)(1,:);
  S = struct2cell(model)(2,:);
  P = struct2cell(model)(3,:);
  p = zeros(length(x),length(mu));
  
  for j=1:length(mu)
    mi = cell2mat(mu(j));
    Si = cell2mat(S(j));
    Pi = cell2mat(P(j));
    for i = 1:length(x)
      xi = x(:,i);
      p(i,j) = xi' * (-1*inv(Si)/2) * xi + (inv(Si)*mi)'*xi -  mi' * (-1*inv(Si)/2) * mi - log(norm(Si))/2 + log(Pi);
    endfor   
  endfor
  
  [w, pred] = max(p,[],2);
  
endfunction
