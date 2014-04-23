

function trid = tridiag (subdiag, maindiag, supdiag)

%   diag(ones(m,1),0)+diag(ones(m-1,1),1)+diag(ones(m-1,1),-1)
  
  [N,M] = size(maindiag);
  if N == 1
  	N = M;
  end

  trid = diag(maindiag,0)+diag(supdiag(1:N-1),1)+diag(subdiag(1:N-1),-1);

end