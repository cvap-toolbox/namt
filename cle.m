% Function cle
%     Close editor windows.
%
% usage
%     cle
%
% input
%
% output
%                  
% description:
%     Closes all editor open editor windows.
%
% author
%     Nils Bore, nbore@kth.se  

function cle()

editorObject = matlab.desktop.editor.getAll;
editorObject.close;

end