function myPlot3( X )
% function myPlot3( X )
% Plots a 3D data matrix in 3D
%
% usage
%     myPlot3( X )
%
% input
%     X : M by N data matrix. Where either M=3 or N=3
%
% output
%                  
% description
%     Given M by N data matrix, where either M=3 or N=3,
%     it makes a 3D point plot. 
%
% author
%     Martin Hjelm, martinhjelm@kth.se  
	
	[M,N] = size( X );

  if M == 3
  	figure;
  	plot3(X(:,1),X(:,2),X(:,3),'x');
  elseif N==3
		figure;
  	plot3(X(:,1),X(:,2),X(:,3),'x');
  else
  	error('Data matrix must be either N=3 or M=3!')
  end
  	

end
