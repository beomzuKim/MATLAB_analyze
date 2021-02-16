

clear, clc, close all;

directory = '/Users/beomzukim/Documents/MATLAB/research/epsConvert';
fileList = struct2table(dir([directory, '/*.png']));


% [pathstr,name,ext] = fileparts('pcocam.png')

siz = size(fileList);

% ImageToEps(timing.png)/\


for i = 1:siz(1)
    a = fileList.name{i};
    ImageToEps(a);
end

