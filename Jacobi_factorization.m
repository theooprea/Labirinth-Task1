function [G_J, c_J] = Jacobi_factorization(A, b)
  [n n] = size(A);
  D = zeros(n);
  L = zeros(n);
  U = zeros(n);
  for i = 1:n
    D(i,i) = A(i,i);
  end
  L = tril(A) - D;
  U = triu(A) - D;
  N = D;
  P = - L - U;
  G_J = inv(N) * P;
  c_J = inv(N) * b;
endfunction
