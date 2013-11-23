function beepme(varargin)
% function beepMe(varargin)
% Ouputs a beep!
%
% usage
%     beepme( varargin )
%
% input
%     varargin : Specific sound length.
%
% output
%     Sound beep!
%                
% description
%			Outputs a sound beep of given length. Default is 50ms.     
%
% author
%     Martin Hjelm, martinhjelm@kth.se  

	if nargin
	  soundLength = varargin{1};
	else
	  soundLength = 50;
	end

	sound(repmat([0.1 0.1 0.1 0.1 0.3],1,soundLength), 2192);
 
end
