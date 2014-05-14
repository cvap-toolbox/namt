

function trid = tridiag (subdiag, maindiag, supdiag)
% function trid = tridiag (subdiag, maindiag, supdiag)
% Creates a (N,N) tri-diagonal matrix given sub-, sup- and main-diagonal vectors.
%
% usage
%     trid = tridiag (subdiag, maindiag, supdiag)
%
% input
%     subdiag : Vector of size N-1. 
%     maindiag : Vector of size N. 
%     supdiag : Vector of size N-1. 
%
% output
%                  
% description
%     Creates a (N,N) tri-diagonal matrix given sub-, sup- and main-diagonal vectors.
%
% author
%     Martin Hjelm, martinhjelm@kth.se  

  [N,M] = size(maindiag);
  if N == 1
  	N = M;
  end

  trid = diag(maindiag,0) + diag(supdiag(1:N-1),1) + diag(subdiag(1:N-1),-1);

end