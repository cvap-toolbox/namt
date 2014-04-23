function fileList = getDirFileList ( dirName, varargin )
% function fileList = getDirFileList ( dirName, varargin )
% Directory file list retrival
%
% usage
%     fileList = getDirFileList ( dirName, varargin )
%
% input
%     dirName : Directory of the files.
%     varargin : Specific file extension.
%
% output
%     fileList : A cell array with the file names of the files in the 
%                specified directory.
%                
% description
%     Given a directory name the function returns a cell array of the 
%     containing the file names in the directory. If an specific file
%     extension is specified then it only returns the names of the files
%     with those extensions.
%     Possible extension extra argument for recursive search of
%     subdirectories.
%
% author
%     Martin Hjelm, martinhjelm@kth.se  


%   % Retrieve file names from the specified directory
%   if numel(varargin) > 0 && ~isempty(varargin)
%     % If a file extension was specified tell dir to 
%     % only get those.
%     files = dir( [ dirName,'/*.', varargin{1} ] )
%   else 
%     files = dir( dirName );
%   end
%   
  
  files = dir( dirName );
  
  % Retrieve only the file names from the struct array.
  N_dirItems = length(files);
  fileList = cell(0);
  
  N_files = 1;
  for i_item = 1:N_dirItems
    if ~strcmpi(files(i_item).name,'.') &&...
       ~strcmpi(files(i_item).name,'..') &&...
       ~strncmpi(files(i_item).name,'.',1) &&... 
       ~files(i_item).isdir
      if numel(varargin) > 0
        if ~isempty(strfind(files(i_item).name,['.',varargin{1}]))
          fileList{N_files} = [dirName,'/',files(i_item).name];
          N_files = N_files + 1;
        end
      else 
        fileList{N_files} = [dirName,'/',files(i_item).name];
        N_files = N_files + 1;
      end
    elseif ~strcmpi(files(i_item).name,'.') &&...
           ~strcmpi(files(i_item).name,'..') &&...
           ~strncmpi(files(i_item).name,'.',1) &&... 
           files(i_item).isdir
        if numel(varargin) > 0  
          fileList = [fileList,getDirFileList([dirName,'/',files(i_item).name],varargin{1})];
        else
          fileList = [fileList,getDirFileList([dirName,'/',files(i_item).name])];
        end
    end
  end

  
%   % Prune empty cells if any. 
  for i_item = 1:N_files-1
    if strcmp(fileList(i_item),'')
      fileList(i_item) = [];
    end
  end
   
end
