function cascade( removeMenus )
% function cascade( removeMenus )
% Directory file list retrival
%
% usage
%     cascade( removeMenus )
%
% input
%     removeMenus : Optional argument to remove menus in the plot window.
%
% output
%                
% description
%     Takes all the plots in the current work space and cascades them
%			across the screen, that is, it tiles them across the screen.
%
% author
if nargin < 1 
  removeMenus = 0;
end



% Matlab origo in screen coordinate system is in the left bottom corner...

% Find Existing Figures and sort them
%figs = findobj(0,'Type','figure'); 
figs = findall(0,'Type','figure');

% Get number of figures
N_figures = length(figs);

% Sort figures
figs = sort(figs);

% If no figures do nothing
if N_figures == 0
  return;
end

if removeMenus
  for n = 1:N_figures
    set(figs(n),'MenuBar','none','ToolBar','none');
  end
end
  
% Get size of Entire Screen
ss = get(0,'ScreenSize');
scrHeight = ss(4) * 1; 
scrWidth = ss(3) * 0.95;



% Get figure height, width ratio
pos = get(figs(1),'OuterPosition');
ratio = pos(3)/pos(4);

% PARAMETER ADJUSTS THE HEIGHT OF THE WINDOW
alpha = 0;

% Get best plot area given current picture ratio and screen estate
figHeight = sqrt ( (scrHeight*scrWidth) / (ratio * N_figures) ) - alpha;
figWidth = figHeight * ratio;

% If just 4 figure do nothing to figure heights but place them next 
% to each other in two rows
if N_figures < 5
  figHeight = pos(4);
  figWidth = pos(3);
end

% Change units to pixel while doing arranging of windows
units = get(figs,'Units');
set(figs,'Units','pixels');

% Set bottom of first figure and which row we are on
bot = scrHeight/.95 - figHeight;
rowFigs = 0;

% THIS PARAMETER PUSHES NEXT ROW WINDOWS DOWN A BIT
if N_figures < 5
  beta = 1;
else
  beta = 1;
end

% For all figures set position
for n = 1:N_figures
  % Set the position of the figure which is a 1x4 vector of position of
  % [left bottom width height]
  left = (n-1-rowFigs) * figWidth;
  % If too many windows in row start new
  if left+2*figWidth/3 > scrWidth
    left = 0;    
    bot = bot - beta * figHeight;
    rowFigs = n - 1;
  end  
  %disp(sprintf('%.0f  ',[left bot figWidth figHeight]))
  curPos =  get(figs(n),'OuterPosition');
  newPos = [left bot figWidth figHeight];
 % if sum(curPos - newPos ) > 0
    set(figs(n),'OuterPosition',[left bot figWidth figHeight]);    
    figure(figs(n));
  %end
end

% Change units back to original
if N_figures > 1
  set(figs,{'Units'},units);
end
