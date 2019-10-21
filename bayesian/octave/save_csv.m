function save_csv(filename, data)    [lines, cols] = size(data);    fid = fopen(filename, 'w');    for i=1:lines    for k=1:cols      if(k==cols)        fprintf(fid, "%s\n",data(i,k));      else        fprintf(fid, "%s,",data(i,k));      end    end      fprintf(fid, "\b\b\b")  end    fclose(fid)  
endfunction
