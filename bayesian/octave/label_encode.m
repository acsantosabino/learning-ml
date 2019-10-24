function dataset = label_encode(x)
  d = size(x)(2);
  dataset = x;
  for i=1:d
    c = unique(x(:,i));
    for k=1:length(c) 
      dataset(text_filter(dataset(:,i), c{k}), i) = k;
    end
  end
 end
 
 
function f = text_filter(a, t)
  f = cellfun(@(x) isequal(x, t ), a);
endfunction