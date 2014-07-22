
function D = matpNorm( X , p, dim )
% function D = matpNorm( X , p, dim )
% Computes the row or column wise p-norm in a matrix.
%
% usage
%     D = matpNorm( X , p, dim )
% input
%     X : Matrix of row or column vectors
%     p : The type of p-norm we want. 
%     dim : Direction of norm - row=1 or column=2.
%
% output
%                  
% description
%     Computes the p-norm of each row or column of a matrix. 
%			Default is row wise 2-norm.
%
% author
%     Martin Hjelm, martinhjelm@kth.se  

	if nargin == 1
		p = 2;
    dim = 2;
  elseif nargin == 2
		dim = 2;
  elseif nargin == 0 
    error('Not enough input arguments!')
	end

  D = (sum( abs(X).^p, dim )).^(1/p);

end