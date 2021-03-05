% This MATLAB file is to scan the toolboxes requried
%
% Learn more from https://www.mathworks.com/help/matlab/matlab_prog/identify-dependencies.html#responsive_offcanvas
%
%
% Mar 5., 2021
% GERS Lab, UCONN
%

mfiles = dir('*.m');

fprintf('toolboxes required for each MATLAB file:\r');
toolboxesRequired = [];
for im = 1: length(mfiles)
    mfilename = mfiles(im).name;
    [fList,pList] = matlab.codetools.requiredFilesAndProducts(mfilename);
    toolboxesRequired = [toolboxesRequired, pList]; % append all toolboxs together
    
    % Display each item
    displayinfo = sprintf('(%02d/%02d) Finished scanningthe matlab file %s (requries', ...
            im, length(mfiles), mfilename);
    % Mutilple toolboxs requried for a single matlab file maybe
    for ip = 1: length(pList)
        switch ip
            case 1 % first 
                displayinfo = [displayinfo, ' ', pList(ip).Name];
            case length(pList) % end 
                displayinfo = [displayinfo, ' and ', pList(ip).Name];
            otherwise % other
                displayinfo = [displayinfo, ', ', pList(ip).Name];
        end
    end
    displayinfo = [displayinfo, ')'];
    fprintf('%s\r', displayinfo);
end


fprintf('\r');
fprintf('Summary of toolboxes requried:\r');
[~, idx] = unique({toolboxesRequired.Name}); 

for it = 1: length(idx)
    fprintf('%d. %s\r', it, toolboxesRequired(idx(it)).Name);
end
