function [data] = prepcoredata(filename, resolution)
%PREPCOREDATA prepares the xyz-data from sediment cores for further
% analysis
%
% Version 1.0 (24/04/2014)
% Version 1.1 (17/09/2014)
% Coded and developed by Jim van Belzen
% published under the Creative Commons Attribution Non-Commercial license 
% which allows users to read, copy, distribute and make derivative works 
% for noncommercial purposes from the material, as long as the author of 
% the original work is cited.
% This code comes with no warranties or support
% http://people.zeelandnet.nl/jbelzen/

tic

%%- import data
xyzdata=dlmread([filename,'.xyz']);

%%- define selection frame that becomes gridded
xmin=1;
xmax=11;

ymin=2;
ymax=14;

res=1/resolution;

%%- pre-process xyz-data
xlin=linspace(xmin, xmax, (xmax-xmin)*res);
ylin=linspace(ymin, ymax, (ymax-ymin)*res);
[X Y]=meshgrid(xlin, ylin);
F = TriScatteredInterp(xyzdata(:,1), xyzdata(:,2), xyzdata(:,3), 'nearest');

Z = F(X, Y);

Z1 = medfilt2(Z, [5 5]);

dlmwrite([filename,'_z.grid'], Z);
dlmwrite([filename,'_z_med.grid'], Z1);
dlmwrite('Selected_frame.txt',[xmin xmax ymin ymax res]);

data=Z;

toc
end


