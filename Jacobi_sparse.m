function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  [n m] = size(c);
  x0 = zeros(n,1);
  x = zeros(n,1);
  
  while true
    x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;
    err = norm(x - x0);
    if(err < tol)
      return;
    end
    x0 = x;
  end
endfunction