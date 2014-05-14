

function D = diag2mat(X)
% function D = diag2mat( X )
% Creates a diagonal matrix of the input matrix.
%
% usage
%      D = diag2mat( X )
%
% input
%     X : M by N matrix.
%
% output
%                  
% description
%     Creates a diagonal matrix of the input matrix by running the diag
%     function in Matlab two times.
%
% author
%     Martin Hjelm, martinhjelm@kth.se  


D = diag(diag(X));

end