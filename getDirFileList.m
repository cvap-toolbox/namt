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


  % Get files from specified directory
  if numel(varargin) > 0 
    % If a file extension was specified tell dir to 
    % only get those.
    files = dir( [ dirName,'/*.', varargin{1} ] );
  else 
    files = dir( dirName );
  end
  
  % Retrieve only the file names from the struct array.
  N_files = length(files);
  fileList = cell(N_files,1);
  
  for i_file = 1:N_files
    if ~strcmpi(files(i_file).name,'.') &&...
       ~strcmpi(files(i_file).name,'..') &&...
       ~strncmpi(files(i_file).name,'.',1) &&... 
       ~files(i_file).isdir
      fileList{i_file} = files(i_file).name;
    end
  end
  
  % Prune empty cells if any. 
  for i_file = 1:N_files
    if strcmp(fileList(i_file),'')
      fileList(i_file) = [];
    end
  end
   
end
