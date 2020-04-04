function [values, colind, rowptr] = matrix_to_csr(A)
  [n n] = size(A);
  nz = 0;
  for i = 1:n
    for j = 1:n
      if (A(i,j) != 0)
        nz = nz + 1;
      end
    end
  end
  values = zeros(1,nz);
  colind = zeros(1,nz);
  rowptr = zeros(1,n+1);
  indice = 1;
  indire_rowptr = 1;
  for i = 1:n
    ok_line = 1;
    for j = 1:n
      if(A(i,j) != 0)
        values(indice) = A(i,j);
        colind(indice) = j;
        if(ok_line == 1)
          rowptr(indire_rowptr) = indice;
          ok_line = 0;
          indire_rowptr = indire_rowptr + 1;
        end
        indice = indice + 1;
      end
    end
  end 
  rowptr(indire_rowptr) = nz + 1;
endfunction