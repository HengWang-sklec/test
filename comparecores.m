function [output] = comparecores(filename1, filename2)
%COMPARECORES compares the 'images' of two sediment cores as prepared by
% the function "prepcoredata.m"
%
% [output] = the volume lost between image1 and image2 (resp. filename2 &
% filename2)
% information about x and y coordinates and resolution is retreaved from
% 'Selected_frame.txt' which is created by 'prepcoredata.m'
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

on=1;
off=0;

output = [];


%% load data
Z0=dlmread([filename1,'_z.grid']);
Z1=dlmread([filename2,'_z.grid']);
xy_frame=dlmread('Selected_frame.txt');

%%- define selection in images used for comparison
xmin=xy_frame(1);
xmax=xy_frame(2); 
ymin=xy_frame(3);
ymax=xy_frame(4);
res=xy_frame(5);

Diff=Z0-Z1;

%%Diff=Diff.*(Diff>0);

output=sum(Diff(:))*(1/res)^2;

%%- figure output
if off,
    figure('color','w'),
    subplot(1,3,1)
    imagesc([xmin:xmax],[ymin:ymax],Z0)
    axis image xy
    colorbar
    title('Z0')

    subplot(1,3,2)
    imagesc([xmin:xmax],[ymin:ymax],Z1)
    axis image xy
    colorbar
    title('Z1')

    subplot(1,3,3)
    imagesc([xmin:xmax],[ymin:ymax],Diff)
    axis image xy
    colorbar
    title('Diff.')
end

end

